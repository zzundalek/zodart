// Example file
// ignore_for_file: avoid_print, specify_nonobvious_property_types

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zodart/zodart.dart';

part 'transformations.freezed.dart';
part 'transformations.zodart.dart';
part 'transformations.zodart.type.dart';

@ZodArt.generateNewClass(outputClassName: 'LanguageDetail')
abstract class LanguageDetailSchema {
  static final schema = (
    name: ZString(),
    version: ZString().optional(),
    lastUpdate: ZDateTime(),
    notes: ZArray(ZString()).nullable(),
  );

  static const z = _LanguageDetailSchemaUtils();
  static final ZObject<LanguageDetail> zObject = z.zObject;
}

@freezed
abstract class Language with _$Language {
  const factory Language({
    required String name,
    required String version,
  }) = _Language;
}

Language toLang(LanguageDetail l) => Language(name: l.name, version: l.version ?? 'Not available');

void main() {
  final languageDetailsSchema = LanguageDetailSchema.zObject;
  final languageSchema = languageDetailsSchema.toObj(toLang);

  final res = languageSchema.parse({
    'name': 'Dart',
    'version': '3.9.0',
    'lastUpdate': DateTime.parse('2025-08-13'),
    'notes': null,
  });

  print(res.value); // Language(name: Dart, version: 3.9.0)
}
