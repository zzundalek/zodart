// Example file
// ignore_for_file: avoid_print, specify_nonobvious_property_types

import 'package:zodart/zodart.dart';

/// The String cannot be empty and is trimmed after the parse
final minSchema = ZString().trim().min(1);

/// Extends the [minSchema] and adds rule that the String must be max 10 characters long
final minMaxSchema = minSchema.max(10);

/// Extends the [minMaxSchema] and adds rule that the String can be `null`
final minMaxNullableSchema = minMaxSchema.nullable();

/// Extends the [minMaxNullableSchema] and conversion from String to Int in the end
final composedNullableIntSchema = minMaxNullableSchema.toInt();

/// Object schema composed from previously defined schemas, returns a Dart Record (String, int)
final objSchema = ZObject<(String, int)>.withMapper(
  {
    'str': minSchema,
    'int': composedNullableIntSchema,
  },
  fromJson: (map) => (map['str'], map['int']),
);

void main() {
  // Returns: true (empty string after trim, violates min(1) rule)
  minSchema.parse('     ').isError;

  // Returns: 'ZodArt'
  minSchema.parse(' ZodArt  ').value;

  // Returns: 'ZodArt'
  minMaxSchema.parse(' ZodArt ').value;

  // Returns: true
  minMaxNullableSchema.parse(null).isSuccess;

  // Returns: 105
  composedNullableIntSchema.parse(' 105  ').value;

  // Returns: true
  composedNullableIntSchema.parse(null).isSuccess;

  // Returns error message: Failed to parse value 'ZodArt', from String to int.
  composedNullableIntSchema.parse('ZodArt').issueSummary;

  // Returns: ('ZodArt', 100)
  objSchema.parse({'str': 'ZodArt', 'int': ' 100 '}).value;
}
