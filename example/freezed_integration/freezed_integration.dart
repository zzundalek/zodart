// Example file
// ignore_for_file: avoid_print, specify_nonobvious_property_types

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zodart/zodart.dart';

part 'freezed_integration.freezed.dart';
part 'freezed_integration.zodart.dart';

// Class generated with Freezed to represent the parsed result.
@freezed
abstract class Person with _$Person {
  const factory Person({
    required String firstName,
    required String lastName,
    required int? age,
    required bool? disabled,
  }) = _Person;
}

/// Schema defined using ZodArt (uses freezed class [Person])
@ZodArt.withExistingClass(outputClassType: Person)
abstract class PersonSchema {
  /// Validates that:
  /// - `firstName` is from 1 to 20 characters long
  /// - `lastName` is from 1 to 30 characters long
  /// - `age` is greater or equal to 0 (can be omitted)
  /// - `disabled` is present, but can be null
  static final schema = (
    firstName: ZString().min(1).max(20),
    lastName: ZString().min(1).max(30),
    age: ZInt().optional().min(0),
    disabled: ZBool().nullable(),
  );
  static const z = _PersonSchemaUtils();
  static final ZObject<Person> zObject = z.zObject;
}

void main() {
  final res = PersonSchema.zObject.parse({'firstName': 'Zod', 'lastName': 'Art', 'disabled': null});

  print(res.isError); // false
  print(res.isSuccess); // true
  print(res.value); // Person(firstName: Zod, lastName: Art, age: null, disabled: null)
}
