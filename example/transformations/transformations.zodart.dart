// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'transformations.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [LanguageDetailSchema].
///
/// This corresponds to the structure described by [LanguageDetailSchema.schema].
typedef _LanguageDetailSchemaDef = ({
  ZDateTime lastUpdate,
  ZString name,
  ZNullableArray<String> notes,
  ZNullableString version,
});

/// Enum for fields declared in [LanguageDetailSchema].
///
/// Values mirror the keys of [LanguageDetailSchema.schema].
enum LanguageDetailSchemaProps { lastUpdate, name, notes, version }

/// Helper class for [LanguageDetailSchema].
///
/// Wrapper used to access [LanguageDetailSchemaProps] values as getters.
final class _LanguageDetailSchemaPropsWrapper {
  const _LanguageDetailSchemaPropsWrapper();

  LanguageDetailSchemaProps get lastUpdate =>
      LanguageDetailSchemaProps.lastUpdate;

  LanguageDetailSchemaProps get name => LanguageDetailSchemaProps.name;

  LanguageDetailSchemaProps get notes => LanguageDetailSchemaProps.notes;

  LanguageDetailSchemaProps get version => LanguageDetailSchemaProps.version;
}

/// Mixin used as interface for [LanguageDetail].
///
/// Providing getters and overriding methods.
mixin _LanguageDetailSchema {
  DateTime get lastUpdate;
  String get name;
  List<String>? get notes;
  String? get version;
  @override
  int get hashCode => Object.hash(
    runtimeType,
    lastUpdate,
    name,
    const DeepCollectionEquality().hash(notes),
    version,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            other is LanguageDetail &&
            (identical(lastUpdate, other.lastUpdate) ||
                lastUpdate == other.lastUpdate) &&
            (identical(name, other.name) || name == other.name) &&
            (identical(notes, other.notes) ||
                const DeepCollectionEquality().equals(notes, other.notes)) &&
            (identical(version, other.version) || version == other.version));
  }

  @override
  String toString() {
    return 'LanguageDetail(lastUpdate: $lastUpdate, name: $name, notes: $notes, version: $version)';
  }
}

/// Class used as implementation for [LanguageDetail] and [_LanguageDetailSchema].
///
/// Providing fields and a default constructor.
final class _LanguageDetailSchemaImpl
    with _LanguageDetailSchema
    implements LanguageDetail {
  const _LanguageDetailSchemaImpl({
    required this.lastUpdate,
    required this.name,
    required this.notes,
    required this.version,
  });

  @override
  final DateTime lastUpdate;

  @override
  final String name;

  @override
  final List<String>? notes;

  @override
  final String? version;
}

/// Instantiates the output class [LanguageDetail] using [_LanguageDetailSchemaImpl].
LanguageDetail _instantiateLanguageDetailSchema({
  required DateTime lastUpdate,
  required String name,
  required List<String>? notes,
  required String? version,
}) => _LanguageDetailSchemaImpl(
  lastUpdate: lastUpdate,
  name: name,
  notes: notes,
  version: version,
);

/// Generated utility class for working with the schema defined in [LanguageDetailSchema].
///
/// Provides:
/// - The `ZObject` instance for parsing/validating the schema.
/// - Enum-style access to the schema properties.
/// - Strongly-typed field access
/// - Runtime `Type` of the schema record
final class _LanguageDetailSchemaUtils
    implements
        ZGenSchemaUtils<_LanguageDetailSchemaPropsWrapper, LanguageDetail> {
  const _LanguageDetailSchemaUtils();

  static const _props = _LanguageDetailSchemaPropsWrapper();

  static const _keys = ['lastUpdate', 'name', 'notes', 'version'];

  static final Map<String, ZBase<dynamic>> _schemaMap = {
    'lastUpdate': LanguageDetailSchema.schema.lastUpdate,
    'name': LanguageDetailSchema.schema.name,
    'notes': LanguageDetailSchema.schema.notes,
    'version': LanguageDetailSchema.schema.version,
  };

  @override
  _LanguageDetailSchemaPropsWrapper get props => _props;

  @override
  List<String> get keys => _keys;

  @override
  ZObject<LanguageDetail> get zObject {
    return ZObject.withMapper(_schemaMap, fromJson: _toResult);
  }

  @override
  Type get schema => _LanguageDetailSchemaDef;

  LanguageDetail _toResult(Map<String, dynamic> val) =>
      _instantiateLanguageDetailSchema(
        lastUpdate: val['lastUpdate'] as DateTime,
        name: val['name'] as String,
        notes: val['notes'] as List<String>?,
        version: val['version'] as String?,
      );
}
