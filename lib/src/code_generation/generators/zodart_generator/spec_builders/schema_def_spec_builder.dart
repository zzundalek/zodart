import 'package:code_builder/code_builder.dart';
import 'package:fpdart/fpdart.dart';

import '../../../schema_parsing/schema_parsing.dart';

/// Builds the schema type.
class SchemaDefSpecBuilder implements SpecBuilderInputVisitor {
  /// Create a new [SchemaDefSpecBuilder].
  const SchemaDefSpecBuilder();

  /// Builds a [TypeDef] representing the structure of the schema defined in the annotated class.
  ///
  /// The returned type matches the shape of the class’s schema field.
  TypeDef buildSchemaDefType(Map<String, Reference> params, {required Refs refs}) {
    final typedef = TypeDef(
      (t) => t
        ..name = refs.schemaDefType
        ..docs.addAll([
          '/// Inferred Dart type returned from the schema defined in [${refs.annotatedClass}].',
          '///',
          '/// This corresponds to the structure described by [${refs.schemaFieldPath}].',
        ])
        ..definition = RecordType(
          (r) => r..namedFieldTypes.addAll(params),
        ),
    );
    return typedef;
  }

  /// Returns specs of schema definition entities.
  List<Spec> build(SpecBuilderInput specInput) {
    final schema = specInput.schema;
    final refs = specInput.refs;

    final schemaDefType = buildSchemaDefType(schema.zSchema.mapValue(refer), refs: refs);

    return [schemaDefType];
  }

  @override
  List<Spec> visitGenerateNewClassSpecInput(GenerateNewClassSpec specInput) => build(specInput);

  @override
  List<Spec> visitUseExistingClassSpecInput(UseExistingClassSpec specInput) => build(specInput);
}
