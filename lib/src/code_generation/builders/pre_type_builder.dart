import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart' show PartBuilder;

import '../ctor/_ctor.dart';
import '../generators/pre_type_generator/pre_type_generator.dart';
import '../schema_parsing/schema_parsing.dart';

/// Builder which generates empty 'shells' for new types to be used in other builders.
Builder preTypeBuilder(BuilderOptions options) => PartBuilder(const [
  PreTypeGenerator(
    annotationParser: ZodArtAnnotation.fromAnnotatedElement,
    schemaErrorFormatter: SchemaParsingErrorFormatter(),
    schemaParser: SchemaParser(
      zTypeConverter: ZTypeConverter(),
      ctorElementsExtractor: getPublicCtorElements,
      ctorPicker: pickBestCtor,
    ),
  ),
], '.zodart.type.dart');
