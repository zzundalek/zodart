part of 'types.dart';

/// Schema type representing a [double] value.
///
/// Provides double-specific validation rules, processing and transformation functions.
///
/// Example:
/// ```dart
/// final doubleVal = ZDouble();
/// final result = doubleVal.parse(1.0);
/// ```
class ZDouble extends ZBase<double> implements ZTransformations<double, double> {
  /// Constructor that creates a new instance.
  ///
  /// {@template ZodArtType_coercion}
  /// **Coercion**
  ///
  /// Flag to turn on automatic type conversion between compatible types. Turned off by default.
  /// Executes only losseless coversions.
  /// {@endtemplate}
  ///
  /// {@macro ZodArtType_preParsers}
  /// Example usage:
  /// ```dart
  /// ZDouble(preParsers: [normalizeFormStringPreParser]);
  /// ```
  ZDouble({bool coercion = false, List<ResProcessor<Object?>> preParsers = const []})
    : this._new(coercion: coercion, preParsers: preParsers);

  /// Internal constructor that initializes the type with selected double parser.
  ZDouble._new({required bool coercion, required List<ResProcessor<Object?>> preParsers})
    : super._new(
        coercion ? Parsing.buildIn(parseDoubleCoerce) : Parsing.buildIn(parseDouble),
        preParsers: preParsers.map(PreProcessing.custom).toList(),
      );

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZDouble._withConfig(super.config) : super._withConfig();

  /// Adds a custom rule for double validation/processing and returns a new `ZDouble` instance.
  ZDouble _addRule(ResRule<double> validation) =>
      _validateBuildIn(constructor: ZDouble._withConfig, validation: validation);

  /// Adds a rule to enforce that the value must be greater than or equal to `min`.
  ZDouble min(double min) => _addRule(minNumRule(min));

  /// Adds a rule to enforce that the value must be less than or equal to `max`.
  ZDouble max(double max) => _addRule(maxNumRule(max));

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableDouble nullable() => _nullable(constructor: ZNullableDouble._withConfig);

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableDouble optional() => _optional(constructor: ZNullableDouble._withConfig);

  /// Adds a transformation of current [double] value to [int] using custom transformer.
  ZInt toInt(Transformer<double, int> transformer) => _transformCustom(
    constructor: ZInt._withConfig,
    transformer: transformer,
  );

  /// Adds a transformation of current [double] value to [String] using custom transformer.
  ZString toStr(Transformer<double, String> transformer) => _transformCustom(
    constructor: ZString._withConfig,
    transformer: transformer,
  );

  @override
  ZDouble refine(Refiner<double> refiner, {String? message, String? code}) => _refine(
    constructor: ZDouble._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZDouble superRefine(SuperRefiner<double> refiner) => _superRefine(
    constructor: ZDouble._withConfig,
    refiner: refiner,
  );

  @override
  ZDouble process(Processor<double> processor) => _processPure(
    constructor: ZDouble._withConfig,
    processor: processor,
    isUserDefined: true,
  );
}
