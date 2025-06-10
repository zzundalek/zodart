part of 'types.dart';

/// Nullable version of [ZString].
///
/// Allows the value to be `null`, skipping all validation in that case.
///
/// Example:
/// ```dart
/// final nullableString = ZString().nullable();
/// final result = nullableString.parse('ZodArt');
/// ```
class ZNullableString extends ZBase<String?> {
  ZNullableString._withConfig(super.config) : super._withConfig();

  ZNullableString _addRule(Rule<String> r) => ZNullableString._withConfig(_config.addRule(RuleString(r)));

  /// Adds a rule to enforce that the string length must be greater than or equal to `min`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableString min(int min) => _addRule(minStrLengthRule(min));

  /// Adds a rule to enforce that the string length must be less than or equal to `max`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableString max(int max) => _addRule(maxStrLengthRule(max));

  /// Adds a rule which trims the String value.
  ZNullableString trim() => _addRule(trimRule());

  /// Adds a transformation of current nullable [String] value to nullable [int].
  ZNullableInt toInt() => ZNullableInt._withConfig(_config.addTransformation(TransformStringToInt(stringToInt)));

  /// Adds a transformation of current nullable [String] value to nullable [double].
  ZNullableDouble toDouble() =>
      ZNullableDouble._withConfig(_config.addTransformation(TransformStringToDouble(stringToDouble)));
}
