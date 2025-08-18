![Pub Points](https://img.shields.io/pub/points/zodart)
[![Code coverage](https://img.shields.io/badge/coverage-100%25-brightgreen?logo=codecov)](https://app.codecov.io/gh/zzundalek/zodart)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg?color=brightgreen)](LICENSE)

## 🎯 Type-safe schema validation with **static type inference** and a parse-first design for Dart and Flutter.

Parse unstructured data from APIs, Flutter forms, config files, and more — with type safety and static type inference. ZodArt provides a powerful, expressive API to define validation schemas and parse unknown data into strongly typed Dart values.
**ZodArt never throws!** You always get a typed value — or a detailed error report.

> 🚀 **ZodArt is under active development — feedback and contributions welcome!**

| Version | Status                                                                                                                                                                                                                                                                                       |
| ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| current | [![Pub Version](https://img.shields.io/pub/v/zodart.svg?)](https://pub.dev/packages/zodart) ![GitHub open bugs](https://img.shields.io/github/issues-search/zzundalek/zodart?query=is%3Aissue%20label%3Abug%20is%3Aopen%20&logo=openbugbounty&logoColor=orange&label=bugs&color=brightgreen) |
| next    | ![GitHub next milestone details](https://img.shields.io/github/milestones/progress-percent/zzundalek/zodart/5?logo=rocket) ![GitHub last commit](https://img.shields.io/github/last-commit/zzundalek/zodart)                                                                                 |

## Simple example

Even though ZodArt works perfectly without code generation, using it is **highly recommended** — it brings rock-solid type safety 🧬 greatly improves developer experience and significantly reduces boilerplate 🚀. See [full example with code generation](example/main.dart) or an [example without code generation](example/no_code_generation/no_code_generation.dart).

To start using the code generation [set it up first](#setup-code-generation).

```dart
import 'package:zodart/zodart.dart';

// part '<FILE_NAME>.zodart.dart';
// part '<FILE_NAME>.zodart.type.dart';

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
```

## Table of contents

- [Features](#features)
- [Basic Usage](#basic-usage)
- [Parsing values](#parsing-values)
- [Nullable & optional values](#nullable--optional-values)
- [Validation & refine](#validation--refine)
- [Value processing](#value-processing)
- [Localization & Custom Errors](#localization--custom-errors)
- [Additional information](#additional-information)

## Features

- **Rock-solid type safety** with optional code generation (no more magic strings!)
- Define schemas for both primitive and complex types
- Parse unknown or unstructured data into strongly typed Dart values
- Seamless integration with `freezed` models
- **Composable and reusable** schemas for easy code sharing and modularity
- Supports nested objects, arrays, optional and nullable fields
- Built-in various validation rules (e.g. `.min()`, `.max()`, etc.)
- Support for user-defined custom rules via `.refine()`
- Rich, localizable, developer-friendly error messages
- Designed for use with REST APIs, GraphQL, JSON files, and form input

You can check the planned features and report bugs or feature requests by opening an issue on the [GitHub page](https://github.com/zzundalek/zodart/issues).

## Basic usage

### Setup code generation

Setting up ZodArt with code generation is quick and easy:

1. Add ZodArt and [build_runner](https://pub.dev/packages/build_runner) to your dependencies:

   For Flutter project:

   ```bash
   flutter pub add zodart
   flutter pub add dev:build_runner
   ```

   For Dart project:

   ```bash
   dart pub add zodart
   dart pub add dev:build_runner
   ```

1. Add a `part` directive to include the generated code:

   ```dart
   import 'package:zodart/zodart.dart';

   // MANDATORY
   // Add part '<your_file_name.zodart.dart>'; so for 'code_gen_example.dart' add:
   part 'code_gen_example.zodart.dart';

   // MANDATORY when generating output class
   // Add part '<your_file_name.zodart.type.dart>'; so for 'code_gen_example.dart' add:
   part 'code_gen_example.zodart.type.dart';

   /// your code using `@ZodArt` annotation follows
   ```

1. Run `build_runner` to generate the ZodArt helper / output classes

   ```bash
   dart run build_runner build
   ```

See more about code generation in the [build_runner package](https://pub.dev/packages/build_runner).

### Code generation

**Why code generation?**

- ✅ Automatically generates a **type-safe `ZObject` mapper** — no more magic strings!
- ✅ Handles nested schemas and arrays automatically.
- ✅ Automatically generates schema output classes if needed.
- ✅ Supports mapping to existing Freezed or custom classes.
- ✅ Exposes type-safe property access to simplify field-specific issue handling.

### ZodArt annotation

#### Use an existing class

Annotation: `@ZodArt.withExistingClass(outputClassType: <TYPE>)`

Automatically selects the best constructor and instantiates the class. The class must have a public constructor with only named parameters and no positional parameters.

#### Generate the output class

Annotation: `@ZodArt.generateNewClass(outputClassName: '<CLASS_NAME>')`

Automatically generates a class with name specified in the annotation and uses it for instantiation. Overrides the `.toString()`, `hashCode`, and the equality (`==`) operator automatically.

`part '<file_name>.zodart.type.dart';` **must be added**!

### Reusing and composing schemas

Define simple schemas and compose them into complex ones. See [full example](example/simple_compose/simple_compose.dart).

```dart
import 'package:zodart/zodart.dart';

part 'simple_compose.zodart.dart';
part 'simple_compose.zodart.type.dart';

/// The String cannot be empty and is trimmed after the parse
final minSchema = ZString().trim().min(1);

/// Extends the [minSchema] and adds rule that the String must be max 10 characters long
final minMaxSchema = minSchema.max(10);

/// Extends the [minMaxSchema] and adds rule that the String can be `null`
final minMaxNullableSchema = minMaxSchema.nullable();

/// Extends the [minMaxNullableSchema] and conversion from String to Int in the end
final composedNullableIntSchema = minMaxNullableSchema.toInt();

/// Object schema composed from previously defined schemas
@ZodArt.generateNewClass(outputClassName: 'Obj')
abstract class ObjSchema {
  static final schema = (
    strVal: minSchema,
    intVal: composedNullableIntSchema,
  );

  static const z = _ObjSchemaUtils();
  static final ZObject<Obj> zObject = z.zObject;
}

void main() {
  // Returns: true (empty string after trim, violates min(1) rule)
  minSchema.parse('     ').isError;

  // Returns: 'ZodArt'
  minSchema.parse(' ZodArt  ').value;

  // Returns: 'ZodArt'
  minMaxSchema.parse(' ZodArt ').value;

  // Returns: true
  minMaxNullableSchema.parse(null).isSuccess;

  // Returns: 105
  composedNullableIntSchema.parse(' 105  ').value;

  // Returns: true
  composedNullableIntSchema.parse(null).isSuccess;

  // Returns error message: Failed to parse value 'ZodArt', from String to int.
  composedNullableIntSchema.parse('ZodArt').issueSummary;

  // Returns: Obj(intVal: 100, strVal: ZodArt)
  ObjSchema.zObject.parse({'strVal': 'ZodArt', 'intVal': ' 100 '}).value;
}
```

## Parsing values

By default, ZodArt parsers operate in **strict mode**. This means they will only accept input values that **match the expected type exactly**. Any type mismatch will result in a **ParseError**.
The only exception is **ZObject**, which strictly accepts only `Map<String, dynamic>` as input. See more [parsers here](doc/parsers/parsers.md).

## Nullable & optional values

In Dart, unlike JavaScript, there is no concept of `undefined` value. However, when parsing `ZObject` from `Map<String, dynamic>`, a missing key (`!map.containsKey('key')`) is the Dart equivalent of `undefined`. To explicitly allow missing keys, ZodArt provides the `.optional()` modifier.

For all other schemas like `ZString`, `ZInt`, etc., there is no concept of a "missing" value outside a `ZObject`. In this context, the `.optional()` modifier has no semantic effect and is treated as **equivalent** to `.nullable()`.

See more at [nullable modifier doc](doc/modifiers/nullability.md).

## Handling null values with onNull

Sometimes you don’t just want to accept null, but also provide a default value in that case.
For this purpose, every nullable schema type supports the .onNull() handler, which is invoked whenever the current value is null.

See the [full example](example/on_null_method/on_null_method.dart).

```dart
import 'package:zodart/zodart.dart';

void main() {
  final zString = ZString().nullable().onNull(() => 'default value');

  print(zString.parse('ZodArt').value); // ZodArt
  print(zString.parse(null).value); // default value
}
```

## Validation & refine

> ⚠️ Important: Do not throw exceptions inside a `.refine()` function — ZodArt will not catch them.
> ℹ️ Validation is skipped automatically for null values.

Use the `.refine()` method to add custom validation logic to any schema. This function should return `true` if the value is valid, or `false` otherwise.
When `.refine()` returns `false`, ZodArt creates a `ZIssueCustom` issue.
You can optionally provide a `message` or `code` to include in the issue.

See [full example](example/refine_method/refine_method.dart).

> ℹ️ To return multiple issues or apply advanced validations use the `.superRefine()` [method](example/super_refine_method/super_refine_method.dart).

```dart
import 'package:zodart/zodart.dart';

part 'refine_method.zodart.dart';
part 'refine_method.zodart.type.dart';

/// Schema defined using ZodArt
@ZodArt.generateNewClass(outputClassName: 'Person')
abstract class PersonSchema {
  /// Validates that:
  /// - `firstName` is from 1 to 20 characters long
  /// - `lastName` is from 1 to 30 characters long
  /// - `validFrom` is a timestamp in seconds
  /// - `validTo` is an optional timestamp in seconds
  static final schema = (
    firstName: ZString().min(1).max(20),
    lastName: ZString().min(1).max(30),
    validFrom: ZInt(),
    validTo: ZInt().optional(),
  );

  // Access to generated helper methods like props list etc.
  static const z = _PersonSchemaUtils();
  static final ZObject<Person> zObject = z.zObject;
}

void main() {
  // Refine the `personSchema` to ensure that `validFrom` < `validTo`
  final refinedPersonSchema = PersonSchema.zObject.refine(
    (person) {
      final validTo = person.validTo;
      return validTo == null || person.validFrom < validTo;
    },
    message: 'validFrom must be earlier than validTo.',
  );

  // Parse raw input (e.g. from an API, user form, etc.)
  // ZodArt infers the type of `result.value` as `Person`
  final result = refinedPersonSchema.parse({
    'firstName': 'Zod',
    'lastName': 'Art',
    'validFrom': 1749952242,
    'validTo': 631152000,
  });

  // Prints the custom error message 'validFrom must be earlier than validTo.'
  print(result.issueSummary);
}
```

## Value processing

To transform a value, use the `.process()` method.
It is available on all schema types, and can be chained freely.
The returned value must **match the return type of the schema**.

> ℹ️ Processing is skipped automatically for null values.

```dart
import 'package:zodart/zodart.dart';

String toTrendyUpperCase(String val) => '🔥 ${val.trim().toUpperCase()}';
String toFlashySuffix(String val) => '$val ✨';

List<T> revertList<T>(List<T> val) => val.reversed.toList();

final zString = ZArray(ZString().process(toTrendyUpperCase).process(toFlashySuffix)).process(revertList);

void main() {
  final res = zString.parse([' zodart ', 'world   ', '  hello']);

  print(res.value); // [🔥 HELLO ✨, 🔥 WORLD ✨, 🔥 ZODART ✨]
}
```

## Value transformation

Often you’ll want to parse the raw input, and then transform it into a domain model that your app actually uses.
ZodArt makes this straightforward with the built-in transformation methods (e.g. `.toInt()`, `.toObj(t)`, `.toArray(t)`, etc.).

These transformation methods are applied only to non-null values. For more about the available transformations, see the [types table](doc/types/types.md).

See full example [here](example/transformations/transformations.dart).

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zodart/zodart.dart';

part 'transformations.freezed.dart';
part 'transformations.zodart.dart';
part 'transformations.zodart.type.dart';

@ZodArt.generateNewClass(outputClassName: 'LanguageDetail')
abstract class LanguageDetailSchema {
  static final schema = (
    name: ZString(),
    version: ZString().optional(),
    lastUpdate: ZDateTime(),
    notes: ZArray(ZString()).nullable(),
  );

  static const z = _LanguageDetailSchemaUtils();
  static final ZObject<LanguageDetail> zObject = z.zObject;
}

@freezed
abstract class Language with _$Language {
  const factory Language({
    required String name,
    required String version,
  }) = _Language;
}

Language toLang(LanguageDetail l) => Language(name: l.name, version: l.version ?? 'Not available');

void main() {
  final languageDetailsSchema = LanguageDetailSchema.zObject;
  final languageSchema = languageDetailsSchema.toObj(toLang);

  final res = languageSchema.parse({
    'name': 'Dart',
    'version': '3.9.0',
    'lastUpdate': DateTime.parse('2025-08-13'),
    'notes': null,
  });

  print(res.value); // Language(name: Dart, version: 3.9.0)
}
```

## Localization & custom errors

- Default language is set to English, to change it use `ZLocalizationContext.current`
- ZodArt contains various helpers for error handling, see documentation for more info!

See [full example](example/localization/localization.dart).

```dart
import 'package:zodart/zodart.dart';

part 'localization.zodart.dart';
part 'localization.zodart.type.dart';

/// Schema defined using ZodArt (generates [Person] class)
@ZodArt.generateNewClass(outputClassName: 'Person')
abstract class PersonSchema {
  /// Validates that:
  /// - `firstName` is from 1 to 20 characters long
  /// - `lastName` is from 1 to 30 characters long
  /// - `age` is ≥ 0 (optional)
  static final schema = (
    firstName: ZString().min(1).max(20),
    lastName: ZString().min(1).max(30),
    age: ZInt().optional().min(0),
  );

  static const z = _PersonSchemaUtils();
  static final ZObject<Person> zObject = z.zObject;
}

void main() {
  final result = PersonSchema.zObject.parse({'firstName': '', 'lastName': 'Art', 'age': -1});

  // Prints an English error message summary (default)
  print(result.issueSummary);

  // Change localization to Czech (see other supported languages)
  ZLocalizationContext.current = ZIssueLocalizationService(Language.cs);

  // Prints error message summary in Czech
  print(result.issueSummary);

  // To get the individual localized message strings
  final messages = result.issueMessages;
  print(messages);

  // Each issue is represented by a `ZIssue` instance
  final zIssues = result.rawIssues;

  // Custom translation logic using pattern matching (Dart 3+)
  final customMessages =
      zIssues?.map((zIssue) {
        return switch (zIssue) {
          ZIssueMinNotMet(:final min, :final val) => 'My custom message: $val is lower than $min!',
          _ => 'My custom message: Other problem',
        };
      }) ??
      [];

  print('\nCustom messages:');
  print(customMessages);

  // To get error message summary only for the 'age' property
  print('\nMessage for the age field:');
  print(result.getSummaryFor(PersonSchema.z.props.age.name));
}
```

## Additional information

Explore the [example/](example/) folder — ready-to-use snippets you can copy into your project.
