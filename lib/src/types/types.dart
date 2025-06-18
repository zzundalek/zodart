import 'package:meta/meta.dart';

import '../base/base.dart';
import '../internal_operation_interfaces.dart';
import '../modifiers/modifiers.dart';
import '../z_base_config/z_base_config.dart';

part 'z_array.dart';
part 'z_base.dart';
part 'z_bool.dart';
part 'z_datetime.dart';
part 'z_double.dart';
part 'z_int.dart';
part 'z_nullable_array.dart';
part 'z_nullable_double.dart';
part 'z_nullable_date_time.dart';
part 'z_nullable_int.dart';
part 'z_nullable_object.dart';
part 'z_nullable_string.dart';
part 'z_nullable_bool.dart';
part 'z_object.dart';
part 'z_string.dart';

/// Creates a [ZString] instance with a custom [ZBaseConfig].
///
/// This is intended for testing purposes only, to allow injection of
/// custom or intentionally invalid configurations in order to verify
/// internal error handling and exception paths within the [ZBase] parsing logic.
///
/// This function is marked as `@visibleForTesting` and should not be used in
/// production code.
///
/// See also:
/// - [ZBaseConfig] for configuring parser chains
/// - [ZBase._withConfig] for internal usage
@visibleForTesting
ZString createZStringWithConfigForTesting(ZBaseConfig config) => ZString._withConfig(config);
