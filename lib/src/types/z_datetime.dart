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
  ZDateTime._new() : super._new(ParseDateTime(parseDateTime));

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZDateTime._withConfig(super.config) : super._withConfig();

  /// Adds a custom rule for DateTime validation/processing and returns a new `ZDateTime` instance.
  ZDateTime _addRule(Rule<DateTime> r) => ZDateTime._withConfig(_config.addRule(RuleDateTime(r)));

  /// Adds a rule to enforce that the DateTime must be after or equal to `min`.
  ZDateTime min(DateTime min) => _addRule(minDateTimeRule(min));

  /// Adds a rule to enforce that the DateTime must be before or equal to `max`.
  ZDateTime max(DateTime max) => _addRule(maxDateTimeRule(max));

  // /// Enable `null` value. All rules will be skipped for null values.
  // ZNullableString nullable() => ZNullableString._withConfig(_config.makeNullable());

  // /// Enable omitting this value. All rules will be skipped if the value is missing.
  // ZNullableString optional() => ZNullableString._withConfig(_config.makeOptional());

  @override
  ZDateTime refine(Refiner<DateTime> refiner, {String? message, String? code}) =>
      _addRule(refineRule(refiner, message: message, code: code));
}
