part of 'types.dart';

/// Schema type representing a [double] value.
///
/// Provides double-specific validation rules, processing and transformation functions.
///
/// Example:
/// ```dart
/// final doubleVal = ZDouble();
/// final result = doubleVal.parse(1.0);
/// ```
class ZDouble extends ZBase<double> implements ZTransformations<double, double> {
  /// Factory constructor that creates a new instance using the default configuration.
  factory ZDouble() => ZDouble._new();

  /// Internal constructor that initializes with a default double parser.
  ZDouble._new() : super._new(ParseDouble(parseDouble));

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZDouble._withConfig(super.config) : super._withConfig();

  /// Adds a custom rule for double validation/processing and returns a new `ZDouble` instance.
  ZDouble _addRule(Rule<double> r) => ZDouble._withConfig(_config.addRule(RuleDouble(r)));

  /// Adds a rule to enforce that the value must be greater than or equal to `min`.
  ZDouble min(double min) => _addRule(minNumRule(min));

  /// Adds a rule to enforce that the value must be less than or equal to `max`.
  ZDouble max(double max) => _addRule(maxNumRule(max));

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableDouble nullable() => ZNullableDouble._withConfig(_config.makeNullable());

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableDouble optional() => ZNullableDouble._withConfig(_config.makeOptional());

  @override
  ZDouble refine(Refiner<double> refiner, {String? message, String? code}) =>
      _addRule(refineRule(refiner, message: message, code: code));

  @override
  ZDouble superRefine(SuperRefiner<double> refiner) => _addRule(superRefineRule(refiner));
}
