import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart' show DartEmitter, Spec;
import 'package:dart_style/dart_style.dart';
import 'package:fpdart/fpdart.dart';
import 'package:source_gen/source_gen.dart';

import '../annotations.dart';
import '../schema_parsing/schema_parsing.dart';

/// A base class for code generators targeting the [ZodArt] annotation.
///
/// This class is intended to be extended by generators that process classes
/// annotated with `@ZodArt`. It provides utilities for parsing annotations,
/// extracting schema definitions, and formatting schema parsing errors.
///
/// Subclasses must implement [buildSpecs] to generate the list of `Spec`
/// objects representing the generated code.
abstract class BaseGeneratorForAnnotation extends GeneratorForAnnotation<ZodArt> {
  /// Creates a new [BaseGeneratorForAnnotation].
  ///
  /// All required utilities must be provided:
  /// - [annotationParser]: Converts the raw annotation into a type-safe representation.
  /// - [schemaParser]: Extracts schema definitions from the annotated element.
  /// - [schemaErrorFormatter]: Formats any parsing errors into readable messages.
  const BaseGeneratorForAnnotation({
    required this.schemaParser,
    required this.schemaErrorFormatter,
    required this.annotationParser,
  });

  /// Utility that converts the raw annotation to a type-safe annotation.
  final ZodArtAnnotation Function({required ConstantReader rawAnnotation}) annotationParser;

  /// Utility used to parse the schema.
  final SchemaParser schemaParser;

  /// Utility to obtain human-readable errors produced by [SchemaParser].
  final SchemaParsingErrorFormatter schemaErrorFormatter;

  /// Builds the list of code specifications (`Spec`) to be generated.
  ///
  /// Called during [generateForAnnotatedElement] after the annotation and schema
  /// have been parsed successfully.
  ///
  /// Implement this method in subclasses to define how the generated code should
  /// be constructed based on the parsed input.
  List<Spec> buildSpecs(SpecBuilderInput parseResult);

  @override
  dynamic generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final zodArtAnnotation = annotationParser(rawAnnotation: annotation);

    final parseResult = schemaParser
        .parseAnnotatedElement(element, zodArtAnnotation)
        .match(
          (parseError) => throw InvalidGenerationSourceError(
            schemaErrorFormatter.getErrorText(
              parseError,
              (
                annotatedElementName: element.name ?? element.displayString(),
                schemaPropertyName: zodArtAnnotation.schemaPropertyName,
              ),
            ),
            element: element,
          ),
          identity,
        );

    final specs = buildSpecs(parseResult);

    final emitter = DartEmitter();
    final output = specs.map((spec) => spec.accept(emitter)).join(' ');

    // Returns the generated code
    return DartFormatter(
      languageVersion: DartFormatter.latestLanguageVersion,
    ).format(output);
  }
}
