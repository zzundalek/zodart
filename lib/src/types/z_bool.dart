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
class ZBool extends ZBase<bool> {
  /// Factory constructor that creates a new instance using the default configuration.
  factory ZBool() => ZBool._new();

  /// Internal constructor that initializes with a default bool parser.
  ZBool._new() : super._new(ParseBool(parseBool));

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableBool nullable() => ZNullableBool._withConfig(_config.makeNullable());

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableBool optional() => ZNullableBool._withConfig(_config.makeOptional());
}
