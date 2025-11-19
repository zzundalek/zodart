// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'output_record.dart';

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

/// Generated utility class for working with the schema defined in [ItemSchema].
///
/// Provides:
/// - The `ZObject` instance for parsing/validating the schema.
/// - Enum-style access to the schema properties.
/// - Strongly-typed field access
/// - Runtime `Type` of the schema record
final class _ItemSchemaUtils
    implements
        ZGenSchemaUtils<
          _ItemSchemaPropsWrapper,
          ({
            bool? archived,
            int id,
            String makerName,
            String name,
            List<String>? notes,
            double price,
          })
        > {
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
  ZObject<
    ({
      bool? archived,
      int id,
      String makerName,
      String name,
      List<String>? notes,
      double price,
    })
  >
  get zObject {
    return ZObject.withMapper(_schemaMap, fromJson: _toResult);
  }

  @override
  Type get schema => _ItemSchemaDef;

  ({
    bool? archived,
    int id,
    String makerName,
    String name,
    List<String>? notes,
    double price,
  })
  _toResult(Map<String, dynamic> val) => _instantiateItemSchema(
    archived: val['archived'] as bool?,
    id: val['id'] as int,
    makerName: val['makerName'] as String,
    name: val['name'] as String,
    notes: val['notes'] as List<String>?,
    price: val['price'] as double,
  );
}

/// Creates the output record
({
  bool? archived,
  int id,
  String makerName,
  String name,
  List<String>? notes,
  double price,
})
_instantiateItemSchema({
  required bool? archived,
  required int id,
  required String makerName,
  required String name,
  required List<String>? notes,
  required double price,
}) => (
  archived: archived,
  id: id,
  makerName: makerName,
  name: name,
  notes: notes,
  price: price,
);
