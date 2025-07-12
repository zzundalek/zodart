part of 'types.dart';

/// Nullable version of [ZDouble].
///
/// Allows the value to be `null`, skipping all validation in that case.
///
/// Example:
/// ```dart
/// final nullableDouble = ZDouble().nullable();
/// final result = nullableDouble.parse(1.0);
/// ```
class ZNullableDouble extends ZBase<double?> implements ZTransformations<double, double?> {
  ZNullableDouble._withConfig(super.config) : super._withConfig();

  ZNullableDouble _addRule(ResRule<double> validation) =>
      _validateBuildIn(constructor: ZNullableDouble._withConfig, validation: validation);

  /// Adds a rule to enforce that the value must be greater than or equal to `min`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableDouble min(double min) => _addRule(minNumRule(min));

  /// Adds a rule to enforce that the value must be less than or equal to `max`.
  ///
  /// Skips the validation if the value is `null`.
  ZNullableDouble max(double max) => _addRule(maxNumRule(max));

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableDouble optional() => _optional(constructor: ZNullableDouble._withConfig);

  /// Adds a transformation of current [double] value to [int] using custom transformer.
  ZNullableInt toInt(Transformer<double, int> transformer) => _transformCustom(
    constructor: ZNullableInt._withConfig,
    transformer: transformer,
  );

  /// Adds a transformation of current [double] value to [String] using custom transformer.
  ZNullableString toStr(Transformer<double, String> transformer) => _transformCustom(
    constructor: ZNullableString._withConfig,
    transformer: transformer,
  );

  @override
  ZNullableDouble refine(Refiner<double> refiner, {String? message, String? code}) => _refine(
    constructor: ZNullableDouble._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZNullableDouble superRefine(SuperRefiner<double> refiner) => _superRefine(
    constructor: ZNullableDouble._withConfig,
    refiner: refiner,
  );

  @override
  ZNullableDouble process(Processor<double> processor) => _processPure(
    constructor: ZNullableDouble._withConfig,
    processor: processor,
    isUserDefined: true,
  );
}
