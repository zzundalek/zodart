import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../ctor/ctor_picker.dart';
import '../generators/zodart_generator/zodart_generator.dart';
import '../schema_parsing/schema_parsing.dart';

/// ZodArt builder
Builder zodArtBuilder(BuilderOptions options) => PartBuilder(const [
  ZodArtGenerator(
    annotationParser: ZodArtAnnotation.fromAnnotatedElement,
    schemaErrorFormatter: SchemaParsingErrorFormatter(),
    schemaParser: SchemaParser(
      zTypeConverter: ZTypeConverter(),
      ctorElementsExtractor: getPublicCtorElements,
      ctorPicker: pickBestCtor,
    ),
  ),
], '.zodart.dart');
