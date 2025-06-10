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
class ZNullableInt extends ZBase<int?> {
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
}
