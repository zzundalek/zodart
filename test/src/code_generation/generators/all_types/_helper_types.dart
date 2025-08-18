// Automatic schema type inference
// ignore_for_file: specify_nonobvious_property_types

import 'package:zodart/zodart.dart';

// **************************************************************************
// Output types
// **************************************************************************

/// Class used as an output
/// Note: names are selected carfully not to cause
/// formatting issue.
final class OutputClass {
  const OutputClass({
    required this.zBool,
    required this.zDt,
    required this.zDbl,
    required this.zInt,
    required this.zStr,
    required this.zArrayOfStr,
    required this.zObj,
    required this.znBool,
    required this.znDt,
    required this.znDbl,
    this.znInt,
    this.znStr,
    this.znArrayOfStr,
    this.znObj,
  });

  final bool zBool;
  final DateTime zDt;
  final double zDbl;
  final int zInt;
  final String zStr;
  final List<String> zArrayOfStr;
  final EmbeddedObj zObj;
  final bool? znBool;
  final DateTime? znDt;
  final double? znDbl;
  final int? znInt;
  final String? znStr;
  final List<String?>? znArrayOfStr;
  final EmbeddedObj? znObj;
}

// **************************************************************************
// All types schema definition
// **************************************************************************

typedef EmbeddedObj = ({String id});

final embeddedObject = ZObject<EmbeddedObj>.withMapper(
  {'id': ZString()},
  fromJson: (val) => (id: val['id']),
);

final allTypesSchemaDef = (
  zBool: ZBool(),
  zDt: ZDateTime(),
  zDbl: ZDouble(),
  zInt: ZInt(),
  zStr: ZString(),
  zArrayOfStr: ZArray(ZString()),
  zObj: embeddedObject,
  znBool: ZBool().nullable(),
  znDt: ZDateTime().nullable(),
  znDbl: ZDouble().nullable(),
  znInt: ZInt().nullable(),
  znStr: ZString().nullable(),
  znArrayOfStr: ZArray(ZString().nullable()).nullable(),
  znObj: embeddedObject.nullable(),
);
