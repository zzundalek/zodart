part of 'types.dart';

/// Nullable version of [ZInt].
///
/// Allows the value to be `null`, skipping all validation in that case.
///
/// Example:
/// ```dart
/// final nullableInt = ZInt().nullable();
/// final result = nullableInt.parse(1);
/// ```
class ZNullableInt extends ZBase<int?> implements ZTransformations<int, int?> {
  ZNullableInt._withConfig(super.config) : super._withConfig();

  ZNullableInt _addRule(ResRule<int> validation) =>
      _validateBuildIn(constructor: ZNullableInt._withConfig, validation: validation);

  /// Adds a rule to enforce that the value must be greater than or equal to `min`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableInt min(int min) => _addRule(minNumRule(min));

  /// Adds a rule to enforce that the value must be less than or equal to `max`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableInt max(int max) => _addRule(maxNumRule(max));

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableInt optional() => _optional(constructor: ZNullableInt._withConfig);

  /// Adds a transformation of current [int] value to [String] using custom transformer.
  ZNullableString toStr(Transformer<int, String> transformer) => _transformCustom(
    constructor: ZNullableString._withConfig,
    transformer: transformer,
  );

  /// Adds a transformation of current [int] value to [double] using default transformer.
  ZNullableDouble toDouble() => _transformBuildIn(
    constructor: ZNullableDouble._withConfig,
    transformer: intToDouble,
  );

  @override
  ZNullableInt refine(Refiner<int> refiner, {String? message, String? code}) => _refine(
    constructor: ZNullableInt._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZNullableInt superRefine(SuperRefiner<int> refiner) => _superRefine(
    constructor: ZNullableInt._withConfig,
    refiner: refiner,
  );

  @override
  ZNullableInt process(Processor<int> processor) => _processPure(
    constructor: ZNullableInt._withConfig,
    processor: processor,
    isUserDefined: true,
  );
}
