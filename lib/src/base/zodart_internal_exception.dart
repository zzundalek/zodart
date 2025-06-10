import '../z_base_config/z_base_config.dart';

/// Unexpected, unrecoverable exception which occured during parsing, transformation, or validation.
class ZodArtInternalException implements Exception {
  /// Creates a ZodArtInternalException indicating a critical internal error.
  /// This should not be caught; fix the source of the bug instead.
  ZodArtInternalException(
    this.message, {
    this.stackTrace,
    this.value,
    Config? config,
  }) : _config = config;

  /// Detailed error description
  final Object message;

  /// Config
  final Config? _config;

  /// Stack trace
  final StackTrace? stackTrace;

  /// Value to be parsed
  final Object? value;

  @override
  String toString() {
    var msg = 'ZodArt internal exception: ${Error.safeToString(message)}\nValue to be parsed: "$value"';

    if (_config != null) msg += '\n$_config';
    if (stackTrace != null) msg += '\n$stackTrace';

    return msg;
  }
}
