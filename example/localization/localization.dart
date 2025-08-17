// Example file
// ignore_for_file: specify_nonobvious_property_types, avoid_print

import 'package:zodart/zodart.dart';

part 'localization.zodart.dart';
part 'localization.zodart.type.dart';

/// Schema defined using ZodArt (generates [Person] class)
@ZodArt.generateNewClass(outputClassName: 'Person')
abstract class PersonSchema {
  /// Validates that:
  /// - `firstName` is from 1 to 20 characters long
  /// - `lastName` is from 1 to 30 characters long
  /// - `age` is ≥ 0 (optional)
  static final schema = (
    firstName: ZString().min(1).max(20),
    lastName: ZString().min(1).max(30),
    age: ZInt().optional().min(0),
  );

  static const z = _PersonSchemaUtils();
  static final ZObject<Person> zObject = z.zObject;
}

void main() {
  final result = PersonSchema.zObject.parse({'firstName': '', 'lastName': 'Art', 'age': -1});

  // Prints an English error message summary (default)
  print(result.issueSummary);

  // Change localization to Czech (see other supported languages)
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
  print(result.getSummaryFor(PersonSchema.z.props.age.name));
}
