// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_gen_class_example.dart';

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

/// Inferred Dart type returned from the schema defined in [ItemSchema].
///
/// This corresponds to the structure described by [ItemSchema.schema].
typedef _$ZItemSchemaDef = ({ZInt id, ZString name, ZDouble price});

/// Inferred Dart type representing the successful result (value).
/// returned by `ZObject.parse()` for [ItemSchema].
///
/// Derived from the schema defined in [ItemSchema.schema].
typedef _$ZItemSchemaRes = ({int id, String name, double price});

/// Enum for fields declared in [ItemSchema].
///
/// Values mirror the keys of [ItemSchema.schema].
enum ItemSchemaProps { id, name, price }

/// Helper class for [ItemSchema].
///
/// Wrapper used to access [ItemSchemaProps] values as getters.
final class _$ZItemSchemaPropsWrapper {
  const _$ZItemSchemaPropsWrapper();

  ItemSchemaProps get id => ItemSchemaProps.id;

  ItemSchemaProps get name => ItemSchemaProps.name;

  ItemSchemaProps get price => ItemSchemaProps.price;
}

/// Generated utility class for working with the schema defined in [ItemSchema].
///
/// Provides access to:
/// - The `ZObject` instance for parsing/validating the schema.
/// - A `withMapper` function for mapping parsed record to custom objects.
/// - A `shape` descriptor containing field mappings and runtime type info.
/// - Enum-style access to the schema properties.
final class _$ZItemSchemaUtils
    implements ZGenSchemaUtils<_$ZItemSchemaPropsWrapper, _$ZItemSchemaRes> {
  const _$ZItemSchemaUtils();

  @override
  _$ZItemSchemaPropsWrapper get props => const _$ZItemSchemaPropsWrapper();

  @override
  ZObject<_$ZItemSchemaRes> get zObject {
    return ZObject.withMapper(shape.toMap(), fromJson: shape.toRecord);
  }

  @override
  ZObject<T> withMapper<T>(T Function(_$ZItemSchemaRes) mapper) {
    return ZObject.withMapper(
      shape.toMap(),
      fromJson: (val) {
        final rec =
            (id: val['id'], name: val['name'], price: val['price'])
                as _$ZItemSchemaRes;
        return mapper(rec);
      },
    );
  }

  @override
  ZGenSchemaShape<_$ZItemSchemaRes> get shape => (
    toMap: () => {
      'id': ItemSchema.schema.id,
      'name': ItemSchema.schema.name,
      'price': ItemSchema.schema.price,
    },
    toRecord: (Map<String, dynamic> val) =>
        (id: val['id'], name: val['name'], price: val['price']),
    result: _$ZItemSchemaRes,
    schema: _$ZItemSchemaDef,
    keys: const ['id', 'name', 'price'],
  );
}

/// Inferred Dart type returned from the schema defined in [OrderSchema].
///
/// This corresponds to the structure described by [OrderSchema.schema].
typedef _$ZOrderSchemaDef = ({
  ZObject<({String firstName, int id, String lastName})> customer,
  ZInt id,
  ZArray<({int id, String name, double price})> items,
});

/// Inferred Dart type representing the successful result (value).
/// returned by `ZObject.parse()` for [OrderSchema].
///
/// Derived from the schema defined in [OrderSchema.schema].
typedef _$ZOrderSchemaRes = ({
  ({String firstName, int id, String lastName}) customer,
  int id,
  List<({int id, String name, double price})> items,
});

/// Enum for fields declared in [OrderSchema].
///
/// Values mirror the keys of [OrderSchema.schema].
enum OrderSchemaProps { customer, id, items }

/// Helper class for [OrderSchema].
///
/// Wrapper used to access [OrderSchemaProps] values as getters.
final class _$ZOrderSchemaPropsWrapper {
  const _$ZOrderSchemaPropsWrapper();

  OrderSchemaProps get customer => OrderSchemaProps.customer;

  OrderSchemaProps get id => OrderSchemaProps.id;

  OrderSchemaProps get items => OrderSchemaProps.items;
}

/// Generated utility class for working with the schema defined in [OrderSchema].
///
/// Provides access to:
/// - The `ZObject` instance for parsing/validating the schema.
/// - A `withMapper` function for mapping parsed record to custom objects.
/// - A `shape` descriptor containing field mappings and runtime type info.
/// - Enum-style access to the schema properties.
final class _$ZOrderSchemaUtils
    implements ZGenSchemaUtils<_$ZOrderSchemaPropsWrapper, _$ZOrderSchemaRes> {
  const _$ZOrderSchemaUtils();

  @override
  _$ZOrderSchemaPropsWrapper get props => const _$ZOrderSchemaPropsWrapper();

  @override
  ZObject<_$ZOrderSchemaRes> get zObject {
    return ZObject.withMapper(shape.toMap(), fromJson: shape.toRecord);
  }

  @override
  ZObject<T> withMapper<T>(T Function(_$ZOrderSchemaRes) mapper) {
    return ZObject.withMapper(
      shape.toMap(),
      fromJson: (val) {
        final rec =
            (customer: val['customer'], id: val['id'], items: val['items'])
                as _$ZOrderSchemaRes;
        return mapper(rec);
      },
    );
  }

  @override
  ZGenSchemaShape<_$ZOrderSchemaRes> get shape => (
    toMap: () => {
      'customer': OrderSchema.schema.customer,
      'id': OrderSchema.schema.id,
      'items': OrderSchema.schema.items,
    },
    toRecord: (Map<String, dynamic> val) =>
        (customer: val['customer'], id: val['id'], items: val['items']),
    result: _$ZOrderSchemaRes,
    schema: _$ZOrderSchemaDef,
    keys: const ['customer', 'id', 'items'],
  );
}
