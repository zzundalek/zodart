part of 'types.dart';

/// Nullable version of [ZArray].
///
/// Wraps a schema for the array elements and validates each item accordingly.
/// Allows the entire array value to be `null`, skipping all validation in that case.
///
/// Example:
/// ```dart
/// final nullableIntArray = ZArray(ZInt()).nullable();
/// final result = nullableIntArray.parse([1, 2, 3]);
/// ```
class ZNullableArray<T> extends ZBase<List<T>?> {
  ZNullableArray._withConfig(super.config) : super._withConfig();
}
