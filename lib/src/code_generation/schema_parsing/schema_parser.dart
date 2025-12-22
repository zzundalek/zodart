import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart' hide RecordType;
import 'package:collection/collection.dart';
import 'package:fpdart/fpdart.dart';

import '../../utils/utils.dart';
import '../ctor/_ctor.dart';
import '../record/_record.dart';
import 'schema_parsing.dart';

/// Parses annotated Dart elements and extracts schema and constructor information.
///
/// Uses injected utilities:
/// - [ZTypeConverter] for converting Dart types (input) to ZodArt output types.
/// - [CtorElemsExtractor] to extract constructor elements.
/// - [BestCtorPicker] to pick the best matching constructor.
class SchemaParser {
  /// Creates a [SchemaParser] with required helpers.
  const SchemaParser({
    required this.zTypeConverter,
    required this.ctorElementsExtractor,
    required this.ctorPicker,
  });

  /// Utility that converts Dart types to ZodArt output types.
  final ZTypeConverter zTypeConverter;

  /// Picks the best constructor from a list of constructors.
  final BestCtorPicker ctorPicker;

  /// Utility that extracts constructor elements from a class element.
  final CtorElemsExtractor ctorElementsExtractor;

  /// Finds a static field named [fieldName] on [classElement], or `null` if not found.
  FieldElement? getStaticFieldByName(ClassElement classElement, String fieldName) =>
      classElement.fields.firstWhereOrNull((f) => f.name == fieldName && f.isStatic);

  /// Converts a list of named record fields to a map of field names to their Dart types.
  Map<String, DartType> toNamedFieldsMap(List<RecordTypeNamedField> namedFields) => {
    for (final field in namedFields) field.name: field.type,
  };

  /// Attempts to extract the [ClassElement] from the given [annotatedElement].
  ///
  /// Returns [NotAClass] error if not a class,
  /// or [NotAbstractClass] if the class is not abstract.
  Either<SchemaParsingError, ClassElement> getClassElement(Element annotatedElement) {
    return Right<SchemaParsingError, Element>(annotatedElement)
        .refineRightType<ClassElement>((annotatedElement) => const NotAClass())
        .flatMap(
          (classElement) => Either.fromPredicate(
            classElement,
            (e) => e.isAbstract,
            (e) => const NotAbstractClass(),
          ),
        );
  }

  /// Converts raw Dart types in [rawSchema] to a [SchemaMap], returning errors if conversion fails.
  Either<SchemaParsingError, SchemaMap> getSchema(Map<String, DartType> rawSchema) {
    final inOutSchemaOrErrorList = rawSchema.entries.map((entry) {
      final dartType = entry.value;
      final dartTypeStr = dartType.toString();
      final propertyName = entry.key;

      return Either<SchemaParsingError, String>.fromNullable(
        zTypeConverter.getOutType(dartType),
        () => InvalidSchemaPropertyType(
          dartTypeStr: dartTypeStr,
          propertyName: propertyName,
        ),
      ).map(
        (outType) => MapEntry(
          propertyName,
          (
            outType: outType,
            zType: dartTypeStr,
          ),
        ),
      );
    }).toList();

    return inOutSchemaOrErrorList.sequenceEither().map(Map.fromEntries);
  }

  /// Extracts the raw schema (field names and types) from the static schema field of [classElement].
  ///
  /// Validates that the schema field:
  /// - exists,
  /// - is a record type,
  /// - has no positional fields,
  /// - and is not empty.
  Either<SchemaParsingError, Map<String, DartType>> getRawSchema(
    ClassElement classElement,
    ZodArtAnnotation annotation,
  ) {
    return Either<SchemaParsingError, FieldElement>.fromNullable(
          getStaticFieldByName(classElement, annotation.schemaPropertyName),
          () => const MissingSchemaField(),
        )
        .map((schemaField) => schemaField.type)
        .refineRightType<RecordType>((_) => const SchemaFieldIsNotRecord())
        .flatMap(
          (schema) => Either.fromPredicate(
            schema,
            (schema) => schema.positionalFields.isEmpty,
            (_) => const SchemaContainsPositionalFields(),
          ),
        )
        .flatMap(
          (schema) => Either.fromPredicate(
            schema.namedFields,
            (namedFields) => namedFields.isNotEmpty,
            (_) => const SchemaIsEmpty(),
          ),
        )
        .map(toNamedFieldsMap);
  }

