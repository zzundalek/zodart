part of 'types.dart';

/// Nullable version of [ZObject].
///
/// Wraps a schema to validate the object structure according to the provided `schema`
/// and maps parsed data to type [T] using `fromJson`.
///
/// Allows the value to be `null`, skipping all validation in that case.
///
/// Example:
/// ```dart
/// final personSchema = ZObject.withMapper(
///   {
///     'firstName': ZString().min(1),
///     'lastName': ZString().min(1),
///     'age': ZInt().nullable().min(0),
///   },
///   fromJson: Person.fromJson,
/// ).nullable();
///
/// final nullablePerson = personSchema.parse({'firstName': 'Zod', 'lastName': 'Art'});
/// ```
class ZNullableObject<T extends Object> extends ZBase<T?>
    implements ZTransformations<T, T?>, ZNullableTransformations<T, T?> {
  ZNullableObject._withConfig(super.config) : super._withConfig();

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableObject<T> optional() => _optional(constructor: ZNullableObject<T>._withConfig);

  /// Adds a transformation of current type [T] to an object of type [To] using custom transformer.
  ZNullableObject<To> toObj<To extends Object>(Transformer<T, To> transformer) => _transformCustom(
    constructor: ZNullableObject<To>._withConfig,
    transformer: transformer,
  );

  /// Adds a transformation of current [T] value to [String] using custom transformer.
  ZNullableString toStr(Transformer<T, String> transformer) => _transformCustom(
    constructor: ZNullableString._withConfig,
    transformer: transformer,
  );

  @override
  ZNullableObject<T> refine(Refiner<T> refiner, {String? message, String? code}) => _refine(
    constructor: ZNullableObject<T>._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZNullableObject<T> superRefine(SuperRefiner<T> refiner) => _superRefine(
    constructor: ZNullableObject<T>._withConfig,
    refiner: refiner,
  );

  @override
  ZNullableObject<T> process(Processor<T> processor) => _processPure(
    constructor: ZNullableObject<T>._withConfig,
    processor: processor,
    isUserDefined: true,
  );

  @override
  ZObject<T> onNull(NullFallback<T> nullFallback) =>
      _defaultForNull(constructor: ZObject<T>._withConfig, onNull: nullFallback);
}
