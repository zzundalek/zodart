// Ignore for the schema definition
// ignore_for_file: specify_nonobvious_property_types, avoid_print
import 'package:zodart/zodart.dart';

part 'output_record.zodart.dart';

typedef Item = ({int id, String name, String makerName, List<String>? notes, double price, bool? archived});

// Item schema (automatically generates the Item class)
@ZodArt.withRecord(outputRecordType: Item)
abstract class ItemSchema {
  /// Schema definition
  static final schema = (
    id: ZInt().min(1).max(9999),
    name: ZString().trim().min(1).max(20),
    makerName: ZString().process((val) => '$val🚀'), // append 🚀 to the name
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

  // To access the parsed result use `.isSuccess`
  if (res.isSuccess) {
    print(res.value); // Prints: (..., id: 7, makerName: ZodArt🚀, ...
  } else {
    print('❌ Validation failed: ${res.issueSummary}'); // Print all issues
  }

  // Or use `match` method for a more FP way
  res.match(
    (issues) => print('❌ Validation failed: ${issues.localizedSummary}'),
    (item) => print('🟢 Validation successful: $item'),
  );

  // To obtain only issues summary for `item.price` use `getSummaryFor`
  final priceIssueSummary = res.getSummaryFor(ItemSchemaProps.price.name);
  print('Item.price issue: $priceIssueSummary');
}
