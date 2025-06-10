part of 'types.dart';

/// Nullable version of [ZDouble].
///
/// Allows the value to be `null`, skipping all validation in that case.
///
/// Example:
/// ```dart
/// final nullableDouble = ZDouble().nullable();
/// final result = nullableDouble.parse(1.0);
/// ```
class ZNullableDouble extends ZBase<double?> {
  ZNullableDouble._withConfig(super.config) : super._withConfig();

  ZNullableDouble _addRule(Rule<double> r) => ZNullableDouble._withConfig(_config.addRule(RuleDouble(r)));

  /// Adds a rule to enforce that the value must be greater than or equal to `min`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableDouble min(double min) => _addRule(minNumRule(min));

  /// Adds a rule to enforce that the value must be less than or equal to `max`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableDouble max(double max) => _addRule(maxNumRule(max));
}
