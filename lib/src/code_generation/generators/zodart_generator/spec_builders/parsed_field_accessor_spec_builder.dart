import 'package:code_builder/code_builder.dart';

import '../../../schema_parsing/schema_parsing.dart';

/// Builds a class extending `ParsedFieldAccessor`.
///
/// Used to provide a type-safe version of ParsedFieldAccessor.
class ParsedFieldAccessorSpecBuilder implements SpecBuilderInputVisitor {
  /// Returns a new instance of [ParsedFieldAccessorSpecBuilder].
  const ParsedFieldAccessorSpecBuilder();

  /// Returns specs of a child class representing a strongly typed version of ParsedFieldAccessor.
  List<Spec> build(SpecBuilderInput specInput) {
    final refs = specInput.refs;
    final schema = specInput.schema;
    final successOutputSchema = schema.outSchema;

    final getters = successOutputSchema.entries.map((entry) {
      final MapEntry(key: fieldName, value: outputType) = entry;
      return Method(
        (m) => m
          ..name = fieldName
          ..type = MethodType.getter
          ..returns = refer(outputType)
          ..lambda = true
          ..body = Block.of([
            refer(
              'this',
            ).index(literalString(fieldName)).asA(refer(outputType)).code,
          ]),

        //
      );
    });

    final res = Class(
      (c) => c
        ..docs.addAll([
          '/// Type-safe parsed fields accessor for [${refs.annotatedClass}].',
        ])
        ..name = refs.parsedFieldAccessor
        ..extend = refer(refs.parsedFieldAccessorBaseClass)
        ..constructors.add(
          Constructor(
            (ctor) => ctor.requiredParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'schema'
                  ..toSuper = true,
              ),
              Parameter(
                (p) => p
                  ..name = 'parsedValues'
                  ..toSuper = true,
              ),
            ]),
          ),
        )
        ..methods.addAll(getters),
    );

    return [res];
  }

  @override
  List<Spec> visitGenerateNewClassSpecInput(GenerateNewClassSpec specInput) => build(specInput);

  @override
  List<Spec> visitUseExistingClassSpecInput(UseExistingClassSpec specInput) => build(specInput);

  @override
  List<Spec> visiCreateRecordSpecInput(UseRecordSpec specInput) => build(specInput);
}
