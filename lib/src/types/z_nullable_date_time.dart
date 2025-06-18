part of 'types.dart';

/// Nullable version of [ZDateTime].
///
/// Allows the value to be `null`, skipping all validation in that case.
///
/// Example:
/// ```dart
/// final nullableDateTimeVal = ZDateTime().nullable();
/// final result = nullableDateTimeVal.parse(DateTime.now());
/// ```
class ZNullableDateTime extends ZBase<DateTime?> implements ZTransformations<DateTime, DateTime?> {
  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZNullableDateTime._withConfig(super.config) : super._withConfig();

  ZNullableDateTime _addRule(Rule<DateTime> r) => ZNullableDateTime._withConfig(_config.addRule(RuleDateTime(r)));

  /// Adds a rule to enforce that the DateTime must be after or equal to `min`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableDateTime min(DateTime min) => _addRule(minDateTimeRule(min));

  /// Adds a rule to enforce that the DateTime must be before or equal to `max`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableDateTime max(DateTime max) => _addRule(maxDateTimeRule(max));

  @override
  ZNullableDateTime refine(Refiner<DateTime> refiner, {String? message, String? code}) =>
      _addRule(refineRule(refiner, message: message, code: code));
}