  /// Picks the best suitable constructor from the output class specified in [annotation],
  /// using the [outObjSchema] to match constructor parameters.
  ///
  /// Returns errors if the output class is nullable, unknown, has no public constructor,
  /// or if no usable constructor can be selected.
  Either<SchemaParsingError, Ctor> pickCtor({
    required ZodArtUseExistingClass annotation,
    required Map<String, Reference> outObjSchema,
  }) {
    return Either<SchemaParsingError, DartType>.fromPredicate(
          annotation.outputClassType,
          (outputType) => outputType.nullabilitySuffix != NullabilitySuffix.question,
          (_) => OutputTypeIsNullable(
            outputTypeName: annotation.outputClassType.getDisplayString(),
          ),
        )
        .flatMap(
          (outputType) => Either.fromNullable(
            outputType.element,
            () => const OutputClassIsUnknownType(),
          ),
        )
        .refineRightType<ClassElement>(
          (elementAny) => OutputClassIsWrongType(
            outputTypeName: elementAny.displayString(),
          ),
        )
        .flatMap(
          (outputClass) => Either.fromPredicate(
            ctorElementsExtractor(outputClass),
            (ctorElements) => ctorElements.isNotEmpty,
            (_) => OutputClassHasNoPublicCtor(
              outputClassName: outputClass.displayName,
            ),
          ),
        )
        .flatMap(
          (ctorElements) => pickBestCtor(ctorElements: ctorElements, schema: outObjSchema).mapLeft(
            (invalidCtor) => OutputClassHasNoUsableCtor(
              outputClassName: annotation.outputTypeName,
              pickedCtorName: invalidCtor.ctor.getDisplayName(),
              errorSummary: invalidCtor.errorsSummary,
            ),
          ),
        );
  }

  /// Validate the output record type specified in [annotation],
  /// against [outObjSchema].
  ///
  /// Returns errors if the output record is not a record, it is nullable
  /// or it doesn't conform to the output schema.
  Either<SchemaParsingError, Record> validateOutputRecord({
    required ZodArtUseRecord annotation,
    required Map<String, Reference> outObjSchema,
  }) {
    return Either<SchemaParsingError, DartType>.fromPredicate(
          annotation.outputRecordType,
          (outputType) => outputType.nullabilitySuffix != NullabilitySuffix.question,
          (_) => OutputTypeIsNullable(
            outputTypeName: annotation.outputRecordType.getDisplayString(),
          ),
        )
        .refineRightType<RecordType>(
          (dartType) => OutputRecordIsWrongType(
            outputTypeName: dartType.toString(),
          ),
        )
        .flatMap(
          (recordType) => validateRecord(recordType: recordType, schema: outObjSchema).mapLeft(
            (invalidRecord) => InvalidOutputRecord(errorSummary: invalidRecord.errorsSummary),
          ),
        );
  }

  /// Validates whether the given [className] is a valid Dart class identifier.
  bool isNewClassNameValid(String className) {
    final validClassNameRegex = RegExp(r'^_?[a-zA-Z][_a-zA-Z0-9]*$');
    return validClassNameRegex.hasMatch(className);
  }

  /// Parse [crossFieldValidators] and return either a list of validator names or [SchemaParsingError].
  Either<SchemaParsingError, List<String>> getCrossFieldValidatorsNames(List<DartObject> crossFieldValidators) {
    return crossFieldValidators
        .traverseEither(
          (item) => Either<SchemaParsingError, ExecutableElement>.fromNullable(
            item.toFunctionValue(),
            () => CrossFieldValidatorIsNotFunction(item.type.toString()),
          ),
        )
        /// Only const functions => must have a name
        .mapList((validator) => validator.name!);
  }

