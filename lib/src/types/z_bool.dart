part of 'types.dart';

/// Schema type representing a [bool] value.
///
/// Provides bool-specific validation rules, processing and transformation functions.
///
/// Example:
/// ```dart
/// final boolVal = ZBool();
/// final result = boolVal.parse(true);
/// ```
class ZBool extends ZBase<bool> implements ZTransformations<bool, bool> {
  /// Factory constructor that creates a new instance using the default configuration.
  factory ZBool() => ZBool._new();

  /// Internal constructor that initializes with a default bool parser.
  ZBool._new() : super._new(ParseBool(parseBool));

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZBool._withConfig(super.config) : super._withConfig();

  /// Adds a custom rule for bool validation/processing and returns a new `ZBool` instance.
  ZBool _addRule(Rule<bool> r) => ZBool._withConfig(_config.addRule(RuleBool(r)));

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableBool nullable() => ZNullableBool._withConfig(_config.makeNullable());

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableBool optional() => ZNullableBool._withConfig(_config.makeOptional());

  @override
  ZBool refine(Refiner<bool> refiner, {String? message, String? code}) =>
      _addRule(refineRule(refiner, message: message, code: code));
}
