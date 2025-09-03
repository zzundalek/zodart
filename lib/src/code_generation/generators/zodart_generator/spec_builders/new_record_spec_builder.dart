import 'package:code_builder/code_builder.dart';
import 'package:fpdart/fpdart.dart';

import '../../../schema_parsing/schema_parsing.dart';

/// Builds a function to create record.
class NewRecordSpecBuilder implements SpecBuilderInputVisitor {
  /// Create a new [NewRecordSpecBuilder].
  const NewRecordSpecBuilder();

  /// Builds function to create the output record.
  Method buildInstatiateFn(Map<String, Reference> fields, {required Refs refs}) {
    final fieldToField = fields.map((name, reference) => MapEntry(name, refer(name)));

    final func = Method(
      (m) => m
        ..returns = refer(refs.outputType)
        ..name = refs.instantiateSchemaFn
        ..docs.addAll([
          '/// Creates the output record',
        ])
        ..lambda = true
        ..optionalParameters.addAll(
          fields.entries.map(
            (param) => Parameter(
              (p) => p
                ..name = param.key
                ..type = param.value
                ..required = true
                ..named = true,
            ),
          ),
        )
        ..body = literalRecord([], fieldToField).statement,
    );

    return func;
  }

  @override
  List<Spec> visitGenerateNewClassSpecInput(GenerateNewClassSpec specInput) => [];

  @override
  List<Spec> visitUseExistingClassSpecInput(UseExistingClassSpec specInput) => [];

  @override
  List<Spec> visiCreateRecordSpecInput(UseRecordSpec specInput) {
    final schema = specInput.schema;
    final refs = specInput.refs;

    final parsedValueFields = schema.outSchema.mapValue(refer);

    final buildRecordMethod = buildInstatiateFn(parsedValueFields, refs: refs);

    return [buildRecordMethod];
  }
}
