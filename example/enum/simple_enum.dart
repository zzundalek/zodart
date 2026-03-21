// Ignore for the schema definition
// ignore_for_file: specify_nonobvious_property_types, avoid_print, cascade_invocations
import 'package:zodart/zodart.dart';

enum Color { red, green, blue }

final simpleEnumSchema = ZEnum.simple(enumValues: Color.values);

void main() {
  // Parse from a String
  simpleEnumSchema
      .parse('red')
      .match(
        (issues) => print('❌ Validation failed: ${issues.localizedSummary}'),
        (item) => print('🟢 Validation successful: $item'),
      );

  // Parse from an Enum
  simpleEnumSchema
      .parse(Color.green)
      .match(
        (issues) => print('❌ Validation failed: ${issues.localizedSummary}'),
        (item) => print('🟢 Validation successful: $item'),
      );
}
