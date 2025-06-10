// ignore_for_file: avoid_print, sort_constructors_first

import 'package:zodart/zodart.dart';

/// Person class used in the example below
///
/// A class generated with the `freezed` package can also be used here
/// Automatic fromJson method generation is planned for a future release.
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
