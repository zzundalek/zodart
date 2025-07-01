// Example file
// ignore_for_file: specify_nonobvious_property_types, cascade_invocations, avoid_print

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
