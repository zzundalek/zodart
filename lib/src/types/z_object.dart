part of 'types.dart';

/// Schema type representing an Object of type [T].
///
/// Wraps a schema to validate the object structure according to the provided `schema`
/// and maps parsed data to type [T] using `fromJson`.
///
/// Example:
/// ```dart
// final personSchema = ZObject.withMapper(
//   {
//     'firstName': ZString().min(1),
//     'lastName': ZString().min(1),
//     'age': ZInt().nullable().min(0),
//   },
//   fromJson: Person.fromJson,
// );

// final person = personSchema.parse({'firstName': 'Zod', 'lastName': 'Art'});
/// ```
class ZObject<T extends Object> extends ZBase<T> implements ZTransformations<T, T> {
  /// Constructor that creates a [ZObject] using the given [schema]
  /// for parsing and the [fromJson] function to map parsed data to type [T].
  ///
  /// Cross-field validators, if provided, operates on the default
  /// [ParsedFieldAccessor].
  ZObject.withMapper(
    ZSchema schema, {
    required ObjectMapper<T> fromJson,
    List<CrossFieldValidator<ParsedFieldAccessor>> crossValidators = const [],
  }) : this._new(
         schema: schema,
         mapper: fromJson,
         crossFieldValidation: (
           parsedFieldAccessorFactory: ParsedFieldAccessor.new,
           crossValidators: crossValidators,
         ),
       );

  ZObject._new({
    required ZSchema schema,
    required ObjectMapper<T> mapper,
    required UnsafeCrossFieldValidation crossFieldValidation,
  }) : super._new(
         Parsing.buildIn(
           parseObject<T>(
             schema: schema,
             mapper: mapper,
             crossFieldValidation: crossFieldValidation,
           ),
         ),
       );

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZObject._withConfig(super.config) : super._withConfig();

  /// Creates a [ZObject] with strongly typed cross-field validation.
  ///
  /// The returned instance uses the provided [schema] for parsing and
  /// [fromJson] to map parsed data to type [T].
  ///
  /// The generic type [G] enforces type safety for cross-field validation by
  /// ensuring that [crossValidators] operate on a concrete
  /// [ParsedFieldAccessor] implementation created by
  /// [parsedFieldAccessorFactory].
  static ZObject<T> withTypedCrossFieldValidation<T extends Object, G extends ParsedFieldAccessor>(
    ZSchema schema, {
    required ObjectMapper<T> fromJson,
    required List<CrossFieldValidator<G>> crossValidators,
    required ParsedFieldAccessorFactory<G> parsedFieldAccessorFactory,
  }) => ZObject._new(
    schema: schema,
    mapper: fromJson,
    crossFieldValidation: (
      parsedFieldAccessorFactory: parsedFieldAccessorFactory,
      crossValidators: crossValidators,
    ),
  );

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableObject<T> nullable() => _nullable(constructor: ZNullableObject<T>._withConfig);

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableObject<T> optional() => _optional(constructor: ZNullableObject<T>._withConfig);

  /// Adds a transformation of current type [T] to an object of type [To] using custom transformer.
  ZObject<To> toObj<To extends Object>(Transformer<T, To> transformer) => _transformCustom(
    constructor: ZObject<To>._withConfig,
    transformer: transformer,
  );

  /// Adds a transformation of current [T] value to [String] using custom transformer.
  ZString toStr(Transformer<T, String> transformer) => _transformCustom(
    constructor: ZString._withConfig,
    transformer: transformer,
  );

  @override
  ZObject<T> refine(Refiner<T> refiner, {String? message, String? code}) => _refine(
    constructor: ZObject<T>._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZObject<T> superRefine(SuperRefiner<T> refiner) => _superRefine(
    constructor: ZObject<T>._withConfig,
    refiner: refiner,
  );

  @override
  ZObject<T> process(Processor<T> processor) => _processPure(
    constructor: ZObject<T>._withConfig,
    processor: processor,
    isUserDefined: true,
  );
}
