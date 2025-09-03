import 'package:code_builder/code_builder.dart';

import 'spec_builder_input.dart';

/// A visitor interface for handling different types of [SpecBuilderInput].
///
/// This allows separation of logic for generating [Spec]s based on whether a new class
/// should be generated ([GenerateNewClassSpec]), an existing constructor should be used ([UseExistingClassSpec])
/// or a record should be created ([UseRecordSpec]).
abstract class SpecBuilderInputVisitor {
  /// Visits a [GenerateNewClassSpec] input and returns a list of [Spec]s to generate.
  List<Spec> visitGenerateNewClassSpecInput(GenerateNewClassSpec specInput);

  /// Visits a [UseExistingClassSpec] input and returns a list of [Spec]s to generate.
  List<Spec> visitUseExistingClassSpecInput(UseExistingClassSpec specInput);

  /// Visits a [UseRecordSpec] input and returns a list of [Spec]s to generate.
  List<Spec> visiCreateRecordSpecInput(UseRecordSpec specInput);
}
