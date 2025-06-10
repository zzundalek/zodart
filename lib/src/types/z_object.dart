part of 'types.dart';

/// Schema type representing an Object of type [T].
///
/// Wraps a schema to validate the object structure according to the provided `schema`
/// and maps parsed data to type [T] using `fromJson`.
///
/// Example:
/// ```dart
// final personSchema = ZObject.withMapper(
//   {
//     'firstName': ZString().min(1),
//     'lastName': ZString().min(1),
//     'age': ZInt().nullable().min(0),
//   },
//   fromJson: Person.fromJson,
// );

// final person = personSchema.parse({'firstName': 'Zod', 'lastName': 'Art'});
/// ```
class ZObject<T> extends ZBase<T> {
  /// Factory constructor that creates a new instance using the given [schema]
  /// for parsing and the [fromJson] function for mapping parsed data to type [T].
  factory ZObject.withMapper(ZSchema schema, {required ObjectMapper<T> fromJson}) => ZObject._new(schema, fromJson);

  ZObject._new(ZSchema schema, ObjectMapper<T> mapper) : super._new(ParseObject(parseObject<T>(schema, mapper)));

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableObject<T> nullable() => ZNullableObject<T>._withConfig(_config.makeNullable());

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableObject<T> optional() => ZNullableObject<T>._withConfig(_config.makeOptional());
}
