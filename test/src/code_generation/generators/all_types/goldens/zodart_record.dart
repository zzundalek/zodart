part of '../zodart_src.dart';

/// Inferred Dart type returned from the schema defined in [R].
///
/// This corresponds to the structure described by [R.schema].
typedef _RDef = ({
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

/// Enum for fields declared in [R].
///
/// Values mirror the keys of [R.schema].
enum RProps {
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

/// Helper class for [R].
///
/// Wrapper used to access [RProps] values as getters.
final class _RPropsWrapper {
  const _RPropsWrapper();

  RProps get zArrayOfStr => RProps.zArrayOfStr;

  RProps get zBool => RProps.zBool;

  RProps get zDbl => RProps.zDbl;

  RProps get zDt => RProps.zDt;

  RProps get zInt => RProps.zInt;

  RProps get zObj => RProps.zObj;

  RProps get zStr => RProps.zStr;

  RProps get znArrayOfStr => RProps.znArrayOfStr;

  RProps get znBool => RProps.znBool;

  RProps get znDbl => RProps.znDbl;

  RProps get znDt => RProps.znDt;

  RProps get znInt => RProps.znInt;

  RProps get znObj => RProps.znObj;

  RProps get znStr => RProps.znStr;
}

/// Generated utility class for working with the schema defined in [R].
///
/// Provides:
/// - The `ZObject` instance for parsing/validating the schema.
/// - Enum-style access to the schema properties.
/// - Strongly-typed field access
/// - Runtime `Type` of the schema record
final class _RUtils
    implements
        ZGenSchemaUtils<
          _RPropsWrapper,
          ({
            List<String> zArrayOfStr,
            bool zBool,
            double zDbl,
            DateTime zDt,
            int zInt,
            ({String id}) zObj,
            String zStr,
            List<String?>? znArrayOfStr,
            bool? znBool,
            double? znDbl,
            DateTime? znDt,
            int? znInt,
            ({String id})? znObj,
            String? znStr,
          })
        > {
  const _RUtils();

  static const _props = _RPropsWrapper();

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
    'zArrayOfStr': R.schema.zArrayOfStr,
    'zBool': R.schema.zBool,
    'zDbl': R.schema.zDbl,
    'zDt': R.schema.zDt,
    'zInt': R.schema.zInt,
    'zObj': R.schema.zObj,
    'zStr': R.schema.zStr,
    'znArrayOfStr': R.schema.znArrayOfStr,
    'znBool': R.schema.znBool,
    'znDbl': R.schema.znDbl,
    'znDt': R.schema.znDt,
    'znInt': R.schema.znInt,
    'znObj': R.schema.znObj,
    'znStr': R.schema.znStr,
  };

  @override
  _RPropsWrapper get props => _props;

  @override
  List<String> get keys => _keys;

  @override
  ZObject<
    ({
      List<String> zArrayOfStr,
      bool zBool,
      double zDbl,
      DateTime zDt,
      int zInt,
      ({String id}) zObj,
      String zStr,
      List<String?>? znArrayOfStr,
      bool? znBool,
      double? znDbl,
      DateTime? znDt,
      int? znInt,
      ({String id})? znObj,
      String? znStr,
    })
  >
  get zObject {
    return ZObject.withMapper(_schemaMap, fromJson: _toResult);
  }

  @override
  Type get schema => _RDef;

  ({
    List<String> zArrayOfStr,
    bool zBool,
    double zDbl,
    DateTime zDt,
    int zInt,
    ({String id}) zObj,
    String zStr,
    List<String?>? znArrayOfStr,
    bool? znBool,
    double? znDbl,
    DateTime? znDt,
    int? znInt,
    ({String id})? znObj,
    String? znStr,
  })
  _toResult(Map<String, dynamic> val) => _instantiateR(
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

/// Creates the output record
({
  List<String> zArrayOfStr,
  bool zBool,
  double zDbl,
  DateTime zDt,
  int zInt,
  ({String id}) zObj,
  String zStr,
  List<String?>? znArrayOfStr,
  bool? znBool,
  double? znDbl,
  DateTime? znDt,
  int? znInt,
  ({String id})? znObj,
  String? znStr,
})
_instantiateR({
  required List<String> zArrayOfStr,
  required bool zBool,
  required double zDbl,
  required DateTime zDt,
  required int zInt,
  required ({String id}) zObj,
  required String zStr,
  required List<String?>? znArrayOfStr,
  required bool? znBool,
  required double? znDbl,
  required DateTime? znDt,
  required int? znInt,
  required ({String id})? znObj,
  required String? znStr,
}) => (
  zArrayOfStr: zArrayOfStr,
  zBool: zBool,
  zDbl: zDbl,
  zDt: zDt,
  zInt: zInt,
  zObj: zObj,
  zStr: zStr,
  znArrayOfStr: znArrayOfStr,
  znBool: znBool,
  znDbl: znDbl,
  znDt: znDt,
  znInt: znInt,
  znObj: znObj,
  znStr: znStr,
);
