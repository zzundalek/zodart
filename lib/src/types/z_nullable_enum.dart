part of 'types.dart';

/// Nullable version of [ZEnum].
///
/// Allows the value to be `null`, skipping all validation in that case.
///
/// Example:
/// ```dart
/// enum Color { red, green, blue }
///
/// final simpleEnumSchema = ZEnum.simple(enumValues: Color.values).nullable();
/// final result = simpleEnumSchema.parse('red');
/// ```
class ZNullableEnum<T extends Enum> extends ZBase<T?>
    implements ZTransformations<T, T?>, ZNullableTransformations<T, T?> {
  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZNullableEnum._withConfig(super.config) : super._withConfig();

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableEnum<T> optional() => _optional(constructor: ZNullableEnum<T>._withConfig);

  @override
  ZNullableEnum<T> refine(Refiner<T> refiner, {String? message, String? code}) => _refine(
    constructor: ZNullableEnum<T>._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZNullableEnum<T> superRefine(SuperRefiner<T> refiner) => _superRefine(
    constructor: ZNullableEnum<T>._withConfig,
    refiner: refiner,
  );

  @override
  ZNullableEnum<T> process(Processor<T> processor) => _processPure(
    constructor: ZNullableEnum<T>._withConfig,
    processor: processor,
    isUserDefined: true,
  );

  @override
  ZEnum<T> onNull(NullFallback<T> nullFallback) =>
      _defaultForNull(constructor: ZEnum<T>._withConfig, onNull: nullFallback);
}
