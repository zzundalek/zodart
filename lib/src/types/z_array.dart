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

  ZArray._new(ZBase<T> schema) : super._new(ParseArray<T>(parseArray<T>(schema)));

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZArray._withConfig(super.config) : super._withConfig();

  /// Adds a custom rule for List validation/processing and returns a new `ZArray` instance.
  ZArray<T> _addRule(Rule<List<T>> r) => ZArray._withConfig(_config.addRule(RuleArray<T>(r)));

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableArray<T> nullable() => ZNullableArray<T>._withConfig(_config.makeNullable());

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableArray<T> optional() => ZNullableArray<T>._withConfig(_config.makeOptional());

  @override
  ZArray<T> refine(Refiner<List<T>> refiner, {String? message, String? code}) =>
      _addRule(refineRule(refiner, message: message, code: code));

  @override
  ZArray<T> superRefine(SuperRefiner<List<T>> refiner) => _addRule(superRefineRule(refiner));

  @override
  ZArray<T> process(Processor<List<T>> processor) => ZArray<T>._withConfig(_config.addProcessor(processor));
}
