import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'zod_art_generator.dart';

/// ZodArt builder
Builder zodArtBuilder(BuilderOptions options) => PartBuilder([const ZodArtGenerator()], '.zodart.dart');
