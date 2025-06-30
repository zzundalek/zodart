part of '../simple_schema_src.dart';

/// Inferred Dart type returned from the schema defined in [S].
///
/// This corresponds to the structure described by [S.schema].
typedef _$ZSDef = ({ZString id});

/// Inferred Dart type representing the successful result (value).
/// returned by `ZObject.parse()` for [S].
///
/// Derived from the schema defined in [S.schema].
typedef _$ZSRes = ({String id});

/// Enum for fields declared in [S].
///
/// Values mirror the keys of [S.schema].
enum SProps { id }

/// Helper class for [S].
///
/// Wrapper used to access [SProps] values as getters.
final class _$ZSPropsWrapper {
  const _$ZSPropsWrapper();

  SProps get id => SProps.id;
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
        final rec = (id: val['id']) as _$ZSRes;
        return mapper(rec);
      },
    );
  }

  @override
  ZGenSchemaShape<_$ZSRes> get shape => (
    toMap: () => {'id': S.schema.id},
    toRecord: (Map<String, dynamic> val) => (id: val['id']),
    result: _$ZSRes,
    schema: _$ZSDef,
    keys: const ['id'],
  );
}
