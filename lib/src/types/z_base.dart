part of 'types.dart';

/// The abstract base class for all ZodArt schema types.
///
/// This sealed class represents a generic schema definition in ZodArt.
/// Concrete types (e.g., string, number, object) extend this class to implement
/// specific validation and transformation logic.
///
/// Not intended to be used directly. Use one of the schema constructors
/// (e.g., `ZString()`, etc.) to create schemas.
sealed class ZBase<T> {
  ZBase._new(ParseAny<dynamic> parse) : _config = ZBaseConfig(fns: [parse]);
  ZBase._withConfig(this._config);

  final ZBaseConfig _config;

  /// Returns `true` if `null` is allowed as a valid input.
  bool get isNullable => _config.nullable;

  /// Returns `true` if the value can be omitted from the input.
  bool get isOptional => _config.optional;

  ZRes<T> _fixLeftGenericType(ZRes<dynamic> dynamicZRes) {
    return dynamicZRes.match(
      ZRes.error,
      (r) {
        if (r == null) {
          return ZRes.success(r as T);
        } else if (r is T) {
          return ZRes.success(r);
        } else {
          throw ZodArtInternalException(
            'Error occurred at fixing type after parsing. Value "$r" of type "${r.runtimeType}" Expected to have type "$T".', // TODO(zzundalek): two lines
          );
        }
      },
    );
  }

  /// Parses [val] using the configured transformation pipeline and returns a [ZRes]
  /// containing either the successfully parsed value or a validation error.
  ///
  /// See [ZRes] for more details on success and error handling.
  ///
  /// Throws a [ZodArtInternalException] **only in case of an unexpected internal failure**,
  /// such as a misconfigured transformation or an unhandled exception.
  /// This should never happen during normal usage, and typically indicates a bug
  /// in the validation schema or library internals.
  ZRes<T> parse(Object? val) {
    try {
      // Forced to use this workaround instead of flatMap not to expose fpdart
      final parseRes = _config.fns.fold(ZRes.success(val), (current, transformation) {
        if (current.isError) return current;
        final configuredTransformer = transformation.fn(_config);
        return configuredTransformer(current.value);
      });

      // NOTE: Need to fix the generic type for Left as it is untouched during processing above
      return _fixLeftGenericType(parseRes);
    } on ZodArtInternalException catch (e, stack) {
      /// NOTE: Add ZBaseConfig to the exception and throw
      throw ZodArtInternalException(
        e.message,
        value: val,
        config: _config,
        stackTrace: stack,
      );
    } catch (e, stack) {
      throw ZodArtInternalException(
        'Unknown exception: "$e"',
        value: val,
        config: _config,
        stackTrace: stack,
      );
    }
  }
}
