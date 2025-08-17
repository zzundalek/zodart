// Ignore for the schema definition
// ignore_for_file: specify_nonobvious_property_types, avoid_print
import 'package:zodart/zodart.dart';

part 'main.zodart.dart';
part 'main.zodart.type.dart';

// Item schema (automatically generates the Item class)
@ZodArt.generateNewClass(outputClassName: 'Item')
abstract class ItemSchema {
  /// Schema definition
  static final schema = (
    id: ZInt().min(1).max(9999),
    name: ZString().trim().min(1).max(20),
    makerName: ZString().process((val) => '$val🚀 '), // append 🚀 to the name
    notes: ZArray(ZString().min(1)).nullable(), // nullable list of notes
    price: ZDouble().min(0),
    archived: ZBool().optional(), // optional archived flag
  );

  // Access to generated helper methods like props list etc.
  static const z = _ItemSchemaUtils();
  static final ZObject<Item> zObject = z.zObject;
}

void main() {
  // Parse a map
  final res = ItemSchema.zObject.parse({
    'id': 7,
    'name': 'Cookie',
    'makerName': 'ZodArt',
    'price': 7.5,
    'notes': null,
  });

  if (res.isSuccess) {
    print(res.value); // Prints: Item(..., id: 7, makerName: ZodArt🚀, ...
  } else {
    print('❌ Validation failed! ${res.issueSummary}'); // Print all issues
    print(
      'Item.price issue:' // Pinpoint only issue for `item.price`
      '${res.getRawIssuesFor(ItemSchema.z.props.price.name)?.localizedSummary}',
    );
  }
}
