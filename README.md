[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg?color=brightgreen)](LICENSE)
![Pub Points](https://img.shields.io/pub/points/zodart)
[![Code coverage](https://img.shields.io/badge/coverage-100%25-brightgreen?logo=codecov)](https://app.codecov.io/gh/zzundalek/zodart)
![GitHub open bugs](https://img.shields.io/github/issues-search/zzundalek/zodart?query=is%3Aissue%20label%3Abug%20is%3Aopen%20&logo=openbugbounty&logoColor=orange&label=bugs&color=brightgreen)
![GitHub next milestone details](https://img.shields.io/github/milestones/progress-percent/zzundalek/zodart/7?logo=rocket)
![GitHub last commit](https://img.shields.io/github/last-commit/zzundalek/zodart)

<p align="center">
  <img src="https://github.com/zzundalek/zodart/blob/main/resources/zodart_card_wide.png?raw=true" width="100%" alt="ZodArt" /> 
</p>

## 🎯 Parse-first schema validation with static type inference

Parse unstructured data from APIs, Flutter forms, config files, and more — with type safety and static type inference. [ZodArt](https://zodart.mergepanic.com) provides a powerful, expressive API to define validation schemas and parse unknown data into strongly typed Dart values.

**See [ZodArt documentation](https://zodart.mergepanic.com/docs/) for more info.**

## Simple example

```dart
import 'package:zodart/zodart.dart';

/// The string’s length must be between 1 and 20
final minMaxSchema = ZString().trim().min(1).max(20);

/// Extends [minMaxSchema] to allow null values
final nullableSchema = minMaxSchema.nullable();

// 24-hour time format with a custom error message
final timeSchema = ZString().regex(
  r'^([01]\d|2[0-3]):[0-5]\d$',
  message: '⚠️ Invalid time format!',
);

// Helper function that sums a list of integers
int sum(List<int> ints) => ints.reduce((a, b) => a + b);

// A list of integers with at least one item
final intsSchema = ZArray(ZInt()).min(1);

void main() {
  final res = minMaxSchema.parse('  ZodArt ');

  // To check the parsed result, use `.isSuccess`
  if (res.isSuccess) {
    print('Success: ${res.value}');
  }
  // Or use the match method for a more functional style.
  res.match(
    (issues) => print('❌ Validation failed: ${issues.localizedSummary}'),
    (val) => print('🟢 Validation successful: $val'),
  );

  // Validate a nullable value
  print(nullableSchema.parse(null).value);

  // Regex validation with custom error message
  print(timeSchema.parse('23:9').issueSummary);

  // Transform the list of integers into a string
  final sumSchema = intsSchema.toStr((vals) => 'Sum: ${sum(vals)}');
  print(sumSchema.parse([1, 2, 3, 4]).value);
}
```

## Complex example

Even though [ZodArt](https://zodart.mergepanic.com) works perfectly without code generation, using it is **[highly recommended](https://zodart.mergepanic.com/docs/getting_started/code_generation/)** — it brings rock-solid type safety 🧬, greatly improves developer experience and significantly reduces boilerplate 🚀. See [full example with code generation](example/main.dart) or an [example without code generation](example/no_code_generation/no_code_generation.dart).

To start using the code generation [set it up first](https://zodart.mergepanic.com/docs/getting_started/installation/) and simplify schema creation with [ZodArt Snippets for VS Code](https://marketplace.visualstudio.com/items?itemName=mergepanic.zodart-snippets).

![ZodArt Snippets extension](https://github.com/zzundalek/zodart/blob/main/resources/zodart_snippets_new_class.gif?raw=true)

```dart
import 'package:zodart/zodart.dart';

part '<FILE_NAME>.zodart.dart';
part '<FILE_NAME>.zodart.type.dart';

// Item schema (automatically generates the Item class)
@ZodArt.generateNewClass(outputClassName: 'Item')
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

  res.match(
    (issues) => print('❌ Validation failed: ${issues.localizedSummary}'),
    (item) => print('🟢 Validation successful: $item'),
  );

  // To obtain only issues summary for `item.price` use `getSummaryFor`
  final priceIssueSummary = res.getSummaryFor(ItemSchemaProps.price.name);
  print('Item.price issue: $priceIssueSummary');
}
```
