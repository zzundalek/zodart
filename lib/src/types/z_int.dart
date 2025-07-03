part of 'types.dart';

/// Schema type representing an [int] value.
///
/// Provides int-specific validation rules, processing and transformation functions.
///
/// Example:
/// ```dart
/// final intVal = ZInt();
/// final result = intVal.parse(1);
/// ```
class ZInt extends ZBase<int> implements ZTransformations<int, int> {
  /// Factory constructor that creates a new instance using the default configuration.
  factory ZInt() => ZInt._new();

  /// Internal constructor that initializes with a default integer parser.
  ZInt._new() : super._new(ParseInt(parseInt));

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZInt._withConfig(super.config) : super._withConfig();

  /// Adds a custom rule for integer validation/processing and returns a new `ZInt` instance.
  ZInt _addRule(Rule<int> r) => ZInt._withConfig(_config.addRule(RuleInt(r)));

  /// Adds a rule to enforce that the value must be greater than or equal to `min`.
  ZInt min(int min) => _addRule(minNumRule(min));

  /// Adds a rule to enforce that the value must be less than or equal to `max`.
  ZInt max(int max) => _addRule(maxNumRule(max));

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableInt nullable() => ZNullableInt._withConfig(_config.makeNullable());

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableInt optional() => ZNullableInt._withConfig(_config.makeOptional());

  @override
  ZInt refine(Refiner<int> refiner, {String? message, String? code}) =>
      _addRule(refineRule(refiner, message: message, code: code));

  @override
  ZInt superRefine(SuperRefiner<int> refiner) => _addRule(superRefineRule(refiner));
}
