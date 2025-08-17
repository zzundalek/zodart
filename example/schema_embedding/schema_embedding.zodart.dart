// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema_embedding.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [CustomerSchema].
///
/// This corresponds to the structure described by [CustomerSchema.schema].
typedef _CustomerSchemaDef = ({ZString firstName, ZInt id, ZString lastName});

/// Enum for fields declared in [CustomerSchema].
///
/// Values mirror the keys of [CustomerSchema.schema].
enum CustomerSchemaProps { firstName, id, lastName }

/// Helper class for [CustomerSchema].
///
/// Wrapper used to access [CustomerSchemaProps] values as getters.
final class _CustomerSchemaPropsWrapper {
  const _CustomerSchemaPropsWrapper();

  CustomerSchemaProps get firstName => CustomerSchemaProps.firstName;

  CustomerSchemaProps get id => CustomerSchemaProps.id;

  CustomerSchemaProps get lastName => CustomerSchemaProps.lastName;
}

/// Mixin used as interface for [Customer].
///
/// Providing getters and overriding methods.
mixin _CustomerSchema {
  String get firstName;
  int get id;
  String get lastName;
  @override
  int get hashCode => Object.hash(runtimeType, firstName, id, lastName);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            other is Customer &&
            (identical(firstName, other.firstName) ||
                firstName == other.firstName) &&
            (identical(id, other.id) || id == other.id) &&
            (identical(lastName, other.lastName) ||
                lastName == other.lastName));
  }

  @override
  String toString() {
    return 'Customer(firstName: $firstName, id: $id, lastName: $lastName)';
  }
}

/// Class used as implementation for [Customer] and [_CustomerSchema].
///
/// Providing fields and a default constructor.
final class _CustomerSchemaImpl with _CustomerSchema implements Customer {
  const _CustomerSchemaImpl({
    required this.firstName,
    required this.id,
    required this.lastName,
  });

  @override
  final String firstName;

  @override
  final int id;

  @override
  final String lastName;
}

/// Instantiates the output class [Customer] using [_CustomerSchemaImpl].
Customer _instantiateCustomerSchema({
  required String firstName,
  required int id,
  required String lastName,
}) => _CustomerSchemaImpl(firstName: firstName, id: id, lastName: lastName);

/// Generated utility class for working with the schema defined in [CustomerSchema].
///
/// Provides:
/// - The `ZObject` instance for parsing/validating the schema.
/// - Enum-style access to the schema properties.
/// - Strongly-typed field access
/// - Runtime `Type` of the schema record
final class _CustomerSchemaUtils
    implements ZGenSchemaUtils<_CustomerSchemaPropsWrapper, Customer> {
  const _CustomerSchemaUtils();

  static const _props = _CustomerSchemaPropsWrapper();

  static const _keys = ['firstName', 'id', 'lastName'];

  static final Map<String, ZBase<dynamic>> _schemaMap = {
    'firstName': CustomerSchema.schema.firstName,
    'id': CustomerSchema.schema.id,
    'lastName': CustomerSchema.schema.lastName,
  };

  @override
  _CustomerSchemaPropsWrapper get props => _props;

  @override
  List<String> get keys => _keys;

  @override
  ZObject<Customer> get zObject =>
      ZObject.withMapper(_schemaMap, fromJson: _toResult);

  @override
  Type get schema => _CustomerSchemaDef;

  Customer _toResult(Map<String, dynamic> val) => _instantiateCustomerSchema(
    firstName: val['firstName'] as String,
    id: val['id'] as int,
    lastName: val['lastName'] as String,
  );
}

/// Inferred Dart type returned from the schema defined in [ItemSchema].
///
/// This corresponds to the structure described by [ItemSchema.schema].
typedef _ItemSchemaDef = ({ZInt id, ZString name, ZDouble price});

/// Enum for fields declared in [ItemSchema].
///
/// Values mirror the keys of [ItemSchema.schema].
enum ItemSchemaProps { id, name, price }

/// Helper class for [ItemSchema].
///
/// Wrapper used to access [ItemSchemaProps] values as getters.
final class _ItemSchemaPropsWrapper {
  const _ItemSchemaPropsWrapper();

  ItemSchemaProps get id => ItemSchemaProps.id;

  ItemSchemaProps get name => ItemSchemaProps.name;

  ItemSchemaProps get price => ItemSchemaProps.price;
}

