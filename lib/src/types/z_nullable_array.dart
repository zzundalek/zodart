part of 'types.dart';

/// Nullable version of [ZArray].
///
/// Wraps a schema for the array elements and validates each item accordingly.
/// Allows the entire array value to be `null`, skipping all validation in that case.
///
/// Example:
/// ```dart
/// final nullableIntArray = ZArray(ZInt()).nullable();
/// final result = nullableIntArray.parse([1, 2, 3]);
/// ```
class ZNullableArray<T> extends ZBase<List<T>?> implements ZTransformations<List<T>, List<T>?> {
  ZNullableArray._withConfig(super.config) : super._withConfig();

  ZNullableArray<T> _addRule(Rule<List<T>> r) => ZNullableArray._withConfig(_config.addRule(RuleArray(r)));

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableArray<T> optional() => ZNullableArray._withConfig(_config.makeOptional());

  @override
  ZNullableArray<T> refine(Refiner<List<T>> refiner, {String? message, String? code}) =>
      _addRule(refineRule(refiner, message: message, code: code));

  @override
  ZNullableArray<T> superRefine(SuperRefiner<List<T>> refiner) => _addRule(superRefineRule(refiner));

  @override
  ZNullableArray<T> process(Processor<List<T>> processor) =>
      ZNullableArray<T>._withConfig(_config.addProcessor(processor));
}
