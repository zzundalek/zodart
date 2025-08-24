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
  ZString._new() : super._new(Parsing.buildIn(parseString));

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZString._withConfig(super.config) : super._withConfig();

  /// Adds a custom rule for String validation and returns a new `ZString` instance.
  ZString _addRule(ResRule<String> validation) =>
      _validateBuildIn(constructor: ZString._withConfig, validation: validation);

  /// Adds a rule to enforce that the string length must be greater than or equal to `min`.
  ZString min(int min) => _addRule(minStrLengthRule(min));

  /// Adds a rule to enforce that the string length must be less than or equal to `max`.
  ZString max(int max) => _addRule(maxStrLengthRule(max));

  /// Adds a rule which trims the String value.
  ZString trim() => _processPure<ZString, String>(
    constructor: ZString._withConfig,
    processor: (val) => val.trim(),
    isUserDefined: false,
  );

  /// Adds a transformation of current [String] value to [int].
  ZInt toInt() => _transformBuildIn(constructor: ZInt._withConfig, transformer: stringToInt);

  /// Adds a transformation of current [String] value to [double].
  ZDouble toDouble() => _transformBuildIn(
    constructor: ZDouble._withConfig,
    transformer: stringToDouble,
  );

  /// Adds a transformation of current [String] value to [DateTime].
  ZDateTime toDateTime() => _transformBuildIn(
    constructor: ZDateTime._withConfig,
    transformer: stringToDateTime,
  );

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableString nullable() => _nullable(constructor: ZNullableString._withConfig);

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableString optional() => _optional(constructor: ZNullableString._withConfig);

  /// Adds a rule to enforce that the string matches a regular expression string at [regex].
  ///
  /// Uses RegExp.hasMatch() internally.
  ZString regex(String regex, {String? message, String? code}) => _addRule(
    regexRule(
      regex,
      message: message,
      code: code,
    ),
  );

  @override
  ZString refine(Refiner<String> refiner, {String? message, String? code}) => _refine(
    constructor: ZString._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZString superRefine(SuperRefiner<String> refiner) => _superRefine(
    constructor: ZString._withConfig,
    refiner: refiner,
  );

  @override
  ZString process(Processor<String> processor) => _processPure(
    constructor: ZString._withConfig,
    processor: processor,
    isUserDefined: true,
  );
}
