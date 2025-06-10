// ignore_for_file: avoid_print

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zodart/zodart.dart';

part 'zodart_simple_example.freezed.dart';
part 'zodart_simple_example.g.dart';

// Class generated with Freezed to represent the parsed result.
// Includes a fromJson method for integration with ZodArt.
// The method can be easily rewritten manually without Freezed if needed.
@freezed
abstract class Person with _$Person {
  const factory Person({
    required String firstName,
    required String lastName,
    required int? age,
    required bool? disabled,
  }) = _Person;

  const Person._();

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
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
  // Mapper required to create a `Person` instance (you can use Freezed `fromJson` here)
  fromJson: Person.fromJson,
);

void main() {
  final res = personSchema.parse({'firstName': 'Zod', 'lastName': 'Art', 'disabled': null});

  print(res.isError); // false
  print(res.isSuccess); // true
  print(res.value); // Person(firstName: Zod, lastName: Art, age: null, disabled: null)
}
