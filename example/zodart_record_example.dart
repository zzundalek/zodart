// Example file
// ignore_for_file: specify_nonobvious_property_types, cascade_invocations, avoid_print

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
