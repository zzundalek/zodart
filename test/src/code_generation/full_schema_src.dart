import 'package:source_gen_test/annotations.dart';
import 'package:zodart/zodart.dart';

part 'goldens/test_full_schema.dart';

typedef EmbeddedObj = ({String id});

final embeddedObject = ZObject<EmbeddedObj>.withMapper(
  {'id': ZString()},
  fromJson: (val) => (id: val['id']),
);

final embeddedNullableObject = ZObject<EmbeddedObj?>.withMapper(
  {'id': ZString().nullable()},
  fromJson: (val) => (id: val['id']),
);

// NOTE: Keep the class name to one char to avoid pana code format issue
@ShouldGenerateFile(
  'goldens/test_full_schema.dart',
  partOfCurrent: true,
)
@zodart
abstract class S {
  // Automatic schema type inference
  // ignore: specify_nonobvious_property_types
  static final schema = (
    boolType: ZBool(),
    dateTimeType: ZDateTime(),
    doubleType: ZDouble(),
    intType: ZInt(),
    stringType: ZString(),
    arrayType: ZArray(ZString()),
    objType: embeddedObject,
    nullableBoolType: ZBool().nullable(),
    nullableDateTimeType: ZDateTime().nullable(),
    nullableDoubleType: ZDouble().nullable(),
    nullableIntType: ZInt().nullable(),
    nullableStringType: ZString().nullable(),
    nullableArrayType: ZArray(ZString().nullable()).nullable(),
    nullableObjType: embeddedNullableObject,
  );

  static const z = _$ZSUtils();
}
