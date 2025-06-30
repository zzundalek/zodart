import 'package:source_gen_test/annotations.dart';
import 'package:zodart/zodart.dart';

@ShouldThrow(
  '@ZodArt - annotation can be used only on a class.',
)
@zodart
final ({ZString name}) schema = (name: ZString());

@ShouldThrow(
  '@ZodArt - make the annotated class `abstract`.',
)
@zodart
class NotAbstractClass {}

@ShouldThrow(
  '@ZodArt - missing static field `schema` in `NoSchemaProp`.',
)
@zodart
abstract class NoSchemaProp {
  final schema = '';
}

@ShouldThrow(
  '@ZodArt `InvalidSchemaType.schema` should be defined using Record.',
)
@zodart
abstract class InvalidSchemaType {
  static final schema = <String, dynamic>{};
}

@ShouldThrow(
  '@ZodArt `EmptySchema.schema` cannot be empty.',
)
@zodart
abstract class EmptySchema {
  static const () schema = ();
}

@ShouldThrow(
  '@ZodArt `PositionalArgs.schema` should contain ONLY named fields.',
)
@zodart
abstract class PositionalArgs {
  static final (ZInt, {ZString name}) schema = (ZInt(), name: ZString());
}

@ShouldThrow(
  '''
@ZodArt schema - 'DateTime' is not supported by ZTypeConverter.
Make sure it is a valid ZodArt type and can be inferred correctly at build time.''',
  element: false,
)
@zodart
abstract class UnsupportedType {
  static final ({DateTime name}) schema = (name: DateTime.now());
}
