import 'package:code_builder/code_builder.dart';
import 'package:fpdart/fpdart.dart';

import '../../../schema_parsing/schema_parsing.dart';

/// Build the utils class.
class UtilsSpecBuilder implements SpecBuilderInputVisitor {
  /// Create a new [UtilsSpecBuilder].
  const UtilsSpecBuilder();

  /// Returns the _toResult Method.
  ///
  /// The method is used in utils class generated at [buildUtils].
  Method buildToResult(Map<String, Reference> parsedValueFields, {required Refs refs}) {
    final toResultResMap = parsedValueFields.map(
      (name, reference) => MapEntry(name, CodeExpression(Code("val['$name'] as ${reference.symbol}"))),
    );

    final toResultRes = refer(refs.instantiateSchemaFn).call([], toResultResMap);

    return Method(
      (m) => m
        ..name = '_toResult'
        ..returns = refer(refs.outputType)
        ..lambda = true
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'val'
              ..type = refer('Map<String, dynamic>'),
          ),
        )
        ..body = toResultRes.code,
    );
  }

  /// Returns the _schemaMap field.
  ///
  /// The schema map is used in utils class generated at [buildUtils].
  Field buildSchemaMap(Map<String, Reference> parsedValueFields, {required Refs refs}) {
    final schemaPath = refs.schemaFieldPath;

    final toMapRes = literalMap(
      Map.fromEntries(
        parsedValueFields.keys.map(
          (field) => MapEntry(
            field,
            refer('$schemaPath.$field'),
          ),
        ),
      ),
    );

    return Field(
      (f) => f
        ..name = '_schemaMap'
        ..static = true
        ..modifier = FieldModifier.final$
        ..type = refer('Map<String, ZBase<dynamic>>')
        ..assignment = toMapRes.code,
    );
  }

  /// Returns the main utility class for working with the schema defined in the annotated class.
  Class buildUtils(
    Set<String> fieldNames, {
    required Refs refs,
    List<Field> fields = const [],
    List<Method> methods = const [],
  }) {
    final res = Class(
      (c) => c
        ..name = refs.utilsClass
        ..modifier = ClassModifier.final$
        ..implements.add(refer(refs.utilsInterface))
        ..docs.addAll([
          '/// Generated utility class for working with the schema defined in [${refs.annotatedClass}].',
          '///',
          '/// Provides:',
          '/// - The `ZObject` instance for parsing/validating the schema.',
          '/// - Enum-style access to the schema properties.',
          '/// - Strongly-typed field access',
          '/// - Runtime `Type` of the schema record',
        ])
        ..constructors.add(
          Constructor((c) => c..constant = true),
        )
        ..fields.addAll([
          Field(
            (f) => f
              ..name = '_props'
              ..static = true
              ..modifier = FieldModifier.constant
              ..assignment = Code('${refs.propsEnumWrapper}()'),
          ),
          Field(
            (f) => f
              ..name = '_keys'
              ..static = true
              ..modifier = FieldModifier.constant
              ..assignment = literalConstList(fieldNames.toList()).code,
          ),
          ...fields,
        ])
        ..methods.addAll([
          Method(
            (m) => m
              ..name = 'props'
              ..returns = refer(refs.propsEnumWrapper)
              ..type = MethodType.getter
              ..body = const Code('_props')
              ..annotations.add(refer('override'))
              ..lambda = true,
          ),
          Method(
            (m) => m
              ..name = 'keys'
              ..returns = refer('List<String>')
              ..type = MethodType.getter
              ..body = const Code('_keys')
              ..annotations.add(refer('override'))
              ..lambda = true,
          ),
          Method(
            (m) => m
              ..name = 'zObject'
              ..returns = refer('ZObject<${refs.outputType}>')
              ..type = MethodType.getter
              ..lambda = false
              ..body = Block.of([
                const Code('return '),
                refer(
                      'ZObject.withMapper',
                    )
                    .call(
                      const [CodeExpression(Code('_schemaMap'))],
                      const {'fromJson': CodeExpression(Code('_toResult'))},
                    )
                    .code,
                const Code(';'),
              ])
              ..annotations.add(refer('override')),
          ),
          Method(
            (m) => m
              ..name = 'schema'
              ..returns = refer('Type')
              ..lambda = true
              ..type = MethodType.getter
              ..body = Code(refs.schemaDefType)
              ..annotations.add(refer('override')),
          ),
          ...methods,
        ]),
    );
    return res;
  }

  /// Builds the utils class.
  List<Spec> build(SpecBuilderInput specInput) {
    final schema = specInput.schema;
    final refs = specInput.refs;
    final parsedValueFields = schema.outSchema.mapValue(refer);

    final schemaUtils = buildUtils(
      schema.propertyNames,
      fields: [
        buildSchemaMap(parsedValueFields, refs: refs),
      ],
      methods: [
        buildToResult(parsedValueFields, refs: refs),
      ],
      refs: refs,
    );

    return [schemaUtils];
  }

  @override
  List<Spec> visitGenerateNewClassSpecInput(GenerateNewClassSpec specInput) => build(specInput);

  @override
  List<Spec> visitUseExistingClassSpecInput(UseExistingClassSpec specInput) => build(specInput);
}
