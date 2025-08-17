// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [ItemSchema].
///
/// This corresponds to the structure described by [ItemSchema.schema].
typedef _ItemSchemaDef = ({
  ZNullableBool archived,
  ZInt id,
  ZString makerName,
  ZString name,
  ZNullableArray<String> notes,
  ZDouble price,
});

/// Enum for fields declared in [ItemSchema].
///
/// Values mirror the keys of [ItemSchema.schema].
enum ItemSchemaProps { archived, id, makerName, name, notes, price }

/// Helper class for [ItemSchema].
///
/// Wrapper used to access [ItemSchemaProps] values as getters.
final class _ItemSchemaPropsWrapper {
  const _ItemSchemaPropsWrapper();

  ItemSchemaProps get archived => ItemSchemaProps.archived;

  ItemSchemaProps get id => ItemSchemaProps.id;

  ItemSchemaProps get makerName => ItemSchemaProps.makerName;

  ItemSchemaProps get name => ItemSchemaProps.name;

  ItemSchemaProps get notes => ItemSchemaProps.notes;

  ItemSchemaProps get price => ItemSchemaProps.price;
}

/// Mixin used as interface for [Item].
///
/// Providing getters and overriding methods.
mixin _ItemSchema {
  bool? get archived;
  int get id;
  String get makerName;
  String get name;
  List<String>? get notes;
  double get price;
  @override
  int get hashCode => Object.hash(
    runtimeType,
    archived,
    id,
    makerName,
    name,
    const DeepCollectionEquality().hash(notes),
    price,
  );
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            other is Item &&
            (identical(archived, other.archived) ||
                archived == other.archived) &&
            (identical(id, other.id) || id == other.id) &&
            (identical(makerName, other.makerName) ||
                makerName == other.makerName) &&
            (identical(name, other.name) || name == other.name) &&
            (identical(notes, other.notes) ||
                const DeepCollectionEquality().equals(notes, other.notes)) &&
            (identical(price, other.price) || price == other.price));
  }

  @override
  String toString() {
    return 'Item(archived: $archived, id: $id, makerName: $makerName, name: $name, notes: $notes, price: $price)';
  }
}

/// Class used as implementation for [Item] and [_ItemSchema].
///
/// Providing fields and a default constructor.
final class _ItemSchemaImpl with _ItemSchema implements Item {
  const _ItemSchemaImpl({
    required this.archived,
    required this.id,
    required this.makerName,
    required this.name,
    required this.notes,
    required this.price,
  });

  @override
  final bool? archived;

  @override
  final int id;

  @override
  final String makerName;

  @override
  final String name;

  @override
  final List<String>? notes;

  @override
  final double price;
}

/// Instantiates the output class [Item] using [_ItemSchemaImpl].
Item _instantiateItemSchema({
  required bool? archived,
  required int id,
  required String makerName,
  required String name,
  required List<String>? notes,
  required double price,
}) => _ItemSchemaImpl(
  archived: archived,
  id: id,
  makerName: makerName,
  name: name,
  notes: notes,
  price: price,
);

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

  static const _keys = [
    'archived',
    'id',
    'makerName',
    'name',
    'notes',
    'price',
  ];

  static final Map<String, ZBase<dynamic>> _schemaMap = {
    'archived': ItemSchema.schema.archived,
    'id': ItemSchema.schema.id,
    'makerName': ItemSchema.schema.makerName,
    'name': ItemSchema.schema.name,
    'notes': ItemSchema.schema.notes,
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
    archived: val['archived'] as bool?,
    id: val['id'] as int,
    makerName: val['makerName'] as String,
    name: val['name'] as String,
    notes: val['notes'] as List<String>?,
    price: val['price'] as double,
  );
}
