// Ignore for the schema definition
// ignore_for_file: specify_nonobvious_property_types, avoid_print

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zodart/zodart.dart';

part 'schema_embedding.freezed.dart';
part 'schema_embedding.zodart.dart';
part 'schema_embedding.zodart.type.dart';

@freezed
abstract class Order with _$Order {
  const factory Order({
    required int id,
    required Customer customer,
    required List<Item> items,
  }) = _Order;
}

/// Define the id schema to be reused in other schemas.
final id = ZString().trim().toInt().min(1).max(9999);

/// Customer schema with [ZodArt] annotation
///
/// Reuses the [id] schema.
/// Generate output [Customer] class
@ZodArt.generateNewClass(outputClassName: 'Customer')
abstract class CustomerSchema {
  static final schema = (
    id: id,
    firstName: ZString().trim().min(1).max(20),
    lastName: ZString().trim().min(1).max(20),
  );

  static const z = _CustomerSchemaUtils();
  static ZObject<Customer> zObject = z.zObject;
}

/// Item schema with [ZodArt] annotation
///
/// Reuses the [id] schema.
/// Generate output [Item] class
@ZodArt.generateNewClass(outputClassName: 'Item')
abstract class ItemSchema {
  static final schema = (
    id: id,
    name: ZString().trim().min(1).max(40),
    price: ZDouble().min(0),
  );

  static const z = _ItemSchemaUtils();
  static ZObject<Item> zObject = z.zObject;
}

/// Order schema with [ZodArt] annotation
///
/// Reuses the [ItemSchema] and [CustomerSchema] schema.
/// Uses freezed [Order] class as output
@ZodArt.withExistingClass(outputClassType: Order)
abstract class OrderSchema {
  static final schema = (
    id: ItemSchema.schema.id,
    customer: CustomerSchema.zObject,
    items: ZArray(ItemSchema.zObject),
  );

  static const z = _OrderSchemaUtils();
  static final ZObject<Order> zObject = z.zObject;
}

void main() {
  // Parses into `ZRes<Order>`.
  final res = OrderSchema.zObject.parse({
    'id': '-1', // Invalid id
    'customer': {
      'id': '2413',
      'firstName': 'Zod',
      'lastName': 'Ard',
    },
    'items': [
      {
        'id': '1',
        'name': 'cookie',
        'price': -1.0, // Invalid price
      },
      {
        'id': '2',
        'name': 'coffee',
        'price': 129.0,
      },
    ],
  });

  if (res.isSuccess) {
    print(res.value);
  } else {
    print('❌ Validation failed!');
    print(res.issueSummary);
    print('Order ID issue: ${res.getRawIssuesFor(OrderSchema.z.props.id.name)?.localizedSummary}');
  }
}