  GenerateNewClassSpec _getGenerateNewClassSpec(
    ZodArtGenerateNewClass annotation,
    String annotatedClassName,
    Schema schema,
    List<String> validatorNames,
  ) {
    return GenerateNewClassSpec(
      schema: schema,
      crossFieldValidators: validatorNames,
      refs: Refs(
        annotatedClassName: annotatedClassName,
        outputTypeName: annotation.outputTypeName,
        schemaFieldName: annotation.schemaPropertyName,
      ),
    );
  }

  UseExistingClassSpec _getUseExistingClassSpec(
    ZodArtUseExistingClass annotation,
    String annotatedClassName,
    Schema schema,
    Ctor ctor,
    List<String> validatorNames,
  ) {
    return UseExistingClassSpec(
      schema: schema,
      ctor: ctor,
      crossFieldValidators: validatorNames,
      refs: Refs(
        annotatedClassName: annotatedClassName,
        outputTypeName: annotation.outputTypeName,
        schemaFieldName: annotation.schemaPropertyName,
      ),
    );
  }

  UseRecordSpec _getZodArtUseRecordSpec(
    ZodArtUseRecord annotation,
    String annotatedClassName,
    Schema schema,
    List<String> validatorNames,
  ) {
    return UseRecordSpec(
      schema: schema,
      crossFieldValidators: validatorNames,
      refs: Refs(
        annotatedClassName: annotatedClassName,
        outputTypeName: annotation.outputTypeName,
        schemaFieldName: annotation.schemaPropertyName,
      ),
    );
  }

  /// Parses the annotated [element] with the given [annotation],
  /// extracting schema and constructor information to build a spec.
  ///
  /// Supports three annotation types:
  /// - [ZodArtGenerateNewClass]: validates output class name and generates a new class spec.
  /// - [ZodArtUseExistingClass]: picks a constructor and generates an existing class spec.
  /// - [ZodArtUseRecord]: creates the record typedef.
  Either<SchemaParsingError, SpecBuilderInput> parseAnnotatedElement(Element element, ZodArtAnnotation annotation) {
    final classElementOrError = getClassElement(element);

    // Note: add a fallback with regards to: https://github.com/dart-lang/sdk/issues/61026
    final annotatedClassNameOrError = classElementOrError.map((classElement) => classElement.name ?? '');

    final validatorsNamesOrError = getCrossFieldValidatorsNames(annotation.crossFieldValidators);

    final parseResultOrError = classElementOrError
        .flatMap((classElement) => getRawSchema(classElement, annotation))
        .flatMap(getSchema)
        .map(Schema.new);

    return switch (annotation) {
      ZodArtGenerateNewClass() => parseResultOrError.flatMap((parseResult) {
        return Either<SchemaParsingError, Schema>.fromPredicate(
          parseResult,
          (_) => isNewClassNameValid(annotation.outputClassName),
          (_) => InvalidNewClassName(newClassName: annotation.outputClassName),
        ).map3(
          annotatedClassNameOrError,
          validatorsNamesOrError,
          (parseResult, annotatedClassName, validatorNames) =>
              _getGenerateNewClassSpec(annotation, annotatedClassName, parseResult, validatorNames),
        );
      }),
      ZodArtUseExistingClass() => parseResultOrError.flatMap((parseResult) {
        return pickCtor(
          annotation: annotation,
          outObjSchema: parseResult.outSchema.mapValue(refer),
        ).map3(
          annotatedClassNameOrError,
          validatorsNamesOrError,
          (ctor, annotatedClassName, validatorNames) =>
              _getUseExistingClassSpec(annotation, annotatedClassName, parseResult, ctor, validatorNames),
        );
      }),
      ZodArtUseRecord() => parseResultOrError.flatMap((parseResult) {
        return validateOutputRecord(
          annotation: annotation,
          outObjSchema: parseResult.outSchema.mapValue(refer),
        ).map3(
          annotatedClassNameOrError,
          validatorsNamesOrError,
          (_, annotatedClassName, validatorNames) =>
              _getZodArtUseRecordSpec(annotation, annotatedClassName, parseResult, validatorNames),
        );
      }),
    };
  }
}
