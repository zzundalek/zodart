import 'package:code_builder/code_builder.dart';

import 'spec_builder_input.dart';

/// A visitor interface for handling different types of [SpecBuilderInput].
///
/// This allows separation of logic for generating [Spec]s based on whether a new class
/// should be generated ([GenerateNewClassSpec]) or an existing constructor should be used ([UseExistingClassSpec]).
abstract class SpecBuilderInputVisitor {
  /// Visits a [GenerateNewClassSpec] input and returns a list of [Spec]s to generate.
  List<Spec> visitGenerateNewClassSpecInput(GenerateNewClassSpec specInput);

  /// Visits a [UseExistingClassSpec] input and returns a list of [Spec]s to generate.
  List<Spec> visitUseExistingClassSpecInput(UseExistingClassSpec specInput);
}
