import 'package:source_gen_test/src/build_log_tracking.dart';
import 'package:source_gen_test/src/init_library_reader.dart';
import 'package:source_gen_test/src/test_annotated_classes.dart';
import 'package:zodart/src/code_generation/annotations.dart';
import 'package:zodart/src/code_generation/internal/zod_art_generator.dart';

Future<void> main() async {
  final reader = await initializeLibraryReaderForDirectory(
    'test/src/code_generation',
    'full_schema_src.dart',
  );

  initializeBuildLogTracking();
  testAnnotatedElements<ZodArt>(
    reader,
    const ZodArtGenerator(),
  );
}