/// Mixin used as interface for [Item].
///
/// Providing getters and overriding methods.
mixin _ItemSchema {
  int get id;
  String get name;
  double get price;
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            other is Item &&
            (identical(id, other.id) || id == other.id) &&
            (identical(name, other.name) || name == other.name) &&
            (identical(price, other.price) || price == other.price));
  }

  @override
  String toString() {
    return 'Item(id: $id, name: $name, price: $price)';
  }
}

/// Class used as implementation for [Item] and [_ItemSchema].
///
/// Providing fields and a default constructor.
final class _ItemSchemaImpl with _ItemSchema implements Item {
  const _ItemSchemaImpl({
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  final int id;

  @override
  final String name;

  @override
  final double price;
}

/// Instantiates the output class [Item] using [_ItemSchemaImpl].
Item _instantiateItemSchema({
  required int id,
  required String name,
  required double price,
}) => _ItemSchemaImpl(id: id, name: name, price: price);

/// Generated utility class for working with the schema defined in [ItemSchema].
///
/// Provides:
/// - The `ZObject` instance for parsing/validating the schema.
/// - Enum-style access to the schema properties.
/// - Strongly-typed field access
/// - Runtime `Type` of the schema record
final class _ItemSchemaUtils
    implements ZGenSchemaUtils<_ItemSchemaPropsWrapper, Item> {
  const _ItemSchemaUtils();

  static const _props = _ItemSchemaPropsWrapper();

  static const _keys = ['id', 'name', 'price'];

  static final Map<String, ZBase<dynamic>> _schemaMap = {
    'id': ItemSchema.schema.id,
    'name': ItemSchema.schema.name,
    'price': ItemSchema.schema.price,
  };

  @override
  _ItemSchemaPropsWrapper get props => _props;

  @override
  List<String> get keys => _keys;

  @override
  ZObject<Item> get zObject =>
      ZObject.withMapper(_schemaMap, fromJson: _toResult);

  @override
  Type get schema => _ItemSchemaDef;

  Item _toResult(Map<String, dynamic> val) => _instantiateItemSchema(
    id: val['id'] as int,
    name: val['name'] as String,
    price: val['price'] as double,
  );
}

/// Inferred Dart type returned from the schema defined in [OrderSchema].
///
/// This corresponds to the structure described by [OrderSchema.schema].
typedef _OrderSchemaDef = ({
  ZObject<Customer> customer,
  ZInt id,
  ZArray<Item> items,
});

/// Enum for fields declared in [OrderSchema].
///
/// Values mirror the keys of [OrderSchema.schema].
enum OrderSchemaProps { customer, id, items }

/// Helper class for [OrderSchema].
///
/// Wrapper used to access [OrderSchemaProps] values as getters.
final class _OrderSchemaPropsWrapper {
  const _OrderSchemaPropsWrapper();

  OrderSchemaProps get customer => OrderSchemaProps.customer;

  OrderSchemaProps get id => OrderSchemaProps.id;

  OrderSchemaProps get items => OrderSchemaProps.items;
}

/// Instantiates the output class [Order],
/// using the automatically selected constructor.
Order _instantiateOrderSchema({
  required int id,
  required Customer customer,
  required List<Item> items,
}) => Order(id: id, customer: customer, items: items);

/// Generated utility class for working with the schema defined in [OrderSchema].
///
/// Provides:
/// - The `ZObject` instance for parsing/validating the schema.
/// - Enum-style access to the schema properties.
/// - Strongly-typed field access
/// - Runtime `Type` of the schema record
final class _OrderSchemaUtils
    implements ZGenSchemaUtils<_OrderSchemaPropsWrapper, Order> {
  const _OrderSchemaUtils();

  static const _props = _OrderSchemaPropsWrapper();

  static const _keys = ['customer', 'id', 'items'];

  static final Map<String, ZBase<dynamic>> _schemaMap = {
    'customer': OrderSchema.schema.customer,
    'id': OrderSchema.schema.id,
    'items': OrderSchema.schema.items,
  };

  @override
  _OrderSchemaPropsWrapper get props => _props;

  @override
  List<String> get keys => _keys;

  @override
  ZObject<Order> get zObject =>
      ZObject.withMapper(_schemaMap, fromJson: _toResult);

  @override
  Type get schema => _OrderSchemaDef;

  Order _toResult(Map<String, dynamic> val) => _instantiateOrderSchema(
    customer: val['customer'] as Customer,
    id: val['id'] as int,
    items: val['items'] as List<Item>,
  );
}
