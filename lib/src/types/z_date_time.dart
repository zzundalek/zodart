part of 'types.dart';

/// Schema type representing a [DateTime] value.
///
/// Provides datetime-specific validation rules, processing and transformation functions.
///
/// Example:
/// ```dart
/// final dateTimeVal = ZDateTime();
/// final result = dateTimeVal.parse(DateTime.now());
/// ```
class ZDateTime extends ZBase<DateTime> implements ZTransformations<DateTime, DateTime> {
  /// Factory constructor that creates a new instance using the default configuration.
  factory ZDateTime() => ZDateTime._new();

  /// Internal constructor that initializes with a default DateTime parser.
  ZDateTime._new() : super._new(Parsing.buildIn(parseDateTime));

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZDateTime._withConfig(super.config) : super._withConfig();

  /// Adds a custom rule for DateTime validation/processing and returns a new `ZDateTime` instance.
  ZDateTime _addRule(ResRule<DateTime> validation) =>
      _validateBuildIn(constructor: ZDateTime._withConfig, validation: validation);

  /// Adds a rule to enforce that the DateTime must be after or equal to `min`.
  ZDateTime min(DateTime min) => _addRule(minDateTimeRule(min));

  /// Adds a rule to enforce that the DateTime must be before or equal to `max`.
  ZDateTime max(DateTime max) => _addRule(maxDateTimeRule(max));

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableDateTime nullable() => _nullable(constructor: ZNullableDateTime._withConfig);

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableDateTime optional() => _optional(constructor: ZNullableDateTime._withConfig);

  @override
  ZDateTime refine(Refiner<DateTime> refiner, {String? message, String? code}) => _refine(
    constructor: ZDateTime._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZDateTime superRefine(SuperRefiner<DateTime> refiner) => _superRefine(
    constructor: ZDateTime._withConfig,
    refiner: refiner,
  );

  @override
  ZDateTime process(Processor<DateTime> processor) => _processPure(
    constructor: ZDateTime._withConfig,
    processor: processor,
    isUserDefined: true,
  );
}
