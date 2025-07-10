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

  ZNullableDateTime _addRule(ResRule<DateTime> validation) =>
      _validateBuildIn(constructor: ZNullableDateTime._withConfig, validation: validation);

  /// Adds a rule to enforce that the DateTime must be after or equal to `min`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableDateTime min(DateTime min) => _addRule(minDateTimeRule(min));

  /// Adds a rule to enforce that the DateTime must be before or equal to `max`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableDateTime max(DateTime max) => _addRule(maxDateTimeRule(max));

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableDateTime optional() => _optional(constructor: ZNullableDateTime._withConfig);

  @override
  ZNullableDateTime refine(Refiner<DateTime> refiner, {String? message, String? code}) => _refine(
    constructor: ZNullableDateTime._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZNullableDateTime superRefine(SuperRefiner<DateTime> refiner) => _superRefine(
    constructor: ZNullableDateTime._withConfig,
    refiner: refiner,
  );

  @override
  ZNullableDateTime process(Processor<DateTime> processor) => _processPure(
    constructor: ZNullableDateTime._withConfig,
    processor: processor,
    isUserDefined: true,
  );
}
