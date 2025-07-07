part of 'types.dart';

/// Nullable version of [ZInt].
///
/// Allows the value to be `null`, skipping all validation in that case.
///
/// Example:
/// ```dart
/// final nullableInt = ZInt().nullable();
/// final result = nullableInt.parse(1);
/// ```
class ZNullableInt extends ZBase<int?> implements ZTransformations<int, int?> {
  ZNullableInt._withConfig(super.config) : super._withConfig();

  ZNullableInt _addRule(Rule<int> r) => ZNullableInt._withConfig(_config.addRule(RuleInt(r)));

  /// Adds a rule to enforce that the value must be greater than or equal to `min`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableInt min(int min) => _addRule(minNumRule(min));

  /// Adds a rule to enforce that the value must be less than or equal to `max`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableInt max(int max) => _addRule(maxNumRule(max));

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableInt optional() => ZNullableInt._withConfig(_config.makeOptional());

  @override
  ZNullableInt refine(Refiner<int> refiner, {String? message, String? code}) =>
      _addRule(refineRule(refiner, message: message, code: code));

  @override
  ZNullableInt superRefine(SuperRefiner<int> refiner) => _addRule(superRefineRule(refiner));

  @override
  ZNullableInt process(Processor<int> processor) => ZNullableInt._withConfig(_config.addProcessor(processor));
}
