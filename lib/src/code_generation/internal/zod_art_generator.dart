// Will be migrated in new version automatically https://github.com/dart-lang/source_gen/issues/743
// ignore_for_file: deprecated_member_use

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart' as ana_type;
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';

import '../annotations.dart';
import 'refs.dart';
import 'z_type_converter.dart';

/// Static property name in the annotated class that holds the `ZObject` schema.
const _schemaPropertyName = 'schema';

/// Alias for `RecordType` from `analyzer` package
///
/// NOTE: `RecordType` from `analyzer` and `RecordType` from `code_builder` packages are needed
typedef AnalyzerRecordType = ana_type.RecordType;

/// Alias for `RecordTypeNamedField` from `analyzer` package.
typedef RecordTypeNamedField = ana_type.RecordTypeNamedField;

/// Parsed metadata from an annotated class, including the class name and its named fields.
typedef AnnotationParseRes = ({String className, List<RecordTypeNamedField> namedFields});

/// Represents a `(name, type)` tuple extracted from a [RecordTypeNamedField].
typedef NamedFieldWithType = (String name, String typeStr);

/// A code generator for classes annotated with [ZodArt].
///
/// This generator produces strongly-typed helper classes and type definitions
/// to bridge the gap between ZObject schema definition and its corresponding
/// mapper. It ensures type safety and consistency across schema usage, mapping,
/// and validation logic.
class ZodArtGenerator extends GeneratorForAnnotation<ZodArt> {
  /// Returns a list of all field names from the named fields of the given `RecordType`.
  List<String> getFieldNames(List<RecordTypeNamedField> namedFields) => namedFields.map((f) => f.name).toList();

  /// Returns a list of `(fieldName, typeAsString)` tuples from the named fields of the given `RecordType`.
  ///
  /// The type string is derived using `getDisplayString()` on each field's type.
  List<NamedFieldWithType> getFieldNamesWithType(List<RecordTypeNamedField> namedFields) =>
      namedFields.map((f) => (f.name, f.type.getDisplayString())).toList();

