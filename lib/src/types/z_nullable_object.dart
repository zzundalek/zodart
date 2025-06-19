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
class ZNullableObject<T> extends ZBase<T?> implements ZTransformations<T, T?> {
  ZNullableObject._withConfig(super.config) : super._withConfig();

  ZNullableObject<T> _addRule(Rule<T> r) => ZNullableObject<T>._withConfig(_config.addRule(RuleObject(r)));

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableObject<T> optional() => ZNullableObject._withConfig(_config.makeOptional());

  @override
  ZNullableObject<T> refine(Refiner<T> refiner, {String? message, String? code}) =>
      _addRule(refineRule(refiner, message: message, code: code));
}
