import 'package:code_builder/code_builder.dart';
import 'package:fpdart/fpdart.dart';

import '../../../schema_parsing/schema_parsing.dart';

/// Build the utils class.
class UtilsSpecBuilder implements SpecBuilderInputVisitor {
  /// Create a new [UtilsSpecBuilder].
  const UtilsSpecBuilder();

  /// Returns the shape record.
  ///
  /// The shape is used in utils class generated at [buildUtils].
  Expression buildShape(Map<String, Reference> parsedValueFields, {required Refs refs}) {
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

    final toResultResMap = parsedValueFields.map(
      (name, reference) => MapEntry(name, CodeExpression(Code("val['$name'] as ${reference.symbol}"))),
    );

    final toResultRes = refer(refs.instantiateSchemaFn).call([], toResultResMap);

    final toSchemaMap = Method(
      (m) => m
        ..lambda = true
        ..body = toMapRes.code,
    ).closure;

    final toResult = Method(
      (m) => m
        ..lambda = true
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'val'
              ..type = refer('Map<String, dynamic>'),
          ),
        )
        ..body = toResultRes.code,
    ).closure;

    final shape = literalRecord([], {
      'toSchemaMap': toSchemaMap,
      'toResult': toResult,
      'result': refer(refs.outputType),
      'schema': refer(refs.schemaDefType),
      'keys': literalConstList(parsedValueFields.keys.toList()),
    });

    return shape;
  }

  /// Returns the main utility class for working with the schema defined in the annotated class.
  Class buildUtils(Set<String> fieldNames, {required Expression shape, required Refs refs}) {
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
              ..returns = refer('ZObject<${refs.outputType}>')
              ..type = MethodType.getter
              ..body = const Code('return ZObject.withMapper(shape.toSchemaMap(), fromJson: shape.toResult);')
              ..annotations.add(refer('override')),
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

  /// Builds the utils class.
  List<Spec> build(SpecBuilderInput specInput) {
    final schema = specInput.schema;
    final refs = specInput.refs;

    final shapeRecodForUtils = buildShape(schema.outSchema.mapValue(refer), refs: refs);
    final schemaUtils = buildUtils(schema.propertyNames, shape: shapeRecodForUtils, refs: refs);

    return [schemaUtils];
  }

  @override
  List<Spec> visitGenerateNewClassSpecInput(GenerateNewClassSpec specInput) => build(specInput);

  @override
  List<Spec> visitUseExistingClassSpecInput(UseExistingClassSpec specInput) => build(specInput);
}
