part of 'types.dart';

/// Schema type representing an [int] value.
///
/// Provides int-specific validation rules, processing and transformation functions.
///
/// Example:
/// ```dart
/// final intVal = ZInt();
/// final result = intVal.parse(1);
/// ```
class ZInt extends ZBase<int> implements ZTransformations<int, int> {
  /// Constructor that creates a new instance.
  ///
  /// {@macro ZodArtType_coercion}
  ///
  /// {@macro ZodArtType_preParsers}
  /// Example usage:
  /// ```dart
  /// ZInt(preParsers: [normalizeFormStringPreParser]);
  /// ```
  ZInt({bool coercion = false, List<ResProcessor<Object?>> preParsers = const []})
    : this._new(coercion: coercion, preParsers: preParsers);

  /// Internal constructor that initializes the type with selected int parser.
  ZInt._new({required bool coercion, required List<ResProcessor<Object?>> preParsers})
    : super._new(
        coercion ? Parsing.buildIn(parseIntCoerce) : Parsing.buildIn(parseInt),
        preParsers: preParsers.map(PreProcessing.custom).toList(),
      );

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZInt._withConfig(super.config) : super._withConfig();

  /// Adds a custom rule for integer validation/processing and returns a new `ZInt` instance.
  ZInt _addRule(ResRule<int> validation) => _validateBuildIn(constructor: ZInt._withConfig, validation: validation);

  /// Adds a rule to enforce that the value must be greater than or equal to `min`.
  ZInt min(int min) => _addRule(minNumRule(min));

  /// Adds a rule to enforce that the value must be less than or equal to `max`.
  ZInt max(int max) => _addRule(maxNumRule(max));

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableInt nullable() => _nullable(constructor: ZNullableInt._withConfig);

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableInt optional() => _optional(constructor: ZNullableInt._withConfig);

  /// Adds a transformation of current [int] value to [String] using custom transformer.
  ZString toStr(Transformer<int, String> transformer) => _transformCustom(
    constructor: ZString._withConfig,
    transformer: transformer,
  );

  /// Adds a transformation of current [int] value to [double] using default transformer.
  ZDouble toDouble() => _transformBuildIn(
    constructor: ZDouble._withConfig,
    transformer: intToDouble,
  );

  @override
  ZInt refine(Refiner<int> refiner, {String? message, String? code}) => _refine(
    constructor: ZInt._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZInt superRefine(SuperRefiner<int> refiner) => _superRefine(
    constructor: ZInt._withConfig,
    refiner: refiner,
  );

  @override
  ZInt process(Processor<int> processor) => _processPure(
    constructor: ZInt._withConfig,
    processor: processor,
    isUserDefined: true,
  );
}