  /// Returns the main utility class for working with the schema defined in the annotated class.
  Class buildUtils(List<String> fieldNames, Refs refs, {required Expression shape}) {
    final recordFromMap = fieldNames.map((name) => "$name: val['$name']");
    final withMapperMethodBody =
        '''
        return ZObject.withMapper(
          shape.toMap(),
          fromJson: (val) {
            final rec = (${recordFromMap.join(',')}) as ${refs.schemaResType};
            return mapper(rec);
          },
        );        
      ''';

    final res = Class(
      (c) => c
        ..name = refs.utilsClass
        ..modifier = ClassModifier.final$
        ..implements.add(refer(refs.utilsInterface))
        ..docs.addAll([
          '/// Generated utility class for working with the schema defined in [${refs.annotatedClass}].',
          '///',
          '/// Provides access to:',
          '/// - The `ZObject` instance for parsing/validating the schema.',
          '/// - A `withMapper` function for mapping parsed record to custom objects.',
          '/// - A `shape` descriptor containing field mappings and runtime type info.',
          '/// - Enum-style access to the schema properties.',
        ])
        ..constructors.add(
          Constructor((c) => c..constant = true),
        )
        ..methods.addAll([
          Method(
            (m) => m
              ..name = 'props'
              ..returns = refer(refs.propsEnumWrapper)
              ..type = MethodType.getter
              ..body = Code('const ${refs.propsEnumWrapper}()')
              ..annotations.add(refer('override'))
              ..lambda = true,
          ),
          Method(
            (m) => m
              ..name = 'zObject'
              ..returns = refer('ZObject<${refs.schemaResType}>')
              ..type = MethodType.getter
              ..body = const Code('ZObject.withMapper(shape.toMap(), fromJson: shape.toRecord)')
              ..annotations.add(refer('override'))
              ..lambda = true,
          ),
          Method(
            (m) => m
              ..returns = refer('ZObject<T>')
              ..name = 'withMapper<T>'
              ..annotations.add(refer('override'))
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'mapper'
                    ..type = FunctionType(
                      (f) => f
                        ..returnType = refer('T')
                        ..requiredParameters.add(refer(refs.schemaResType)),
                    ),
                ),
              )
              ..body = Code(withMapperMethodBody),
          ),
          Method(
            (m) => m
              ..name = 'shape'
              ..returns = refer(refs.shapeType)
              ..type = MethodType.getter
              ..body = shape.code
              ..annotations.add(refer('override'))
              ..lambda = true,
          ),
        ]),
    );
    return res;
  }

  /// Returns a class wrapper around [buildPropsEnum] enum.
  ///
  /// Allows accesing the enum values as getters.
  Class buildPropsEnumWrapper(List<String> values, Refs refs) {
    final res = Class(
      (c) => c
        ..name = refs.propsEnumWrapper
        ..modifier = ClassModifier.final$
        ..docs.addAll([
          '/// Helper class for [${refs.annotatedClass}].',
          '///',
          '/// Wrapper used to access [${refs.propsEnum}] values as getters.',
        ])
        ..constructors.add(
          Constructor((c) => c..constant = true),
        )
        ..methods.addAll(
          values.map(
            (val) => Method(
              (m) => m
                ..name = val
                ..returns = refer(refs.propsEnum)
                ..type = MethodType.getter
                ..body = Code('${refs.propsEnum}.$val')
                ..lambda = true,
            ),
          ),
        ),
    );
    return res;
  }

  /// Returns an enum with values equal to the schema keys.
  Enum buildPropsEnum(List<String> values, Refs refs) {
    final res = Enum(
      (e) => e
        ..name = refs.propsEnum
        ..docs.addAll([
          '/// Enum for fields declared in [${refs.annotatedClass}].',
          '///',
          '/// Values mirror the keys of [${refs.annotatedClass}.$_schemaPropertyName].',
        ])
        ..values.addAll(
          values.map(
            (val) => EnumValue((e) => e..name = val),
          ),
        ),
    );

    return res;
  }

  /// Returns the shape record.
  ///
  /// The shape is used in utils class generated at [buildUtils].
  Expression buildShape(List<String> fieldNames, Refs refs) {
    final toMapRes = literalMap(
      Map.fromEntries(
        fieldNames.map(
          (field) => MapEntry(
            field,
            refer('${refs.annotatedClass}.$_schemaPropertyName.$field'),
          ),
        ),
      ),
    );

    final toRecordRes = literalRecord(
      [],
      Map.fromEntries(fieldNames.map((field) => MapEntry(field, Code("val['$field']")))),
    );

    final toMap = Method(
      (m) => m
        ..lambda = true
        ..body = toMapRes.code,
    ).closure;

    final toRecord = Method(
      (m) => m
        ..lambda = true
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'val'
              ..type = refer('Map<String, dynamic>'),
          ),
        )
        ..body = toRecordRes.code,
    ).closure;

    final shape = literalRecord([], {
      'toMap': toMap,
      'toRecord': toRecord,
      'result': refer(refs.schemaResType),
      'schema': refer(refs.schemaDefType),
      'keys': literalConstList(fieldNames),
    });

    return shape;
  }

  /// Builds a [TypeDef] representing the structure of the schema defined in the annotated class.
  ///
  /// The returned type matches the shape of the class’s schema field.
  TypeDef buildSchemaDefType(List<NamedFieldWithType> params, Refs refs) {
    final typedef = TypeDef(
      (t) => t
        ..name = refs.schemaDefType
        ..docs.addAll([
          '/// Inferred Dart type returned from the schema defined in [${refs.annotatedClass}].',
          '///',
          '/// This corresponds to the structure described by [${refs.annotatedClass}.$_schemaPropertyName].',
        ])
        ..definition = RecordType(
          (r) => r..namedFieldTypes.addEntries(params.map((p) => MapEntry(p.$1, refer(p.$2)))),
        ),
    );
    return typedef;
  }

  /// Builds a [TypeDef] representing the return type of `ZObject.parse()`
  /// for the schema defined in the annotated class.
  ///
  /// The returned type matches the successful result (value) of `ZObject.parse()` on the class's schema field.
  TypeDef buildSchemaResType(List<RecordTypeNamedField> namedFields, Refs refs) {
    final typedef = TypeDef(
      (t) => t
        ..name = refs.schemaResType
        ..docs.addAll([
          '/// Inferred Dart type representing the successful result (value).',
          '/// returned by `ZObject.parse()` for [${refs.annotatedClass}].',
          '///',
          '/// Derived from the schema defined in [${refs.annotatedClass}.$_schemaPropertyName].',
        ])
        ..definition = RecordType(
          (r) => r
            ..namedFieldTypes.addEntries(
              namedFields.map((f) => MapEntry(f.name, ZTypeConverter.getTypeReference(f.type))),
            ),
        ),
    );
    return typedef;
  }

  // TODO(zzundalek): separate to helper functions
  // TODO(zzundalek): add checks for the Z etc...
  /// Parses and validates the class annotated with [ZodArt] from the given [annotatedElement].
  ///
  /// Returns an [AnnotationParseRes] containing the class name and a list of named fields
  /// from a record type, which are used to build the schema definition.
  ///
  /// Throws an [InvalidGenerationSourceError] if the class is invalid or inconsistent with expectations.
  AnnotationParseRes parseAnnotatedClass(Element annotatedElement) {
    if (annotatedElement is! ClassElement) {
      throw InvalidGenerationSourceError('@ZodArt annotation can be used only on a class.', element: annotatedElement);
    }

    final classElement = annotatedElement;

    if (!classElement.isAbstract) {
      throw InvalidGenerationSourceError('@ZodArt - make the annotated class `abstract`.', element: annotatedElement);
    }
    final className = classElement.name;

    final staticFields = classElement.fields.where((field) => field.isStatic);

    final schemaField = staticFields.firstWhere(
      (f) => f.name == _schemaPropertyName,
      orElse: () => throw InvalidGenerationSourceError(
        '@ZodArt - missing static field `$_schemaPropertyName` in `$className`',
        element: classElement,
      ),
    );

    final schemaType = schemaField.type;

    if (schemaType is! AnalyzerRecordType) {
      throw InvalidGenerationSourceError(
        '@ZodArt `$className.$_schemaPropertyName` should be defined using Record.',
        element: schemaField,
      );
    }

    if (schemaType.positionalFields.isNotEmpty) {
      throw InvalidGenerationSourceError(
        '@ZodArt `$className.$_schemaPropertyName` should contain ONLY named fields.',
        element: schemaField,
      );
    }

    final namedFields = schemaType.namedFields;

    if (namedFields.isEmpty) {
      throw InvalidGenerationSourceError(
        '@ZodArt `$className.$_schemaPropertyName` cannot be empty.',
        element: schemaField,
      );
    }

    return (
      className: className,
      namedFields: namedFields,
    );
  }

  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    // Parses the annotated class, validates data consistency
    // returns the class name and a list of schema props
    final (:className, :namedFields) = parseAnnotatedClass(element);

    // Type names used across the code generation
    final refs = Refs(className);

    final namedFieldNames = getFieldNames(namedFields);

    final namedFieldsNamesWithTypes = getFieldNamesWithType(namedFields);

    final schemaDefType = buildSchemaDefType(namedFieldsNamesWithTypes, refs);

    final schemaResultType = buildSchemaResType(namedFields, refs);

    final schemaPropsEnum = buildPropsEnum(namedFieldNames, refs);

    final schemaProps = buildPropsEnumWrapper(namedFieldNames, refs);

    final shapeRecodForUtils = buildShape(namedFieldNames, refs);

    final schemaUtils = buildUtils(namedFieldNames, refs, shape: shapeRecodForUtils);

    final emitter = DartEmitter();

    // Returns the generated code
    return DartFormatter(
      languageVersion: DartFormatter.latestLanguageVersion,
    ).format(
      '${schemaDefType.accept(emitter)}'
      '${schemaResultType.accept(emitter)}'
      '${schemaPropsEnum.accept(emitter)}'
      '${schemaProps.accept(emitter)}'
      '${schemaUtils.accept(emitter)}',
    );
  }
}
