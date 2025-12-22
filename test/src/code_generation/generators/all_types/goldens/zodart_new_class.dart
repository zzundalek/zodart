part of '../zodart_src.dart';

/// Inferred Dart type returned from the schema defined in [N].
///
/// This corresponds to the structure described by [N.schema].
typedef _NDef = ({
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

/// Enum for fields declared in [N].
///
/// Values mirror the keys of [N.schema].
enum NProps {
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

/// Helper class for [N].
///
/// Wrapper used to access [NProps] values as getters.
final class _NPropsWrapper {
  const _NPropsWrapper();

  NProps get zArrayOfStr => NProps.zArrayOfStr;

  NProps get zBool => NProps.zBool;

  NProps get zDbl => NProps.zDbl;

  NProps get zDt => NProps.zDt;

  NProps get zInt => NProps.zInt;

  NProps get zObj => NProps.zObj;

  NProps get zStr => NProps.zStr;

  NProps get znArrayOfStr => NProps.znArrayOfStr;

  NProps get znBool => NProps.znBool;

  NProps get znDbl => NProps.znDbl;

  NProps get znDt => NProps.znDt;

  NProps get znInt => NProps.znInt;

  NProps get znObj => NProps.znObj;

  NProps get znStr => NProps.znStr;
}

/// Mixin used as interface for [NewClass].
///
/// Providing getters and overriding methods.
mixin _N {
  List<String> get zArrayOfStr;
  bool get zBool;
  double get zDbl;
  DateTime get zDt;
  int get zInt;
  ({String id}) get zObj;
  String get zStr;
  List<String?>? get znArrayOfStr;
  bool? get znBool;
  double? get znDbl;
  DateTime? get znDt;
  int? get znInt;
  ({String id})? get znObj;
  String? get znStr;
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(zArrayOfStr),
    zBool,
    zDbl,
    zDt,
    zInt,
    zObj,
    zStr,
    const DeepCollectionEquality().hash(znArrayOfStr),
    znBool,
    znDbl,
    znDt,
    znInt,
    znObj,
    znStr,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            other is NewClass &&
            (identical(zArrayOfStr, other.zArrayOfStr) ||
                const DeepCollectionEquality().equals(
                  zArrayOfStr,
                  other.zArrayOfStr,
                )) &&
            (identical(zBool, other.zBool) || zBool == other.zBool) &&
            (identical(zDbl, other.zDbl) || zDbl == other.zDbl) &&
            (identical(zDt, other.zDt) || zDt == other.zDt) &&
            (identical(zInt, other.zInt) || zInt == other.zInt) &&
            (identical(zObj, other.zObj) || zObj == other.zObj) &&
            (identical(zStr, other.zStr) || zStr == other.zStr) &&
            (identical(znArrayOfStr, other.znArrayOfStr) ||
                const DeepCollectionEquality().equals(
                  znArrayOfStr,
                  other.znArrayOfStr,
                )) &&
            (identical(znBool, other.znBool) || znBool == other.znBool) &&
            (identical(znDbl, other.znDbl) || znDbl == other.znDbl) &&
            (identical(znDt, other.znDt) || znDt == other.znDt) &&
            (identical(znInt, other.znInt) || znInt == other.znInt) &&
            (identical(znObj, other.znObj) || znObj == other.znObj) &&
            (identical(znStr, other.znStr) || znStr == other.znStr));
  }

  @override
  String toString() {
    return 'NewClass(zArrayOfStr: $zArrayOfStr, zBool: $zBool, zDbl: $zDbl, zDt: $zDt, zInt: $zInt, zObj: $zObj, zStr: $zStr, znArrayOfStr: $znArrayOfStr, znBool: $znBool, znDbl: $znDbl, znDt: $znDt, znInt: $znInt, znObj: $znObj, znStr: $znStr)';
  }
}

/// Class used as implementation for [NewClass] and [_N].
///
/// Providing fields and a default constructor.
final class _NImpl with _N implements NewClass {
  const _NImpl({
    required this.zArrayOfStr,
    required this.zBool,
    required this.zDbl,
    required this.zDt,
    required this.zInt,
    required this.zObj,
    required this.zStr,
    required this.znArrayOfStr,
    required this.znBool,
    required this.znDbl,
    required this.znDt,
    required this.znInt,
    required this.znObj,
    required this.znStr,
  });

  @override
  final List<String> zArrayOfStr;

  @override
  final bool zBool;

  @override
  final double zDbl;

  @override
  final DateTime zDt;

  @override
  final int zInt;

  @override
  final ({String id}) zObj;

  @override
  final String zStr;

  @override
  final List<String?>? znArrayOfStr;

  @override
  final bool? znBool;

  @override
  final double? znDbl;

  @override
  final DateTime? znDt;

  @override
  final int? znInt;

  @override
  final ({String id})? znObj;

  @override
  final String? znStr;
}

/// Instantiates the output class [NewClass] using [_NImpl].
NewClass _instantiateN({
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
}) => _NImpl(
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

/// Generated utility class for working with the schema defined in [N].
///
/// Provides:
/// - The `ZObject` instance for parsing/validating the schema.
/// - Enum-style access to the schema properties.
/// - Strongly-typed field access
/// - Runtime `Type` of the schema record
final class _NUtils implements ZGenSchemaUtils<_NPropsWrapper, NewClass> {
  const _NUtils();

  static const _props = _NPropsWrapper();

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
    'zArrayOfStr': N.schema.zArrayOfStr,
    'zBool': N.schema.zBool,
    'zDbl': N.schema.zDbl,
    'zDt': N.schema.zDt,
    'zInt': N.schema.zInt,
    'zObj': N.schema.zObj,
    'zStr': N.schema.zStr,
    'znArrayOfStr': N.schema.znArrayOfStr,
    'znBool': N.schema.znBool,
    'znDbl': N.schema.znDbl,
    'znDt': N.schema.znDt,
    'znInt': N.schema.znInt,
    'znObj': N.schema.znObj,
    'znStr': N.schema.znStr,
  };

  @override
  _NPropsWrapper get props => _props;

  @override
  List<String> get keys => _keys;

  @override
  ZObject<NewClass> get zObject {
    return ZObject.withMapper(_schemaMap, fromJson: _toResult);
  }

  @override
  Type get schema => _NDef;

  NewClass _toResult(Map<String, dynamic> val) => _instantiateN(
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
