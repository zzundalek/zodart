part of 'types.dart';

/// Schema type representing an array of elements of type [T].
///
/// Wraps a schema for the array elements and validates each item accordingly.
///
/// Example:
/// ```dart
/// final intArray = ZArray(ZInt());
/// final result = intArray.parse([1, 2, 3]);
/// ```
class ZArray<T> extends ZBase<List<T>> {
  /// Factory constructor that creates a new instance using the given [schema] for parsing.
  factory ZArray(ZBase<T> schema) => ZArray._new(schema);

  ZArray._new(ZBase<T> schema) : super._new(ParseArray<T>(parseArray<T>(schema)));

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableArray<T> nullable() => ZNullableArray<T>._withConfig(_config.makeNullable());

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableArray<T> optional() => ZNullableArray<T>._withConfig(_config.makeOptional());
}
