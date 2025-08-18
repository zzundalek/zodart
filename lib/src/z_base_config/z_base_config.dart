import 'package:freezed_annotation/freezed_annotation.dart';

import '../base/base.dart';

part 'z_base_config.freezed.dart';

/// An abstract interface that defines the configuration for value parsing and transformation.
///
/// Contains a flag [nullable] indicating whether `null` is considered a valid input.
/// Contains a flag [optional] indicating whether the value can be omitted.
abstract class Config {
  /// Returns `true` if the configuration allows `null` as a valid input.
  bool get nullable;

  /// Returns `true` if the configuration allows omitting the value from the input.
  bool get optional;
}

/// An immutable configuration class that defines transformation and validation behavior.
///
/// This class uses `freezed` to generate equality, copy, and serialization features.
/// It implements [Config] and stores a list of transformation or rule functions.
///
/// Use methods like [addTransformation], [addProcessing], or [makeNullable]
/// to create updated copies with additional configuration.
@freezed
abstract class ZBaseConfig with _$ZBaseConfig implements Config {
  /// Creates a new [ZBaseConfig] instance with the given transformation functions and nullability flag.
  ///
  /// - [fns]: A list of transformations or rules to apply.
  /// - [nullable]: Whether `null` is treated as valid input (defaults to `false`).
  const factory ZBaseConfig({
    required List<Operation<dynamic, dynamic>> fns,
    @Default(false) bool nullable,
    @Default(false) bool optional,
  }) = _ZBaseConfig;

  const ZBaseConfig._();

  /// Returns a new [ZBaseConfig] with the given operation [o] added to the list.
  ZBaseConfig _addOperation<From, To>(Operation<From, To> o) => copyWith(fns: [...fns, o]);

  /// Returns a new [ZBaseConfig] with the given transformation [t] added to the list.
  ZBaseConfig addTransformation<From, To>(Transformation<From, To> t) => _addOperation(t);

  /// Returns a new [ZBaseConfig] with the given processing [p] added to the list.
  ZBaseConfig addProcessing<T>(Processing<T> p) => _addOperation(p);

  /// Returns a new [ZBaseConfig] with the given validation [v] added to the list.
  ZBaseConfig addValidation<T>(Validation<T> v) => _addOperation(v);

  /// Returns a new [ZBaseConfig] with the given null fallback [onNull] added to the list.
  ZBaseConfig addNullFallback<T>(OnNullTransformation<T> onNull) => _addOperation(onNull);

  /// Returns a new [ZBaseConfig] with [nullable] set to `true`.
  ZBaseConfig makeNullable() => copyWith(nullable: true);

  /// Returns a new [ZBaseConfig] with [optional] set to `true`.
  ZBaseConfig makeOptional() => copyWith(optional: true);
}
