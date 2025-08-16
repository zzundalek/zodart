import 'package:code_builder/code_builder.dart' hide RecordType;
import 'package:fpdart/fpdart.dart';

import '../../schema_parsing/schema_parsing.dart';
import '../../utils/class_utils.dart';
import '../base_generator_for_annotation.dart';
import 'spec_builders/spec_builders.dart';

/// A concrete generator that produces code for classes annotated with `@ZodArt`.
///
/// The [ZodArtGenerator] coordinates multiple [SpecBuilderInputVisitor]s to
/// transform parsed schema and annotation data into generated Dart code.
///
/// This generator extends [BaseGeneratorForAnnotation], leveraging its
/// infrastructure for annotation parsing, schema extraction, and error
/// formatting.
///
/// The generated code is assembled using a set of predefined visitors such as:
/// - [SchemaDefSpecBuilder]
/// - [PropsSpecBuilder]
/// - [NewClassImplSpecBuilder]
/// - [ExistingClassSpecBuilder]
/// - [UtilsSpecBuilder]
///
/// These visitors are responsible for generating different aspects of the
/// output, such as schema constants, class properties, implementations,
/// extensions, and utility methods.
class ZodArtGenerator extends BaseGeneratorForAnnotation {
  /// Creates a new [ZodArtGenerator] with the required utilities.
  ///
  /// - [schemaErrorFormatter]: Formats errors encountered while parsing schemas.
  /// - [schemaParser]: Parses the schema definitions from the annotated elements.
  /// - [annotationParser]: Parses raw `@ZodArt` annotations into typed data.
  const ZodArtGenerator({
    required super.schemaErrorFormatter,
    required super.schemaParser,
    required super.annotationParser,
  });

  static const _generators = <SpecBuilderInputVisitor>[
    SchemaDefSpecBuilder(),
    PropsSpecBuilder(),
    NewClassImplSpecBuilder(ClassBuilderUtils()),
    ExistingClassSpecBuilder(),
    UtilsSpecBuilder(),
  ];

  @override
  List<Spec> buildSpecs(SpecBuilderInput parseResult) => _generators.flatMap(parseResult.accept).toList();
}
