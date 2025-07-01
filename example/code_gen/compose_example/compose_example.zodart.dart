// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compose_example.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [ObjectSchema].
///
/// This corresponds to the structure described by [ObjectSchema.schema].
typedef _$ZObjectSchemaDef = ({ZNullableInt intVal, ZString str});

/// Inferred Dart type representing the successful result (value).
/// returned by `ZObject.parse()` for [ObjectSchema].
///
/// Derived from the schema defined in [ObjectSchema.schema].
typedef _$ZObjectSchemaRes = ({int? intVal, String str});

/// Enum for fields declared in [ObjectSchema].
///
/// Values mirror the keys of [ObjectSchema.schema].
enum ObjectSchemaProps { intVal, str }

/// Helper class for [ObjectSchema].
///
/// Wrapper used to access [ObjectSchemaProps] values as getters.
final class _$ZObjectSchemaPropsWrapper {
  const _$ZObjectSchemaPropsWrapper();

  ObjectSchemaProps get intVal => ObjectSchemaProps.intVal;

  ObjectSchemaProps get str => ObjectSchemaProps.str;
}

/// Generated utility class for working with the schema defined in [ObjectSchema].
///
/// Provides access to:
/// - The `ZObject` instance for parsing/validating the schema.
/// - A `withMapper` function for mapping parsed record to custom objects.
/// - A `shape` descriptor containing field mappings and runtime type info.
/// - Enum-style access to the schema properties.
final class _$ZObjectSchemaUtils
    implements
        ZGenSchemaUtils<_$ZObjectSchemaPropsWrapper, _$ZObjectSchemaRes> {
  const _$ZObjectSchemaUtils();

  @override
  _$ZObjectSchemaPropsWrapper get props => const _$ZObjectSchemaPropsWrapper();

  @override
  ZObject<_$ZObjectSchemaRes> get zObject {
    return ZObject.withMapper(shape.toMap(), fromJson: shape.toRecord);
  }

  @override
  ZObject<T> withMapper<T>(T Function(_$ZObjectSchemaRes) mapper) {
    return ZObject.withMapper(
      shape.toMap(),
      fromJson: (val) {
        final rec =
            (intVal: val['intVal'], str: val['str']) as _$ZObjectSchemaRes;
        return mapper(rec);
      },
    );
  }

  @override
  ZGenSchemaShape<_$ZObjectSchemaRes> get shape => (
    toMap: () => {
      'intVal': ObjectSchema.schema.intVal,
      'str': ObjectSchema.schema.str,
    },
    toRecord: (Map<String, dynamic> val) =>
        (intVal: val['intVal'], str: val['str']),
    result: _$ZObjectSchemaRes,
    schema: _$ZObjectSchemaDef,
    keys: const ['intVal', 'str'],
  );
}
