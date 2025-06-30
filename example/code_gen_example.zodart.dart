// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_gen_example.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [CustomerSchema].
///
/// This corresponds to the structure described by [CustomerSchema.schema].
typedef _$ZCustomerSchemaDef = ({ZString firstName, ZInt id, ZString lastName});

/// Inferred Dart type representing the successful result (value).
/// returned by `ZObject.parse()` for [CustomerSchema].
///
/// Derived from the schema defined in [CustomerSchema.schema].
typedef _$ZCustomerSchemaRes = ({String firstName, int id, String lastName});

/// Enum for fields declared in [CustomerSchema].
///
/// Values mirror the keys of [CustomerSchema.schema].
enum CustomerSchemaProps { firstName, id, lastName }

/// Helper class for [CustomerSchema].
///
/// Wrapper used to access [CustomerSchemaProps] values as getters.
final class _$ZCustomerSchemaPropsWrapper {
  const _$ZCustomerSchemaPropsWrapper();

  CustomerSchemaProps get firstName => CustomerSchemaProps.firstName;

  CustomerSchemaProps get id => CustomerSchemaProps.id;

  CustomerSchemaProps get lastName => CustomerSchemaProps.lastName;
}

/// Generated utility class for working with the schema defined in [CustomerSchema].
///
/// Provides access to:
/// - The `ZObject` instance for parsing/validating the schema.
/// - A `withMapper` function for mapping parsed record to custom objects.
/// - A `shape` descriptor containing field mappings and runtime type info.
/// - Enum-style access to the schema properties.
final class _$ZCustomerSchemaUtils
    implements
        ZGenSchemaUtils<_$ZCustomerSchemaPropsWrapper, _$ZCustomerSchemaRes> {
  const _$ZCustomerSchemaUtils();

  @override
  _$ZCustomerSchemaPropsWrapper get props =>
      const _$ZCustomerSchemaPropsWrapper();

  @override
  ZObject<_$ZCustomerSchemaRes> get zObject {
    return ZObject.withMapper(shape.toMap(), fromJson: shape.toRecord);
  }

  @override
  ZObject<T> withMapper<T>(T Function(_$ZCustomerSchemaRes) mapper) {
    return ZObject.withMapper(
      shape.toMap(),
      fromJson: (val) {
        final rec =
            (
                  firstName: val['firstName'],
                  id: val['id'],
                  lastName: val['lastName'],
                )
                as _$ZCustomerSchemaRes;
        return mapper(rec);
      },
    );
  }

  @override
  ZGenSchemaShape<_$ZCustomerSchemaRes> get shape => (
    toMap: () => {
      'firstName': CustomerSchema.schema.firstName,
      'id': CustomerSchema.schema.id,
      'lastName': CustomerSchema.schema.lastName,
    },
    toRecord: (Map<String, dynamic> val) =>
        (firstName: val['firstName'], id: val['id'], lastName: val['lastName']),
    result: _$ZCustomerSchemaRes,
    schema: _$ZCustomerSchemaDef,
    keys: const ['firstName', 'id', 'lastName'],
  );
}
