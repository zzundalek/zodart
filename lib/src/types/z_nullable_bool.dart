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
class ZNullableBool extends ZBase<bool?> {
  ZNullableBool._withConfig(super.config) : super._withConfig();
}
