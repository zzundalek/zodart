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
| next    | ![GitHub next milestone details](https://img.shields.io/github/milestones/progress-percent/zzundalek/zodart/3?logo=rocket) ![GitHub last commit](https://img.shields.io/github/last-commit/zzundalek/zodart)                                                                                 |

## Simple example without code generation

Even though ZodArt works perfectly without code generation, using it is **highly recommended** — it brings rock-solid type safety 🧬 and greatly improves DX 🚀.  
See [Simple example with code generation](#simple-example-with-code-generation) to get started!

```dart
import 'package:zodart/zodart.dart';

/// The Person record type
typedef Person = ({String firstName, String lastName, int? age});

/// Schema defined using ZodArt
///
/// Validates that:
/// - `firstName` is from 1 to 20 characters long
/// - `lastName` is from 1 to 30 characters long
/// - `age` is ≥ 0 (optional)
final personSchema = ZObject<Person>.withMapper(
  {
    'firstName': ZString().min(1).max(20),
    'lastName': ZString().min(1).max(30),
    'age': ZInt().optional().min(0),
  },

  // Mapper used to construct the `Person` record from the parsed map
  fromJson: (json) => (
    firstName: json['firstName'],
    lastName: json['lastName'],
    age: json['age'],
  ),
);

void main() {
  // Parse raw input (e.g. from an API, user form, etc.)
  // ZodArt infers the type of `result.value` as `Person`
  final result = personSchema.parse({'firstName': 'Zod', 'lastName': 'Art'});

  // Option 1: Check success and access value
  if (result.isSuccess) {
    print(result.value); // (firstName: Zod, lastName: Art, age: null)
  } else {
    print(result.issueSummary); // Optional fallback
  }

  // Option 2: Use functional match to handle both cases
  result.match(
    (issues) => print('There was a problem: ${issues.localizedSummary}'),
    (val) => print('Parsed person: $val'),
  );
}
```

## Table of Contents

- [Features](#features)
- [Basic Usage](#basic-usage)
- [Parsing values](#parsing-values)
- [Nullable & optional values](#nullable--optional-values)
- [Validation & refine](#validation--refine)
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

   // <your_file_name.zodart.dart> so for 'code_gen_example.dart' add:
   part 'code_gen_example.zodart.dart';

   /// your code using `@zodart` annotation follows
   ```

1. Run `build_runner` to generate the ZodArt helpers classes

   ```bash
   dart run build_runner build
   ```

See more about code generation at [build_runner package](https://pub.dev/packages/build_runner).

### Simple example with code generation

This is the same as the [manual example](#simple-example-without-code-generation), rewritten using code generation. See [full example](example/code_gen/simple_example/code_gen_example.dart).

- ✅ Automatically generates a **type-safe `ZObject` mapper** — no more magic strings!
- ✅ Exposes type-safe property access to simplify field-specific issue handling

To instantiate a custom class (instead of a Record), use the `withMapper` method provided in the generated utility class. See [class example](example/code_gen/class_example/code_gen_class_example.dart) for more detail.

```dart
import 'package:zodart/zodart.dart';

// Make the generated code to be a part of this file
// You must change it to the name of `your_file_name.zodart.dart`
part 'code_gen_example.zodart.dart';

/// The Person record type used to store the result value
typedef Person = ({String firstName, String lastName, int? age});

/// Schema defined using ZodArt and autogenerated with [zodart] annotation
///
/// Generates helper class [_$ZPersonSchemaUtils]
///
/// Validates that:
/// - `firstName` is from 1 to 20 characters long
/// - `lastName` is from 1 to 30 characters long
/// - `age` is ≥ 0 (optional)
@zodart
abstract class PersonSchema {
  /// Define the schema using Dart record.
  static final schema = (
    firstName: ZString().min(1).max(20),
    lastName: ZString().min(1).max(30),
    age: ZInt().optional().min(0),
  );

  /// Access to the generated helper class, which contains:
  ///
  /// - The `ZObject` instance for parsing/validating the schema.
  /// - A `withMapper` function for mapping parsed record to custom objects.
  /// - A `shape` descriptor containing field mappings and runtime type info.
  /// - Enum-style access to the schema properties.
  static const z = _$ZPersonSchemaUtils();

  /// Use the autogenerated [ZObject] with default mapper to [Person].
  static ZObject<Person> get zObject => z.zObject;
}

void main() {
  // Parse raw input (e.g. from an API, user form, etc.)
  // ZodArt infers the type of `result.value` as `Person`
  final result = PersonSchema.zObject.parse({'firstName': 'Zod', 'lastName': 'Art'});

  // Option 1: Check success and access value
  if (result.isSuccess) {
    print(result.value); // (firstName: Zod, lastName: Art, age: null)
  } else {
    print(result.issueSummary); // Optional fallback
  }

  // Option 2: Use functional match to handle both cases
  result.match(
    (issues) => print('There was a problem: ${issues.localizedSummary}'),
    (val) => print('Parsed person: $val'),
  );

  print(result.getRawIssuesFor(PersonSchema.z.props.firstName.name)?.localizedSummary);
}
```

### Reusing and composing schemas

Define simple schemas and compose them into complex ones. See [full example](example/code_gen/compose_example/compose_example.dart).

```dart
import 'package:zodart/zodart.dart';

part 'zodart_compose_example.zodart.dart';

/// The String cannot be empty and is trimmed after the parse
final minSchema = ZString().trim().min(1);

/// Extends the [minSchema] and adds rule that the String must be max 10 characters long
final minMaxSchema = minSchema.max(10);

/// Extends the [minMaxSchema] and adds rule that the String can be `null`
final minMaxNullableSchema = minMaxSchema.nullable();

/// Extends the [minMaxNullableSchema] and conversion from String to Int in the end
final composedNullableIntSchema = minMaxNullableSchema.toInt();

/// Object schema composed from previously defined schemas, returns a Dart Record ({String str, int? intVal})
@zodart
abstract class ObjectSchema {
  static final schema = (
    str: minSchema,
    intVal: composedNullableIntSchema,
  );

  static const z = _$ZObjectSchemaUtils();

  static ZObject<({String str, int? intVal})> get zObj => z.zObject;
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

  // Returns: (intVal: 100, str: 'ZodArt')
  ObjectSchema.zObj.parse({'intVal': ' 100 ', 'str': 'ZodArt'}).value;
}
```

## Parsing values

By default, ZodArt parsers operate in **strict mode**. This means they will only accept input values that **match the expected type exactly**. Any type mismatch will result in a **ParseError**.
The only exception is **ZObject**, which strictly accepts only `Map<String, dynamic>` as input. See more [parsers here](doc/parsers/parsers.md).

## Nullable & optional values

In Dart, unlike JavaScript, there is no concept of `undefined` value. However, when parsing `ZObject` from `Map<String, dynamic>`, a missing key (`!map.containsKey('key')`) is the Dart equivalent of `undefined`. To explicitly allow missing keys, ZodArt provides the `.optional()` modifier.

For all other schemas like `ZString`, `ZInt`, etc., there is no concept of a "missing" value outside a `ZObject`. In this context, the `.optional()` modifier has no semantic effect and is treated as **equivalent** to `.nullable()`.

See more at [nullable modifier doc](doc/modifiers/nullability.md).

## Validation & refine

> ⚠️ Important: Do not throw exceptions inside a `.refine()` function — ZodArt will not catch them.

Use the `.refine()` method to add custom validation logic to any schema. This function should return `true` if the value is valid, or `false` otherwise.
When `.refine()` returns `false`, ZodArt creates a `ZIssueCustom` issue.
You can optionally provide a `message` or `code` to include in the issue.

See [full example](example/code_gen/refine_example/refine_example.dart).

> ℹ️ To return multiple issues or apply advanced validations use the `.superRefine()` [method](/example/zodart_super_refine_example.dart).

```dart
import 'package:zodart/zodart.dart';

part 'refine_example.zodart.dart';

/// The Person record type
typedef Person = ({String firstName, String lastName, DateTime validFrom, DateTime? validTo});

/// Schema defined using ZodArt
///
/// Validates that:
/// - `firstName` is from 1 to 20 characters long
/// - `lastName` is from 1 to 30 characters long
/// - `validFrom` is a DateTime
/// - `validTo` is an optional DateTime
@zodart
abstract class PersonSchema {
  static final schema = (
    firstName: ZString().min(1).max(20),
    lastName: ZString().min(1).max(30),
    validFrom: ZDateTime(),
    validTo: ZDateTime().optional(),
  );

  static const z = _$ZPersonSchemaUtils();

  // Refine the `schema` to ensure that `validFrom` ≤ `validTo` or `validTo` is `null`
  static ZObject<Person> get zObj => z.zObject.refine(
    (person) {
      final validTo = person.validTo;
      return validTo == null || person.validFrom.isBefore(validTo);
    },
    message: 'validFrom must be earlier than validTo.',
  );
}

void main() {
  // Parse raw input (e.g. from an API, user form, etc.)
  // ZodArt infers the type of `result.value` as `Person`
  final result = PersonSchema.zObj.parse({
    'firstName': 'Zod',
    'lastName': 'Art',
    'validFrom': DateTime(1900, 1, 1, 10, 01),
    'validTo': DateTime(1900, 1, 1, 09, 01),
  });

  // Prints the custom error message 'validFrom must be earlier than validTo.'
  print(result.issueSummary);
}
```

## Localization & Custom Errors

- Default language is set to English, to change it use `ZLocalizationContext.current`
- ZodArt contains various helpers for error handling, see documentation for more info!

See [full example](example/code_gen/localization_example/localization_example.dart).

```dart
import 'package:zodart/zodart.dart';

part 'localization_example.zodart.dart';

/// The Person record type
typedef Person = ({String firstName, String lastName, int? age});

/// Schema defined using ZodArt
///
/// Validates that:
/// - `firstName` is from 1 to 20 characters long
/// - `lastName` is from 1 to 30 characters long
/// - `age` is ≥ 0 (optional)
@zodart
abstract class PersonSchema {
  static final schema = (
    firstName: ZString().min(1).max(20),
    lastName: ZString().min(1).max(30),
    age: ZInt().optional().min(0),
  );

  static const z = _$ZPersonSchemaUtils();

  static ZObject<Person> get zObj => z.zObject;
}

void main() {
  final result = PersonSchema.zObj.parse({'firstName': '', 'lastName': 'Art', 'age': -1});

  // Prints an English error message summary (default)
  print(result.issueSummary);

  // Change localization to Czech (or any supported language)
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
  print(result.getSummaryFor('age'));
}
```

## Additional information

Explore the [example/](example/) folder — ready-to-use snippets you can copy into your project.
