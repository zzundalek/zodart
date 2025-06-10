Type-safe schema validation with **static type inference** and a parse-first design for Dart and Flutter.

Parse unstructured data from APIs, Flutter forms, config files, and more — with type safety and static type inference.

Inspired by [Zod](https://zod.dev/), ZodArt provides a powerful, expressive API to define validation schemas and parse unknown data into strongly typed Dart values.

## Features

- Define schemas for primitive and complex types
- Parse unknown/unstructured data into strongly typed Dart values
- Easy to integrate with `freezed` models
- **Composable and reusable** schemas — easily reuse schemas across your app
- Supports nested objects, arrays, optional/nullable fields
- Built-in validation rules
- Rich, localizable error messages
- Works great with REST APIs, GraphQL, JSON files, user input

## Usage

Try ZodArt **right now** in [DartPad (TODO)](https://dartpad.dev)!

<!-- TODO add the link to the dartpad -->

### Simple example without freezed

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

Define smaller schemas and compose them into complex ones:

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
  print(minSchema.parse('     ').isError);

  // Returns: 'ZodArt'
  print(minSchema.parse(' ZodArt  ').value);

  // Returns: 'ZodArt'
  print(minMaxSchema.parse(' ZodArt ').value);

  // Returns: true
  print(minMaxNullableSchema.parse(null).isSuccess);

  // Returns: 105
  print(composedNullableIntSchema.parse(' 105  ').value);

  // Returns: true
  print(composedNullableIntSchema.parse(null).isSuccess);

  // Returns error message: Failed to parse value 'ZodArt', from String to int.
  print(composedNullableIntSchema.parse('ZodArt').issueSummary);

  // Returns: ('ZodArt', 100)
  print(objSchema.parse({'str': 'ZodArt', 'int': ' 100 '}).value);
}
```

Explore the [example/](example/) folder — ready-to-use snippets you can copy into your project.

## Additional information

**This package is under active development.** 🚀

You can check the planned features and report bugs or feature requests by opening an issue on the [GitHub page](https://github.com/zzundalek/zodart).
