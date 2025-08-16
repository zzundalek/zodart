import 'package:code_builder/code_builder.dart';

import '../../../schema_parsing/schema_parsing.dart';

/// Builds empty class stubs without implementation for new classes.
class NewClassSpecBuilder implements SpecBuilderInputVisitor {
  /// Create a new [NewClassSpecBuilder].
  const NewClassSpecBuilder();

  @override
  List<Spec> visitGenerateNewClassSpecInput(GenerateNewClassSpec specInput) {
    final refs = specInput.refs;

    final outputClass = Class(
      (c) => c
        ..name = refs.outputType
        ..docs.addAll([
          '/// Class used as an output for [${refs.schemaFieldPath}].',
        ])
        ..mixins.add(refer(refs.outputClassMixin))
        ..modifier = ClassModifier.final$
        ..abstract = true,
    );

    return [outputClass];
  }

  @override
  List<Spec> visitUseExistingClassSpecInput(UseExistingClassSpec specInput) => [];
}
