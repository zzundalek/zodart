part of 'types.dart';

/// Schema type representing a [T] value exting [Enum].
///
/// Provides enum-specific validation rules, processing and transformation functions.
///
/// Example:
/// ```dart
/// enum Color { red, green, blue }
///
/// final simpleEnumSchema = ZEnum.simple(enumValues: Color.values);
/// final result = simpleEnumSchema.parse('red');
/// ```
class ZEnum<T extends Enum> extends ZBase<T> implements ZTransformations<T, T> {
  /// Factory constructor that creates [ZEnum] for given [T].
  ///
  /// For the value parsing compares the value against `[Enum.values].name` of [enumValues],
  /// or accepts the T value itself.
  ///
  /// Example:
  /// ```dart
  /// enum Color { red, green, blue }
  ///
  /// final simpleEnumSchema = ZEnum.simple(enumValues: Color.values);
  /// simpleEnumSchema.parse('red');
  /// simpleEnumSchema.parse(Color.red);
  /// ```
  ///
  /// For enhanced enums use `withCustomParser` instead.
  factory ZEnum.simple({
    required List<T> enumValues,
  }) => ZEnum._new(
    Parsing.buildIn(parseEnum(enumValues)),
  );

  /// Factory constructor that creates [ZEnum] for given [T].
  ///
  /// For the value parsing uses [enumParser].
  factory ZEnum.withCustomParser(
    EnumParser<T> enumParser,
  ) => ZEnum._new(
    Parsing.buildIn(parseEnumCustom(enumParser)),
  );

  ZEnum._new(Parsing<T> super.parser) : super._new();

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZEnum._withConfig(super.config) : super._withConfig();

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableEnum<T> nullable() => _nullable(constructor: ZNullableEnum<T>._withConfig);

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableEnum<T> optional() => _optional(constructor: ZNullableEnum<T>._withConfig);

  @override
  ZEnum<T> refine(Refiner<T> refiner, {String? message, String? code}) => _refine(
    constructor: ZEnum<T>._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZEnum<T> superRefine(SuperRefiner<T> refiner) => _superRefine(
    constructor: ZEnum<T>._withConfig,
    refiner: refiner,
  );

  @override
  ZEnum<T> process(Processor<T> processor) => _processPure(
    constructor: ZEnum<T>._withConfig,
    processor: processor,
    isUserDefined: true,
  );
}
