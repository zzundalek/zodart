import 'base/base.dart';
import 'z_base_config/z_base_config.dart';

/// A function that takes a [Config] and returns a [Transformer] from [From] to [To].
///
/// Useful for configuring transformers at runtime based on validation settings like nullability.
typedef ConfiguredTransformer<From, To> = Transformer<From, To> Function(Config);
