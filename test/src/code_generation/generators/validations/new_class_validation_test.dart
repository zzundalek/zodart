import 'package:source_gen_test/src/build_log_tracking.dart';
import 'package:source_gen_test/src/init_library_reader.dart';
import 'package:source_gen_test/src/test_annotated_classes.dart';
import 'package:zodart/src/code_generation/annotations.dart';
import 'package:zodart/src/code_generation/ctor/_ctor.dart';
import 'package:zodart/src/code_generation/generators/pre_type_generator/pre_type_generator.dart';
import 'package:zodart/src/code_generation/generators/zodart_generator/zodart_generator.dart';
import 'package:zodart/src/code_generation/schema_parsing/schema_parsing.dart';

const preTypeGenerator = PreTypeGenerator(
  annotationParser: ZodArtAnnotation.fromAnnotatedElement,
  schemaErrorFormatter: SchemaParsingErrorFormatter(),
  schemaParser: SchemaParser(
    zTypeConverter: ZTypeConverter(),
    ctorElementsExtractor: getPublicCtorElements,
    ctorPicker: pickBestCtor,
  ),
);

const zodArtGenerator = ZodArtGenerator(
  annotationParser: ZodArtAnnotation.fromAnnotatedElement,
  schemaErrorFormatter: SchemaParsingErrorFormatter(),
  schemaParser: SchemaParser(
    zTypeConverter: ZTypeConverter(),
    ctorElementsExtractor: getPublicCtorElements,
    ctorPicker: pickBestCtor,
  ),
);

Future<void> main() async {
  final reader = await initializeLibraryReaderForDirectory(
    'test/src/code_generation/generators/validations',
    'new_class_validation_src.dart',
  );

  initializeBuildLogTracking();
  testAnnotatedElements<ZodArt>(reader, preTypeGenerator);
  testAnnotatedElements<ZodArt>(reader, zodArtGenerator);
}
