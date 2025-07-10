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

  ZNullableString _addRule(ResRule<String> validation) =>
      _validateBuildIn(constructor: ZNullableString._withConfig, validation: validation);

  /// Adds a rule to enforce that the string length must be greater than or equal to `min`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableString min(int min) => _addRule(minStrLengthRule(min));

  /// Adds a rule to enforce that the string length must be less than or equal to `max`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableString max(int max) => _addRule(maxStrLengthRule(max));

  /// Adds a rule which trims the String value.
  ZNullableString trim() => _processPure<ZNullableString, String>(
    constructor: ZNullableString._withConfig,
    processor: (val) => val.trim(),
    isUserDefined: false,
  );

  /// Adds a transformation of current nullable [String] value to nullable [int].
  ZNullableInt toInt() => _transformBuildIn(constructor: ZNullableInt._withConfig, transformer: stringToInt);

  /// Adds a transformation of current nullable [String] value to nullable [double].
  ZNullableDouble toDouble() =>
      _transformBuildIn(constructor: ZNullableDouble._withConfig, transformer: stringToDouble);

  /// Adds a transformation of current nullable [String] value to nullable [DateTime].
  ZNullableDateTime toDateTime() =>
      _transformBuildIn(constructor: ZNullableDateTime._withConfig, transformer: stringToDateTime);

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableString optional() => _optional(constructor: ZNullableString._withConfig);

  @override
  ZNullableString refine(Refiner<String> refiner, {String? message, String? code}) => _refine(
    constructor: ZNullableString._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZNullableString superRefine(SuperRefiner<String> refiner) => _superRefine(
    constructor: ZNullableString._withConfig,
    refiner: refiner,
  );

  @override
  ZNullableString process(Processor<String> processor) => _processPure(
    constructor: ZNullableString._withConfig,
    processor: processor,
    isUserDefined: true,
  );
}
