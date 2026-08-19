// Ignore for the schema definition
// ignore_for_file: specify_nonobvious_property_types, avoid_print
import 'package:collection/collection.dart';
import 'package:zodart/zodart.dart';

enum Status {
  success('SUCCESS'),
  failure('FAILURE');

  const Status(this.code);
  final String code;
}

Status? parseStatus(Object? val) => switch (val) {
  final Status status => status,
  final String code => Status.values.firstWhereOrNull((status) => status.code == code),
  _ => null,
};

final enhancedEnumSchema = ZEnum.withCustomParser(parseStatus);

void main() {
  // Parse from a String
  enhancedEnumSchema
      .parse('SUCCESS')
      .match(
        (issues) => print('❌ Validation failed: ${issues.localizedSummary}'),
        (item) => print('🟢 Validation successful: $item'),
      );

  // Parse from an Enum
  enhancedEnumSchema
      .parse(Status.success)
      .match(
        (issues) => print('❌ Validation failed: ${issues.localizedSummary}'),
        (item) => print('🟢 Validation successful: $item'),
      );

  // Invalid value
  enhancedEnumSchema
      .parse('success')
      .match(
        (issues) => print('❌ Validation failed: ${issues.localizedSummary}'),
        (item) => print('🟢 Validation successful: $item'),
      );
}
