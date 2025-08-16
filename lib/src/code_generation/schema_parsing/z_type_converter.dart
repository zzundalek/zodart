import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart' show Reference, refer;
import 'package:collection/collection.dart';
import 'package:fpdart/fpdart.dart';
import 'package:source_gen/source_gen.dart';

import '../../types/types.dart';

/// Tuple type representing a mapping from a subclass of [ZBase] to a converter function
/// that transforms a [DartType] into a corresponding Dart type string.
typedef DartTypeToZTypeConvertor = ({Type zType, String Function(DartType) converter});

/// Converter for ZodArt value types that maps Dart analyzer types ([DartType])
/// to [Reference] representations used in code generation.
///
/// The Dart analyzer provides static types as [DartType].
/// Code generation, on the other hand, requires types as [Reference]s (e.g. `refer('String')`).
/// ZodArt value types are defined as value types produced by calling `.parse()` (assuming successful parse)
/// on all subclasses of the sealed [ZBase] class, such as [ZString], [ZObject], etc.
///
/// This utility maps ZodArt types (identified via [DartType])
/// to their corresponding parse result types used in generated code
/// (e.g., `'String'`, `'int'`, `'List<T>'`, etc.).
///
/// For example, when a [DartType] of `ZString` is encountered, this returns `refer('String')`.
class ZTypeConverter {
  /// Unmodifiable list of supported converters from [ZBase] subclasses to Dart type strings.
  static final converters = List<DartTypeToZTypeConvertor>.unmodifiable([
    (zType: ZArray, converter: _getConverter('ZArray', (m) => 'List<${m[1]}>')),
    (zType: ZBool, converter: (_) => 'bool'),
    (zType: ZDateTime, converter: (_) => 'DateTime'),
    (zType: ZDouble, converter: (_) => 'double'),
    (zType: ZInt, converter: (_) => 'int'),
    (zType: ZObject, converter: _getConverter('ZObject', (m) => '${m[1]}')),
    (zType: ZString, converter: (_) => 'String'),
    (zType: ZNullableArray, converter: _getConverter('ZNullableArray', (m) => 'List<${m[1]}>?')),
    (zType: ZNullableBool, converter: (_) => 'bool?'),
    (zType: ZNullableDateTime, converter: (_) => 'DateTime?'),
    (zType: ZNullableDouble, converter: (_) => 'double?'),
    (zType: ZNullableInt, converter: (_) => 'int?'),
    (zType: ZNullableObject, converter: _getConverter('ZNullableObject', (m) => '${m[1]}?')),
    (zType: ZNullableString, converter: (_) => 'String?'),
  ]);

  static String Function(DartType) _getConverter(String zTypeStr, String Function(Match) replace) {
    return (DartType dartType) {
      return dartType.toString().replaceFirstMapped(RegExp('^$zTypeStr<(.*)>\$'), replace);
    };
  }

  /// Returns true if the [zodType] ([Type]) is the same type as [dartType] ([DartType]).
  static bool _isExactType(Type zodType, DartType dartType) => TypeChecker.fromRuntime(zodType).isExactlyType(dartType);

  /// Returns a [Reference] representing the type of the value produced by calling
  /// `.parse()` on the given [dartType], assuming the parse is successful.
  ///
  /// For example, for `ZString`, this method returns `refer('String')` since the result of
  /// `ZString().parse(...)` is a `String`, assuming the parse succeeds.
  ///
  /// Throws an [InvalidGenerationSource] if the type is not a supported ZodArt type.
  // TODO(zzundalek): need to be removed
  static Reference getTypeReference(DartType dartType) {
    final match = converters.firstWhere(
      (entry) => _isExactType(entry.zType, dartType),
      orElse: () => throw InvalidGenerationSource('''
@ZodArt schema - '$dartType' is not supported by ZTypeConverter.
Make sure it is a valid ZodArt type and can be inferred correctly at build time.'''),
    );

    return refer(match.converter(dartType));
  }

  /// Returns a [String] representing the type of the value produced by calling
  /// `.parse()` on the given [dartType], assuming the parse is successful.
  ///
  /// For example, for `ZString`, this method returns 'String' since the result of
  /// `ZString().parse(...)` is a `String`, assuming the parse succeeds.
  ///
  /// On invalid type returns null.
  String? getOutType(DartType dartType) {
    return Option.fromNullable(
          converters.firstWhereOrNull((entry) => _isExactType(entry.zType, dartType)),
        )
        .map(
          (converterEntry) => converterEntry.converter,
        )
        .map(
          (converter) => converter(dartType),
        )
        .toNullable();
  }
}
