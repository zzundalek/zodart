// Example file
// ignore_for_file: specify_nonobvious_property_types, cascade_invocations, avoid_print

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
