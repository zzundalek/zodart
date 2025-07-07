// Example file
// ignore_for_file: specify_nonobvious_property_types, cascade_invocations, avoid_print

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
