import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';
import 'package:fpdart/fpdart.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';

import '../../types/types.dart';

/// Converter function that transforms a [DartType] into a corresponding Dart type string.
typedef DartTypeToZTypeConverter = String Function(DartType);

/// Converter for ZodArt value types that maps Dart analyzer types ([DartType])
/// to a [String] representation of output type.
///
/// The Dart analyzer provides static types as [DartType].
/// ZodArt value types are defined as value types produced by calling `.parse()` (assuming successful parse)
/// on all subclasses of the sealed [ZBase] class, such as [ZString], [ZObject], etc.
///
/// This utility maps ZodArt types (identified via [DartType])
/// to their corresponding parse result types used in generated code
/// (e.g., `'String'`, `'int'`, `'List<T>'`, etc.).
///
/// For example, when a [DartType] of `ZString` is encountered, this returns `String`.
class ZTypeConverter {
  /// Default ctor
  const ZTypeConverter();

  @visibleForTesting
  /// Map of supported converters from [ZBase] subclasses to Dart type strings.
  static final converters = <Type, DartTypeToZTypeConverter>{
    ZArray: _getConverter('ZArray', (m) => 'List<${m[1]}>'),
    ZBool: (_) => 'bool',
    ZDateTime: (_) => 'DateTime',
    ZDouble: (_) => 'double',
    ZInt: (_) => 'int',
    ZObject: _getConverter('ZObject', (m) => '${m[1]}'),
    ZString: (_) => 'String',
    ZNullableArray: _getConverter('ZNullableArray', (m) => 'List<${m[1]}>?'),
    ZNullableBool: (_) => 'bool?',
    ZNullableDateTime: (_) => 'DateTime?',
    ZNullableDouble: (_) => 'double?',
    ZNullableInt: (_) => 'int?',
    ZNullableObject: _getConverter('ZNullableObject', (m) => '${m[1]}?'),
    ZNullableString: (_) => 'String?',
  };

  static String Function(DartType) _getConverter(String zTypeStr, String Function(Match) replace) {
    return (DartType dartType) {
      return dartType.toString().replaceFirstMapped(RegExp('^$zTypeStr<(.*)>\$'), replace);
    };
  }

  /// Returns true if the [zodType] ([Type]) is the same type as [dartType] ([DartType]).
  bool _isExactType(Type zodType, DartType dartType) => TypeChecker.fromRuntime(zodType).isExactlyType(dartType);

  /// Returns a [String] representing the type of the value produced by calling
  /// `.parse()` on the given [dartType], assuming the parse is successful.
  ///
  /// For example, for `ZString`, this method returns 'String' since the result of
  /// `ZString().parse(...)` is a `String`, assuming the parse succeeds.
  ///
  /// On invalid type returns null.
  String? getOutType(DartType dartType) {
    return Option.fromNullable(
          converters.entries.firstWhereOrNull((entry) => _isExactType(entry.key, dartType)),
        )
        .map(
          (converterEntry) => converterEntry.value,
        )
        .map(
          (converter) => converter(dartType),
        )
        .toNullable();
  }
}
