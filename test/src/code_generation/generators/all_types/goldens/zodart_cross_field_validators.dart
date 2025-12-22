part of '../zodart_src.dart';

/// Inferred Dart type returned from the schema defined in [C].
///
/// This corresponds to the structure described by [C.schema].
typedef _CDef = ({
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

/// Enum for fields declared in [C].
///
/// Values mirror the keys of [C.schema].
enum CProps {
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

/// Helper class for [C].
///
/// Wrapper used to access [CProps] values as getters.
final class _CPropsWrapper {
  const _CPropsWrapper();

  CProps get zArrayOfStr => CProps.zArrayOfStr;

  CProps get zBool => CProps.zBool;

  CProps get zDbl => CProps.zDbl;

  CProps get zDt => CProps.zDt;

  CProps get zInt => CProps.zInt;

  CProps get zObj => CProps.zObj;

  CProps get zStr => CProps.zStr;

  CProps get znArrayOfStr => CProps.znArrayOfStr;

  CProps get znBool => CProps.znBool;

  CProps get znDbl => CProps.znDbl;

  CProps get znDt => CProps.znDt;

  CProps get znInt => CProps.znInt;

  CProps get znObj => CProps.znObj;

  CProps get znStr => CProps.znStr;
}

/// Mixin used as interface for [NewClass2].
///
/// Providing getters and overriding methods.
mixin _C {
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
            other is NewClass2 &&
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
    return 'NewClass2(zArrayOfStr: $zArrayOfStr, zBool: $zBool, zDbl: $zDbl, zDt: $zDt, zInt: $zInt, zObj: $zObj, zStr: $zStr, znArrayOfStr: $znArrayOfStr, znBool: $znBool, znDbl: $znDbl, znDt: $znDt, znInt: $znInt, znObj: $znObj, znStr: $znStr)';
  }
}

/// Class used as implementation for [NewClass2] and [_C].
///
/// Providing fields and a default constructor.
final class _CImpl with _C implements NewClass2 {
  const _CImpl({
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

/// Instantiates the output class [NewClass2] using [_CImpl].
NewClass2 _instantiateC({
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
}) => _CImpl(
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

/// Generated utility class for working with the schema defined in [C].
///
/// Provides:
/// - The `ZObject` instance for parsing/validating the schema.
/// - Enum-style access to the schema properties.
/// - Strongly-typed field access
/// - Runtime `Type` of the schema record
final class _CUtils implements ZGenSchemaUtils<_CPropsWrapper, NewClass2> {
  const _CUtils();

  static const _props = _CPropsWrapper();

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
    'zArrayOfStr': C.schema.zArrayOfStr,
    'zBool': C.schema.zBool,
    'zDbl': C.schema.zDbl,
    'zDt': C.schema.zDt,
    'zInt': C.schema.zInt,
    'zObj': C.schema.zObj,
    'zStr': C.schema.zStr,
    'znArrayOfStr': C.schema.znArrayOfStr,
    'znBool': C.schema.znBool,
    'znDbl': C.schema.znDbl,
    'znDt': C.schema.znDt,
    'znInt': C.schema.znInt,
    'znObj': C.schema.znObj,
    'znStr': C.schema.znStr,
  };

  @override
  _CPropsWrapper get props => _props;

  @override
  List<String> get keys => _keys;

  @override
  ZObject<NewClass2> get zObject {
    return ZObject.withTypedCrossFieldValidation(
      _schemaMap,
      fromJson: _toResult,
      crossValidators: <CrossFieldValidator<CFieldAccessor>>[zStrNotEmpty],
      parsedFieldAccessorFactory: CFieldAccessor.new,
    );
  }

  @override
  Type get schema => _CDef;

  NewClass2 _toResult(Map<String, dynamic> val) => _instantiateC(
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

/// Type-safe parsed fields accessor for [C].
class CFieldAccessor extends ParsedFieldAccessor {
  CFieldAccessor(super.schema, super.parsedValues);

  List<String> get zArrayOfStr => (this['zArrayOfStr'] as List<String>);

  bool get zBool => (this['zBool'] as bool);

  double get zDbl => (this['zDbl'] as double);

  DateTime get zDt => (this['zDt'] as DateTime);

  int get zInt => (this['zInt'] as int);

  ({String id}) get zObj => (this['zObj'] as ({String id}));

  String get zStr => (this['zStr'] as String);

  List<String?>? get znArrayOfStr => (this['znArrayOfStr'] as List<String?>?);

  bool? get znBool => (this['znBool'] as bool?);

  double? get znDbl => (this['znDbl'] as double?);

  DateTime? get znDt => (this['znDt'] as DateTime?);

  int? get znInt => (this['znInt'] as int?);

  ({String id})? get znObj => (this['znObj'] as ({String id})?);

  String? get znStr => (this['znStr'] as String?);
}
