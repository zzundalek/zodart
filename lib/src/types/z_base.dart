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
  ZBase._new(Operation<Object?, dynamic> parse) : _config = ZBaseConfig(fns: [parse]);
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
            'Error occurred at fixing type after parsing. '
            'Value "$r" of type "${r.runtimeType}" Expected to have type "$T".',
          );
        }
      },
    );
  }

  /// Adds a transformation function to the pipeline.
  ///
  /// Used internally by built-in methods (e.g. `.toDouble()`).
  ZType _transformBuildIn<ZType extends ZBase<dynamic>, From, To>({
    required ZType Function(ZBaseConfig) constructor,
    required ResTransformer<From, To> transformer,
  }) {
    return constructor(
      _config.addTransformation(
        Transformation(
          transformer,
          isUserDefined: false,
        ),
      ),
    );
  }

  /// Adds a pure processing function to the pipeline.
  ///
  /// Used for both built-in methods (e.g. `.trim()`) and user-defined `.process()` calls.
  /// Returns a new instance of [ZBase] subclass using [constructor].
  ZType _processPure<ZType extends ZBase<dynamic>, Val>({
    required ZType Function(ZBaseConfig) constructor,
    required Processor<Val> processor,
    required bool isUserDefined,
  }) {
    return constructor(
      _config.addProcessing(
        Processing<Val>(
          (val) => ZRes.success(processor(val)),
          isUserDefined: isUserDefined,
        ),
      ),
    );
  }

  /// Adds a built-in validation rule to the pipeline.
  ///
  /// Used for methods like `.min()` or `.max()`.
  /// Returns a new instance of [ZBase] subclass using [constructor].
  ZType _validateBuildIn<ZType extends ZBase<dynamic>, Val>({
    required ZType Function(ZBaseConfig) constructor,
    required ResRule<Val> validation,
  }) {
    return constructor(
      _config.addValidation(
        Validation(
          validation,
          isUserDefined: false,
        ),
      ),
    );
  }

  /// Adds a custom validation rule to the pipeline using `.refine()`.
  ///
  /// Returns a new instance of [ZBase] subclass using [constructor].
  /// Optional [message] and [code] can be used to customize the error.
  ZType _refine<ZType extends ZBase<dynamic>, Val>({
    required ZType Function(ZBaseConfig) constructor,
    required Refiner<Val> refiner,
    String? message,
    String? code,
  }) {
    return constructor(
      _config.addValidation(
        Validation(
          refineRule(refiner, message: message, code: code),
          isUserDefined: true,
        ),
      ),
    );
  }

  /// Adds a complex validation rule using `.superRefine()`.
  ///
  /// Allows cross-field or contextual validation.
  /// Returns a new instance of [ZBase] subclass using [constructor].
  ZType _superRefine<ZType extends ZBase<dynamic>, Val>({
    required ZType Function(ZBaseConfig) constructor,
    required SuperRefiner<Val> refiner,
  }) {
    return constructor(
      _config.addValidation(
        Validation(
          superRefineRule(refiner),
          isUserDefined: true,
        ),
      ),
    );
  }

  /// Marks this schema as nullable.
  ///
  /// Returns a new instance of [ZBase] subclass using [constructor].
  ZType _nullable<ZType extends ZBase<dynamic>>({
    required ZType Function(ZBaseConfig) constructor,
  }) {
    return constructor(_config.makeNullable());
  }

  /// Marks this schema as optional (may be omitted).
  ///
  /// Returns a new instance of [ZBase] subclass using [constructor].
  ZType _optional<ZType extends ZBase<dynamic>>({
    required ZType Function(ZBaseConfig) constructor,
  }) {
    return constructor(_config.makeOptional());
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
