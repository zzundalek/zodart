import '../internal_typedefs.dart';
import '../z_base_config/z_base_config.dart';
import 'base.dart';

/// A class used to encapsulate transformation, validation and processing functions.
///
/// A sealed class that defines various kinds of transformation types to ensure type safety.
/// Transforms a value of type [From] to a value of type [To].
sealed class TransformAny<From, To> {
  TransformAny(this._fn);
  final Transformer<From, To> _fn;

  ConfiguredTransformer<From?, To?> _configureTransformer(Transformer<From, To> fn) =>
      (Config config) => (dynamic val) {
        // NOTE: For null value the transformer execution is skipped,
        // but the result must be converted to proper type.
        if (val == null && (config.nullable || config.optional)) {
          return ZRes.success(null);
        } else if (val is From) {
          return fn(val);
        } else {
          throw ZodArtInternalException(
            'Unexpected transformation error occurred. Value "$val" of type "${val.runtimeType}" should have been converted from type "$From" to type "$To".',
          );
        }
      };

  /// Getter to obtain the transformation function [fn] with from nullable type [From] and to nullable type [To].
  /// Wraps the saved not nullable transformer with nullable handler.
  ConfiguredTransformer<From?, To?> get fn => _configureTransformer(_fn);
}

/// A type-safe wrapper for string-specific validation or processing logic.
///
/// This class extends [RuleAny] for the [String] type and applies runtime
/// type guarding to ensure only strings are validated or parsed.
class RuleString extends RuleAny<String> {
  /// Creates a new [RuleString] with the provided rule function [fn].
  ///
  /// The rule will be automatically wrapped with a runtime type check.
  RuleString(super._fn);
}

/// A type-safe wrapper for int-specific validation or processing logic.
///
/// This class extends [RuleAny] for the [int] type and applies runtime
/// type guarding to ensure only ints are validated or parsed.
class RuleInt extends RuleAny<int> {
  /// Creates a new [RuleInt] with the provided rule function [fn].
  ///
  /// The rule will be automatically wrapped with a runtime type check.
  RuleInt(super._fn);
}

/// A type-safe wrapper for double-specific validation or processing logic.
///
/// This class extends [RuleAny] for the [double] type and applies runtime
/// type guarding to ensure only doubles are validated or parsed.
class RuleDouble extends RuleAny<double> {
  /// Creates a new [RuleDouble] with the provided rule function [fn].
  ///
  /// The rule will be automatically wrapped with a runtime type check.
  RuleDouble(super._fn);
}

/// A type-safe transformation from [String] to [int].
///
/// Extends [TransformAny] and enforces runtime type checks for both input and output types.
class TransformStringToInt extends TransformAny<String, int> {
  /// Creates a new transformation from [String] to [int] with the given function [fn].
  ///
  /// The function will be automatically wrapped with a runtime type check.
  TransformStringToInt(super._fn);
}

/// A type-safe transformation from [String] to [double].
///
/// Extends [TransformAny] and enforces runtime type checks for both input and output types.
class TransformStringToDouble extends TransformAny<String, double> {
  /// Creates a new transformation from [String] to [double] with the given function [fn].
  ///
  /// The function will be automatically wrapped with a runtime type check.
  TransformStringToDouble(super._fn);
}

/// A type-safe wrapper for parsing [String] from untyped value [Object?].
///
/// This class extends [ParseAny] for the [String] type and applies runtime
/// type guarding to ensure only not-null values are parsed.
class ParseString extends ParseAny<String> {
  /// Creates a new [ParseString] with the provided parse function [fn].
  ///
  /// The function will be automatically wrapped with a runtime type check.
  ParseString(super._fn);
}

/// A type-safe wrapper for parsing [int] from untyped value [Object?].
///
/// This class extends [ParseAny] for the [int] type and applies runtime
/// type guarding to ensure only not-null values are parsed.
class ParseInt extends ParseAny<int> {
  /// Creates a new [ParseInt] with the provided parse function [fn].
  ///
  /// The function will be automatically wrapped with a runtime type check.
  ParseInt(super._fn);
}

/// A type-safe wrapper for parsing [double] from untyped value [Object?].
///
/// This class extends [ParseAny] for the [double] type and applies runtime
/// type guarding to ensure only not-null values are parsed.
class ParseDouble extends ParseAny<double> {
  /// Creates a new [ParseDouble] with the provided parse function [fn].
  ///
  /// The function will be automatically wrapped with a runtime type check.
  ParseDouble(super._fn);
}

/// A type-safe wrapper for parsing [bool] from untyped value [Object?].
///
/// This class extends [ParseAny] for the [bool] type and applies runtime
/// type guarding to ensure only not-null values are parsed.
class ParseBool extends ParseAny<bool> {
  /// Creates a new [ParseBool] with the provided parse function [fn].
  ///
  /// The function will be automatically wrapped with a runtime type check.
  ParseBool(super._fn);
}

/// A type-safe wrapper for parsing [T] from untyped value [Object?].
///
/// This class extends [ParseAny] for the [T] type and applies runtime
/// type guarding to ensure only not-null values are parsed.
class ParseObject<T> extends ParseAny<T> {
  /// Creates a new [ParseObject] with the provided parse function [fn].
  ///
  /// The function will be automatically wrapped with a runtime type check.
  ParseObject(super._fn);
}

/// A type-safe wrapper for parsing an array of [T] from untyped value [Object?].
///
/// This class extends [ParseAny] for the [List] of [T]s type and applies runtime
/// type guarding to ensure only not-null values are parsed.
class ParseArray<T> extends ParseAny<List<T>> {
  /// Creates a new [ParseArray] with the provided parse function [fn].
  ///
  /// The function will be automatically wrapped with a runtime type check.
  ParseArray(super._fn);
}
