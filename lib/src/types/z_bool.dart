part of 'types.dart';

/// Schema type representing a [bool] value.
///
/// Provides bool-specific validation rules, processing and transformation functions.
///
/// Example:
/// ```dart
/// final boolVal = ZBool();
/// final result = boolVal.parse(true);
/// ```
class ZBool extends ZBase<bool> implements ZTransformations<bool, bool> {
  /// Factory constructor that creates a new instance using the default configuration.
  factory ZBool() => ZBool._new();

  /// Internal constructor that initializes with a default bool parser.
  ZBool._new() : super._new(Parsing.buildIn(parseBool));

  /// Internal constructor that accepts a custom configuration.
  ///
  /// Typically used for creating modified versions of this validator,
  /// such as after applying transformation or additional rules.
  ZBool._withConfig(super.config) : super._withConfig();

  /// Enable `null` value. All rules will be skipped for null values.
  ZNullableBool nullable() => _nullable(constructor: ZNullableBool._withConfig);

  /// Enable omitting this value. All rules will be skipped if the value is missing.
  ZNullableBool optional() => _optional(constructor: ZNullableBool._withConfig);

  @override
  ZBool refine(Refiner<bool> refiner, {String? message, String? code}) => _refine(
    constructor: ZBool._withConfig,
    refiner: refiner,
    message: message,
    code: code,
  );

  @override
  ZBool superRefine(SuperRefiner<bool> refiner) => _superRefine(
    constructor: ZBool._withConfig,
    refiner: refiner,
  );

  @override
  ZBool process(Processor<bool> processor) => _processPure(
    constructor: ZBool._withConfig,
    processor: processor,
    isUserDefined: true,
  );
}
