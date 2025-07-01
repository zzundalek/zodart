part of '../full_schema_src.dart';

/// Inferred Dart type returned from the schema defined in [S].
///
/// This corresponds to the structure described by [S.schema].
typedef _$ZSDef = ({
  ZArray<String> arrayType,
  ZBool boolType,
  ZDateTime dateTimeType,
  ZDouble doubleType,
  ZInt intType,
  ZNullableArray<String?> nullableArrayType,
  ZNullableBool nullableBoolType,
  ZNullableDateTime nullableDateTimeType,
  ZNullableDouble nullableDoubleType,
  ZNullableInt nullableIntType,
  ZObject<({String id})?> nullableObjType,
  ZNullableString nullableStringType,
  ZObject<({String id})> objType,
  ZString stringType,
});

/// Inferred Dart type representing the successful result (value).
/// returned by `ZObject.parse()` for [S].
///
/// Derived from the schema defined in [S.schema].
typedef _$ZSRes = ({
  List<String> arrayType,
  bool boolType,
  DateTime dateTimeType,
  double doubleType,
  int intType,
  List<String?>? nullableArrayType,
  bool? nullableBoolType,
  DateTime? nullableDateTimeType,
  double? nullableDoubleType,
  int? nullableIntType,
  ({String id})? nullableObjType,
  String? nullableStringType,
  ({String id}) objType,
  String stringType,
});

/// Enum for fields declared in [S].
///
/// Values mirror the keys of [S.schema].
enum SProps {
  arrayType,
  boolType,
  dateTimeType,
  doubleType,
  intType,
  nullableArrayType,
  nullableBoolType,
  nullableDateTimeType,
  nullableDoubleType,
  nullableIntType,
  nullableObjType,
  nullableStringType,
  objType,
  stringType,
}

/// Helper class for [S].
///
/// Wrapper used to access [SProps] values as getters.
final class _$ZSPropsWrapper {
  const _$ZSPropsWrapper();

  SProps get arrayType => SProps.arrayType;

  SProps get boolType => SProps.boolType;

  SProps get dateTimeType => SProps.dateTimeType;

  SProps get doubleType => SProps.doubleType;

  SProps get intType => SProps.intType;

  SProps get nullableArrayType => SProps.nullableArrayType;

  SProps get nullableBoolType => SProps.nullableBoolType;

  SProps get nullableDateTimeType => SProps.nullableDateTimeType;

  SProps get nullableDoubleType => SProps.nullableDoubleType;

  SProps get nullableIntType => SProps.nullableIntType;

  SProps get nullableObjType => SProps.nullableObjType;

  SProps get nullableStringType => SProps.nullableStringType;

  SProps get objType => SProps.objType;

  SProps get stringType => SProps.stringType;
}

/// Generated utility class for working with the schema defined in [S].
///
/// Provides access to:
/// - The `ZObject` instance for parsing/validating the schema.
/// - A `withMapper` function for mapping parsed record to custom objects.
/// - A `shape` descriptor containing field mappings and runtime type info.
/// - Enum-style access to the schema properties.
final class _$ZSUtils implements ZGenSchemaUtils<_$ZSPropsWrapper, _$ZSRes> {
  const _$ZSUtils();

  @override
  _$ZSPropsWrapper get props => const _$ZSPropsWrapper();

  @override
  ZObject<_$ZSRes> get zObject {
    return ZObject.withMapper(shape.toMap(), fromJson: shape.toRecord);
  }

  @override
  ZObject<T> withMapper<T>(T Function(_$ZSRes) mapper) {
    return ZObject.withMapper(
      shape.toMap(),
      fromJson: (val) {
        final rec =
            (
                  arrayType: val['arrayType'],
                  boolType: val['boolType'],
                  dateTimeType: val['dateTimeType'],
                  doubleType: val['doubleType'],
                  intType: val['intType'],
                  nullableArrayType: val['nullableArrayType'],
                  nullableBoolType: val['nullableBoolType'],
                  nullableDateTimeType: val['nullableDateTimeType'],
                  nullableDoubleType: val['nullableDoubleType'],
                  nullableIntType: val['nullableIntType'],
                  nullableObjType: val['nullableObjType'],
                  nullableStringType: val['nullableStringType'],
                  objType: val['objType'],
                  stringType: val['stringType'],
                )
                as _$ZSRes;
        return mapper(rec);
      },
    );
  }

  @override
  ZGenSchemaShape<_$ZSRes> get shape => (
    toMap: () => {
      'arrayType': S.schema.arrayType,
      'boolType': S.schema.boolType,
      'dateTimeType': S.schema.dateTimeType,
      'doubleType': S.schema.doubleType,
      'intType': S.schema.intType,
      'nullableArrayType': S.schema.nullableArrayType,
      'nullableBoolType': S.schema.nullableBoolType,
      'nullableDateTimeType': S.schema.nullableDateTimeType,
      'nullableDoubleType': S.schema.nullableDoubleType,
      'nullableIntType': S.schema.nullableIntType,
      'nullableObjType': S.schema.nullableObjType,
      'nullableStringType': S.schema.nullableStringType,
      'objType': S.schema.objType,
      'stringType': S.schema.stringType,
    },
    toRecord: (Map<String, dynamic> val) => (
      arrayType: val['arrayType'],
      boolType: val['boolType'],
      dateTimeType: val['dateTimeType'],
      doubleType: val['doubleType'],
      intType: val['intType'],
      nullableArrayType: val['nullableArrayType'],
      nullableBoolType: val['nullableBoolType'],
      nullableDateTimeType: val['nullableDateTimeType'],
      nullableDoubleType: val['nullableDoubleType'],
      nullableIntType: val['nullableIntType'],
      nullableObjType: val['nullableObjType'],
      nullableStringType: val['nullableStringType'],
      objType: val['objType'],
      stringType: val['stringType'],
    ),
    result: _$ZSRes,
    schema: _$ZSDef,
    keys: const [
      'arrayType',
      'boolType',
      'dateTimeType',
      'doubleType',
      'intType',
      'nullableArrayType',
      'nullableBoolType',
      'nullableDateTimeType',
      'nullableDoubleType',
      'nullableIntType',
      'nullableObjType',
      'nullableStringType',
      'objType',
      'stringType',
    ],
  );
}
