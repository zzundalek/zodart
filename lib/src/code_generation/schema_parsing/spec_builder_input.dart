import 'package:code_builder/code_builder.dart';

import '../ctor/ctor.dart';
import 'schema_parsing.dart';

/// The base class representing the input required to build a code spec.
///
/// This class defines the common shape of all spec builder inputs, including:
/// - [refs]: A collection of shared references (types, imports, etc.)
/// - [schema]: The parsed schema representing the shape of data to generate code for.
///
/// Use [accept] with a [SpecBuilderInputVisitor] to dispatch behavior based on the specific subclass.
sealed class SpecBuilderInput {
  /// Creates a new [SpecBuilderInput].
  const SpecBuilderInput({required this.refs, required this.schema});

  /// Shared references used during code generation (e.g., for types or namespacing).
  final Refs refs;

  /// The parsed schema (input and output types) used for generation.
  final Schema schema;

  /// Accepts a [SpecBuilderInputVisitor] and dispatches to the appropriate subtype method.
  List<Spec> accept(SpecBuilderInputVisitor visitor);
}

/// Represents a [SpecBuilderInput] that generates a completely new class from scratch.
///
/// Used when an annotated class requests generation of a new output class.
class GenerateNewClassSpec extends SpecBuilderInput {
  /// Creates a new [GenerateNewClassSpec] with the given references and schema.
  const GenerateNewClassSpec({required super.refs, required super.schema});

  @override
  List<Spec> accept(SpecBuilderInputVisitor visitor) => visitor.visitGenerateNewClassSpecInput(this);
}

/// Represents a [SpecBuilderInput] that uses an existing class and constructor for code generation.
///
/// This is used when an annotation specifies an existing class.
class UseExistingClassSpec extends SpecBuilderInput {
  /// Creates a new [UseExistingClassSpec] with the given constructor, references, and schema.
  const UseExistingClassSpec({required this.ctor, required super.refs, required super.schema});

  /// The constructor selected from the target class that will be used to build the output object.
  final Ctor ctor;

  @override
  List<Spec> accept(SpecBuilderInputVisitor visitor) => visitor.visitUseExistingClassSpecInput(this);
}

/// Represents a [SpecBuilderInput] that uses record as output for code generation.
///
/// This is used when an annotation specifies a record.
class UseRecordSpec extends SpecBuilderInput {
  /// Creates a new [UseRecordSpec] with the given references, and schema.
  const UseRecordSpec({required super.refs, required super.schema});

  @override
  List<Spec> accept(SpecBuilderInputVisitor visitor) => visitor.visiCreateRecordSpecInput(this);
}
