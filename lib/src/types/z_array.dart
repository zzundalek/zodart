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
class ZArray<T> extends ZBase<List<T>> implements ZTransformations<List<T>, List<T>> {
  /// Factory constructor that creates a new instance using the given [schema] for parsing.
  factory ZArray(ZBase<T> schema) => ZArray._new(schema);

  ZArray._new(ZBase<T> schema) : super._new(Parsing.buildIn(parseArray<T>(schema)));

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZArray._withConfig(super.config) : super._withConfig();

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableArray<T> nullable() => _nullable(constructor: ZNullableArray<T>._withConfig);

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableArray<T> optional() => _optional(constructor: ZNullableArray<T>._withConfig);

  /// Adds a transformation of current array of type [T] value to [String] using custom transformer.
  ZString toStr(Transformer<List<T>, String> transformer) => _transformCustom(
    constructor: ZString._withConfig,
    transformer: transformer,
  );

  /// Adds a transformation of current array of type [T] to an array of type [To] using custom transformer.
  ZArray<To> toArray<To>(Transformer<List<T>, List<To>> transformer) => _transformCustom(
    constructor: ZArray<To>._withConfig,
    transformer: transformer,
  );

  @override
  ZArray<T> refine(Refiner<List<T>> refiner, {String? message, String? code}) => _refine(
    constructor: ZArray<T>._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZArray<T> superRefine(SuperRefiner<List<T>> refiner) => _superRefine(
    constructor: ZArray<T>._withConfig,
    refiner: refiner,
  );

  @override
  ZArray<T> process(Processor<List<T>> processor) => _processPure(
    constructor: ZArray<T>._withConfig,
    processor: processor,
    isUserDefined: true,
  );
}
