import 'package:code_builder/code_builder.dart' hide RecordType;
import 'package:fpdart/fpdart.dart';

import '../../schema_parsing/schema_parsing.dart';
import '../base_generator_for_annotation.dart';
import 'spec_builders/new_class_spec_builder.dart';

/// A lightweight code generator that creates only new class stubs from schema annotations.
///
/// [PreTypeGenerator] is used in the initial code generation step to produce
/// empty class shells based on the provided schema.
///
/// In subsequent generation steps, all implementation details (e.g., properties, methods,
/// utilities) will be added. This separation helps solve the
/// classic "chicken-and-egg problem" when dealing with interdependent schemas,
/// where the schema output type (class) must exist before it can be referenced elsewhere.
///
/// This generator is used to scaffold new types from schema definitions,
/// preparing the codebase for full generation in later stages.
///
/// Extends [BaseGeneratorForAnnotation], leveraging its schema parsing,
/// annotation conversion, and error formatting capabilities.
class PreTypeGenerator extends BaseGeneratorForAnnotation {
  /// Creates a new [PreTypeGenerator].
  ///
  /// Requires:
  /// - [schemaParser]: Parses schema records from the annotation target.
  /// - [schemaErrorFormatter]: Converts schema parsing errors into readable diagnostics.
  /// - [annotationParser]: Converts raw annotation data into a typed [ZodArtAnnotation].
  const PreTypeGenerator({
    required super.schemaParser,
    required super.schemaErrorFormatter,
    required super.annotationParser,
  });

  static const _generators = <SpecBuilderInputVisitor>[
    NewClassSpecBuilder(),
  ];

  @override
  List<Spec> buildSpecs(SpecBuilderInput parseResult) => _generators.flatMap(parseResult.accept).toList();
}
