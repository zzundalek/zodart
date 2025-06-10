part of 'types.dart';

/// Nullable version of [ZObject].
///
/// Wraps a schema to validate the object structure according to the provided `schema`
/// and maps parsed data to type [T] using `fromJson`.
///
/// Allows the value to be `null`, skipping all validation in that case.
///
/// Example:
/// ```dart
/// final personSchema = ZObject.withMapper(
///   {
///     'firstName': ZString().min(1),
///     'lastName': ZString().min(1),
///     'age': ZInt().nullable().min(0),
///   },
///   fromJson: Person.fromJson,
/// ).nullable();
///
/// final nullablePerson = personSchema.parse({'firstName': 'Zod', 'lastName': 'Art'});
/// ```
class ZNullableObject<T> extends ZBase<T?> {
  ZNullableObject._withConfig(super.config) : super._withConfig();
}
