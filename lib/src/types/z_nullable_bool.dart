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
class ZNullableBool extends ZBase<bool?>
    implements ZTransformations<bool, bool?>, ZNullableTransformations<bool, bool?> {
  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZNullableBool._withConfig(super.config) : super._withConfig();

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableBool optional() => _optional(constructor: ZNullableBool._withConfig);

  /// Adds a transformation of current [bool] value to [String] using custom transformer.
  ZNullableString toStr(Transformer<bool, String> transformer) => _transformCustom(
    constructor: ZNullableString._withConfig,
    transformer: transformer,
  );

  @override
  ZNullableBool refine(Refiner<bool> refiner, {String? message, String? code}) => _refine(
    constructor: ZNullableBool._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZNullableBool superRefine(SuperRefiner<bool> refiner) => _superRefine(
    constructor: ZNullableBool._withConfig,
    refiner: refiner,
  );

  @override
  ZNullableBool process(Processor<bool> processor) => _processPure(
    constructor: ZNullableBool._withConfig,
    processor: processor,
    isUserDefined: true,
  );

  @override
  ZBool onNull(NullFallback<bool> nullFallback) =>
      _defaultForNull(constructor: ZBool._withConfig, onNull: nullFallback);
}
