part of 'types.dart';

/// Schema type representing a [String] value.
///
/// Provides string-specific validation rules, processing and transformation functions.
///
/// Example:
/// ```dart
/// final stringVal = ZString();
/// final result = stringVal.parse('ZodArt');
/// ```
class ZString extends ZBase<String> implements ZTransformations<String, String> {
  /// Factory constructor that creates a new instance using the default configuration.
  factory ZString() => ZString._new();

  /// Internal constructor that initializes with a default String parser.
  ZString._new() : super._new(ParseString(parseString));

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZString._withConfig(super.config) : super._withConfig();

  /// Adds a custom rule for String validation/processing and returns a new `ZString` instance.
  ZString _addRule(Rule<String> r) => ZString._withConfig(_config.addRule(RuleString(r)));

  /// Adds a rule to enforce that the string length must be greater than or equal to `min`.
  ZString min(int min) => _addRule(minStrLengthRule(min));

  /// Adds a rule to enforce that the string length must be less than or equal to `max`.
  ZString max(int max) => _addRule(maxStrLengthRule(max));

  /// Adds a rule which trims the String value.
  ZString trim() => _addRule(trimRule());

  /// Adds a transformation of current [String] value to [int].
  ZInt toInt() => ZInt._withConfig(_config.addTransformation(TransformStringToInt(stringToInt)));

  /// Adds a transformation of current [String] value to [double].
  ZDouble toDouble() => ZDouble._withConfig(_config.addTransformation(TransformStringToDouble(stringToDouble)));

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableString nullable() => ZNullableString._withConfig(_config.makeNullable());

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableString optional() => ZNullableString._withConfig(_config.makeOptional());

  @override
  ZString refine(Refiner<String> refiner, {String? message, String? code}) =>
      _addRule(refineRule(refiner, message: message, code: code));
}
