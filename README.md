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
| next    | ![GitHub next milestone details](https://img.shields.io/github/milestones/progress-percent/zzundalek/zodart/2?logo=rocket) ![GitHub last commit](https://img.shields.io/github/last-commit/zzundalek/zodart)                                                                                 |

## Simple example

You can check the planned features and report bugs or feature requests by opening an issue on the [GitHub page](https://github.com/zzundalek/zodart/issues).

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
- [Validation & refine](#validation--refine)
- [Nullable & optional values](#nullable--optional-values)
- [Localization & Custom Errors](#localization--custom-errors)
- [Additional information](#additional-information)

## Features

- Define schemas for both primitive and complex types
- Parse unknown or unstructured data into strongly typed Dart values
- Seamless integration with `freezed` models
- **Composable and reusable** schemas for easy code sharing and modularity
- Supports nested objects, arrays, optional and nullable fields
- Built-in various validation rules (e.g. `.min()`, `.max()`, etc.)
- Support for user-defined custom rules via `.refine()`
- Rich, localizable, developer-friendly error messages
- Designed for use with REST APIs, GraphQL, JSON files, and form input

## Basic usage

### Example without using freezed

For using ZodArt with `freezed`, please refer to [example/](example/) folder.

```dart
import 'package:zodart/zodart.dart';

/// Person class used in the example below
///
/// Automatic fromJson method generation is planned for a future release.
/// A class generated with the `freezed` package can also be used here
class Person {
  final String firstName;
  final String lastName;
  final int? age;
  final bool? disabled;

  Person({
    required this.firstName,
    required this.lastName,
    this.age,
    this.disabled,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      age: json['age'] as int?,
      disabled: json['disabled'] as bool?,
    );
  }

  @override
  String toString() {
    return 'Person(firstName: $firstName, lastName: $lastName, age: $age, disabled: $disabled)';
  }
}

/// Schema defined using ZodArt
///
/// Validates that:
/// - `firstName` is from 1 to 20 characters long
/// - `lastName` is from 1 to 30 characters long
/// - `age` is greater or equal to 0 (can be omitted)
/// - `disabled` is present, but can be null
final personSchema = ZObject.withMapper(
  {
    'firstName': ZString().min(1).max(20),
    'lastName': ZString().min(1).max(30),
    'age': ZInt().optional().min(0),
    'disabled': ZBool().nullable(),
  },
  // Mapper required to create the `Person` instance (you can use Freezed `fromJson` here)
  fromJson: Person.fromJson,
);

void main() {
  final res = personSchema.parse({'firstName': 'Zod', 'lastName': 'Art', 'disabled': null});

  print(res.isError); // false
  print(res.isSuccess); // true
  print(res.value); // Person(firstName: Zod, lastName: Art, age: null, disabled: null)
}
```

### Reusing and composing schemas

Define simple schemas and compose them into complex ones:

```dart
/// The String cannot be empty and is trimmed after the parse
final minSchema = ZString().trim().min(1);

/// Extends the [minSchema] and adds rule that the String must be max 10 characters long
final minMaxSchema = minSchema.max(10);

/// Extends the [minMaxSchema] and adds rule that the String can be `null`
final minMaxNullableSchema = minMaxSchema.nullable();

/// Extends the [minMaxNullableSchema] and conversion from String to Int in the end
final composedNullableIntSchema = minMaxNullableSchema.toInt();

/// Object schema composed from previously defined schemas, returns a Dart Record (String, int)
final objSchema = ZObject<(String, int)>.withMapper(
  {
    'str': minSchema,
    'int': composedNullableIntSchema,
  },
  fromJson: (map) => (map['str'], map['int']),
);

void main() {
  // Returns: true (empty string after trim, violates min(1) rule)
  minSchema.parse('     ').isError

  // Returns: 'ZodArt'
  minSchema.parse(' ZodArt  ').value

  // Returns: 'ZodArt'
  minMaxSchema.parse(' ZodArt ').value

  // Returns: true
  minMaxNullableSchema.parse(null).isSuccess

  // Returns: 105
  composedNullableIntSchema.parse(' 105  ').value

  // Returns: true
  composedNullableIntSchema.parse(null).isSuccess

  // Returns error message: Failed to parse value 'ZodArt', from String to int.
  composedNullableIntSchema.parse('ZodArt').issueSummary

  // Returns: ('ZodArt', 100)
  objSchema.parse({'str': 'ZodArt', 'int': ' 100 '}).value
}
```

## Validation & refine

> ⚠️ Important: Do not throw exceptions inside a `.refine()` function — ZodArt will not catch them.

Use the `.refine()` method to add custom validation logic to any schema. This function should return `true` if the value is valid, or `false` otherwise.
When `.refine()` returns `false`, ZodArt creates a `ZIssueCustom` issue.
You can optionally provide a `message` or `code` to include in the issue.

```dart
import 'package:zodart/zodart.dart';

/// The Person record type
typedef Person = ({String firstName, String lastName, int validFrom, int? validTo});

/// Schema defined using ZodArt
///
/// Validates that:
/// - `firstName` is from 1 to 20 characters long
/// - `lastName` is from 1 to 30 characters long
/// - `validFrom` is a timestamp in seconds
/// - `validTo` is an optional timestamp in seconds
final personSchema = ZObject<Person>.withMapper(
  {
    'firstName': ZString().min(1).max(20),
    'lastName': ZString().min(1).max(30),
    'validFrom': ZInt(),
    'validTo': ZInt().optional(),
  },

  // Mapper used to construct the `Person` record from the parsed map
  fromJson: (json) => (
    firstName: json['firstName'],
    lastName: json['lastName'],
    validFrom: json['validFrom'],
    validTo: json['validTo'],
  ),
);

void main() {
  // Refine the `personSchema` to ensure that `validFrom` ≤ `validTo`
  final refinedPersonSchema = personSchema.refine(
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

## Nullable & optional values

In Dart, unlike JavaScript, there is no concept of `undefined` value. However, when parsing `ZObject` from `Map<String, dynamic>`, a missing key (`!map.containsKey('key')`) is the Dart equivalent of `undefined`. To explicitly allow missing keys, ZodArt provides the `.optional()` modifier.

For all other schemas like `ZString`, `ZInt`, etc., there is no concept of a "missing" value outside a `ZObject`. In this context, the `.optional()` modifier has no semantic effect and is treated as **equivalent** to `.nullable()`.

See more at [nullable modifier doc](doc/modifiers/nullability.md).

## Localization & Custom Errors

- Default language is set to English, to change it use `ZLocalizationContext.current`
- ZodArt contains various helpers for error handling, see documentation for more info!

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
  final result = personSchema.parse({'firstName': '', 'lastName': 'Art', 'age': -1});

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
