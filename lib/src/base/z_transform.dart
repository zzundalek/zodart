// Used intentionally to restrict the operation input to a subtype.
// ignore_for_file: use_super_parameters

import '../internal_typedefs.dart';
import '../z_base_config/z_base_config.dart';
import 'base.dart';

/// A class used to encapsulate transformation, validation and processing functions.
///
/// A sealed class that defines various kinds of operations when ensuring type safety.
sealed class Operation<From, To> {
  Operation(this._fn, {this.isUserDefined = false});
  final ResTransformer<From, To> _fn;

  /// Indicates whether this operation is user-defined,
  /// as opposed to a built-in operations like `.min()` or `.trim()`.
  final bool isUserDefined;

  ConfiguredTransformer<From?, To?> _configureTransformer(ResTransformer<From, To> fn) =>
      (Config config) => (dynamic val) {
        // NOTE: For null value the transformer execution is skipped,
        // but the result must be converted to proper type.
        if (val == null && (config.nullable || config.optional)) {
          return ZRes.success(null);
        } else if (val is From) {
          return fn(val);
        } else {
          throw ZodArtInternalException(
            'Unexpected transformation error occurred. Value "$val" of type "${val.runtimeType}" '
            'should have been converted from type "$From" to type "$To".',
          );
        }
      };

  /// Getter to obtain the transformation function [fn] with from nullable type [From] and to nullable type [To].
  /// Wraps the saved not nullable transformer with nullable handler.
  ConfiguredTransformer<From?, To?> get fn => _configureTransformer(_fn);
}

/// A type-safe transformation that parses an untyped [Object?] into a value of type [T].
///
/// This operation is short-circuited if the input value is `null`.
///
/// Extends [Operation] and enforces runtime type checks for both input and output types.
class Parsing<T> extends Operation<Object?, T> {
  /// Create a new transformation from [Object?] to [T] with the given function [fn].
  Parsing.buildIn(Parser<T> p) : super(p);
}

/// A type-safe wrapper for [T] validation logic.
///
/// This operation is short-circuited if the input value is `null`.
///
/// Extends [Operation] and enforces runtime type checks for both input and output types.
class Validation<T> extends Operation<T, T> {
  /// Creates a [Validation] using the provided [v] function.
  Validation(ResRule<T> v, {required bool isUserDefined}) : super(v, isUserDefined: isUserDefined);
}

/// A type-safe wrapper for processing a [T] value into a new [T] value.
///
/// This operation is short-circuited if the input value is `null`.
///
/// Extends [Operation] and enforces runtime type checks for both input and output types.
class Processing<T> extends Operation<T, T> {
  /// Creates a [Processing] using the provided [p] function.
  Processing(ResProcessor<T> p, {required bool isUserDefined}) : super(p, isUserDefined: isUserDefined);
}

/// A type-safe transformation from [From] to [To].
///
/// This operation is short-circuited if the input value is `null`.
///
/// Extends [Operation] and enforces runtime type checks for both input and output types.
class Transformation<From, To> extends Operation<From, To> {
  /// Creates a [Transformation] using the provided [t] function.
  Transformation(ResTransformer<From, To> t, {required bool isUserDefined}) : super(t, isUserDefined: isUserDefined);
}
