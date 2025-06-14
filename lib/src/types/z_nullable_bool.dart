part of 'types.dart';

/// Nullable version of [ZBool].
///
/// Allows the value to be `null`, skipping all validation in that case.
///
/// Example:
/// ```dart
/// final nullableBool = ZBool().nullable();
/// final result = nullableBool.parse(true);
/// ```
class ZNullableBool extends ZBase<bool?> implements ZTransformations<bool, bool?> {
  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZNullableBool._withConfig(super.config) : super._withConfig();

  ZNullableBool _addRule(Rule<bool> r) => ZNullableBool._withConfig(_config.addRule(RuleBool(r)));

  @override
  ZNullableBool refine(Refiner<bool> refiner, {String? message, String? code}) =>
      _addRule(refineRule(refiner, message: message, code: code));
}
