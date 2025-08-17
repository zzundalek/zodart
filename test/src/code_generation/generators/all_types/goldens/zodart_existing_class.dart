part of '../zodart_src.dart';

/// Inferred Dart type returned from the schema defined in [E].
///
/// This corresponds to the structure described by [E.schema].
typedef _EDef = ({
  ZArray<String> zArrayOfStr,
  ZBool zBool,
  ZDouble zDbl,
  ZDateTime zDt,
  ZInt zInt,
  ZObject<({String id})> zObj,
  ZString zStr,
  ZNullableArray<String?> znArrayOfStr,
  ZNullableBool znBool,
  ZNullableDouble znDbl,
  ZNullableDateTime znDt,
  ZNullableInt znInt,
  ZNullableObject<({String id})> znObj,
  ZNullableString znStr,
});

/// Enum for fields declared in [E].
///
/// Values mirror the keys of [E.schema].
enum EProps {
  zArrayOfStr,
  zBool,
  zDbl,
  zDt,
  zInt,
  zObj,
  zStr,
  znArrayOfStr,
  znBool,
  znDbl,
  znDt,
  znInt,
  znObj,
  znStr,
}

/// Helper class for [E].
///
/// Wrapper used to access [EProps] values as getters.
final class _EPropsWrapper {
  const _EPropsWrapper();

  EProps get zArrayOfStr => EProps.zArrayOfStr;

  EProps get zBool => EProps.zBool;

  EProps get zDbl => EProps.zDbl;

  EProps get zDt => EProps.zDt;

  EProps get zInt => EProps.zInt;

  EProps get zObj => EProps.zObj;

  EProps get zStr => EProps.zStr;

  EProps get znArrayOfStr => EProps.znArrayOfStr;

  EProps get znBool => EProps.znBool;

  EProps get znDbl => EProps.znDbl;

  EProps get znDt => EProps.znDt;

  EProps get znInt => EProps.znInt;

  EProps get znObj => EProps.znObj;

  EProps get znStr => EProps.znStr;
}

/// Instantiates the output class [OutputClass],
/// using the automatically selected constructor.
OutputClass _instantiateE({
  required int? znInt,
  required String? znStr,
  required List<String?>? znArrayOfStr,
  required ({String id})? znObj,
  required bool zBool,
  required DateTime zDt,
  required double zDbl,
  required int zInt,
  required String zStr,
  required List<String> zArrayOfStr,
  required ({String id}) zObj,
  required bool? znBool,
  required DateTime? znDt,
  required double? znDbl,
}) => OutputClass(
  znInt: znInt,
  znStr: znStr,
  znArrayOfStr: znArrayOfStr,
  znObj: znObj,
  zBool: zBool,
  zDt: zDt,
  zDbl: zDbl,
  zInt: zInt,
  zStr: zStr,
  zArrayOfStr: zArrayOfStr,
  zObj: zObj,
  znBool: znBool,
  znDt: znDt,
  znDbl: znDbl,
);

/// Generated utility class for working with the schema defined in [E].
///
/// Provides:
/// - The `ZObject` instance for parsing/validating the schema.
/// - Enum-style access to the schema properties.
/// - Strongly-typed field access
/// - Runtime `Type` of the schema record
final class _EUtils implements ZGenSchemaUtils<_EPropsWrapper, OutputClass> {
  const _EUtils();

  static const _props = _EPropsWrapper();

  static const _keys = [
    'zArrayOfStr',
    'zBool',
    'zDbl',
    'zDt',
    'zInt',
    'zObj',
    'zStr',
    'znArrayOfStr',
    'znBool',
    'znDbl',
    'znDt',
    'znInt',
    'znObj',
    'znStr',
  ];

  static final Map<String, ZBase<dynamic>> _schemaMap = {
    'zArrayOfStr': E.schema.zArrayOfStr,
    'zBool': E.schema.zBool,
    'zDbl': E.schema.zDbl,
    'zDt': E.schema.zDt,
    'zInt': E.schema.zInt,
    'zObj': E.schema.zObj,
    'zStr': E.schema.zStr,
    'znArrayOfStr': E.schema.znArrayOfStr,
    'znBool': E.schema.znBool,
    'znDbl': E.schema.znDbl,
    'znDt': E.schema.znDt,
    'znInt': E.schema.znInt,
    'znObj': E.schema.znObj,
    'znStr': E.schema.znStr,
  };

  @override
  _EPropsWrapper get props => _props;

  @override
  List<String> get keys => _keys;

  @override
  ZObject<OutputClass> get zObject => ZObject.withMapper(_schemaMap, fromJson: _toResult);

  @override
  Type get schema => _EDef;

  OutputClass _toResult(Map<String, dynamic> val) => _instantiateE(
    zArrayOfStr: val['zArrayOfStr'] as List<String>,
    zBool: val['zBool'] as bool,
    zDbl: val['zDbl'] as double,
    zDt: val['zDt'] as DateTime,
    zInt: val['zInt'] as int,
    zObj: val['zObj'] as ({String id}),
    zStr: val['zStr'] as String,
    znArrayOfStr: val['znArrayOfStr'] as List<String?>?,
    znBool: val['znBool'] as bool?,
    znDbl: val['znDbl'] as double?,
    znDt: val['znDt'] as DateTime?,
    znInt: val['znInt'] as int?,
    znObj: val['znObj'] as ({String id})?,
    znStr: val['znStr'] as String?,
  );
}
