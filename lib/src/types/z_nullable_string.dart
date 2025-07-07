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
class ZNullableString extends ZBase<String?> implements ZTransformations<String, String?> {
  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
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

  /// Adds a transformation of current nullable [String] value to nullable [DateTime].
  ZNullableDateTime toDateTime() =>
      ZNullableDateTime._withConfig(_config.addTransformation(TransformStringToDateTime(stringToDateTime)));

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableString optional() => ZNullableString._withConfig(_config.makeOptional());

  @override
  ZNullableString refine(Refiner<String> refiner, {String? message, String? code}) =>
      _addRule(refineRule(refiner, message: message, code: code));

  @override
  ZNullableString superRefine(SuperRefiner<String> refiner) => _addRule(superRefineRule(refiner));

  @override
  ZNullableString process(Processor<String> processor) => ZNullableString._withConfig(_config.addProcessor(processor));
}
