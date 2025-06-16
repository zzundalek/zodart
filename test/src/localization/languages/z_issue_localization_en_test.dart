import 'package:test/test.dart';
import 'package:zodart/src/base/z_issue.dart';
import 'package:zodart/src/base/z_path.dart';
import 'package:zodart/src/localization/languages/z_issue_localization_en.dart';

void main() {
  group('ZIssueLocalizationEn', () {
    const localization = ZIssueLocalizationEn();

    test('lengthNotMet returns correct message', () {
      const issue = ZIssueLengthNotMet(expectedLength: 5, actualLength: 3);
      final result = localization.lengthNotMet(issue);
      expect(result, 'Expected length of 5, but got 3.');
    });

    test('minLengthNotMet returns correct message', () {
      const issue = ZIssueMinLengthNotMet(minLength: 8, actualLength: 4);
      final result = localization.minLengthNotMet(issue);
      expect(result, 'Expected minimum length of 8, but got 4.');
    });

    test('maxLengthExceeded returns correct message', () {
      const issue = ZIssueMaxLengthExceeded(maxLength: 10, actualLength: 15);
      final result = localization.maxLengthExceeded(issue);
      expect(result, 'Expected maximum length of 10, but got 15.');
    });

    test('minNotMet returns correct message', () {
      const issue = ZIssueMinNotMet(min: 100, val: 80);
      final result = localization.minNotMet(issue);
      expect(result, 'Expected a value ≥ 100, but got 80.');
    });

    test('maxExceeded returns correct message', () {
      const issue = ZIssueMaxExceeded(max: 50, val: 75);
      final result = localization.maxExceeded(issue);
      expect(result, 'Expected a value ≤ 50, but got 75.');
    });

    test('parseFail returns correct message', () {
      const issue = ZIssueParseFail(
        from: String,
        to: int,
        val: 'abc123',
      );
      final result = localization.parseFail(issue);
      expect(result, "Failed to parse value 'abc123', from String to int.");
    });

    test('missingValue returns correct message', () {
      final issue = ZIssueMissingValue(rawPath: ZPath.property('name'));
      final result = localization.missingValue(issue);
      expect(result, "Failed to parse value at 'name'. Value not found.");
    });

    group('custom returns correct message', () {
      test('custom returns the message if set in the issue', () {
        expect(
          localization.custom(const ZIssueCustom(message: 'I love ZodArt!')),
          'I love ZodArt!',
        );
      });
      test('custom returns default message if not set in the issue', () {
        expect(
          localization.custom(const ZIssueCustom()),
          'The value is invalid.',
        );
      });
    });
  });
}
