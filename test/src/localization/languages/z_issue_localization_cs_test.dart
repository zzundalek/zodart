import 'package:test/test.dart';
import 'package:zodart/src/base/z_issue.dart';
import 'package:zodart/src/base/z_path.dart';
import 'package:zodart/src/localization/languages/z_issue_localization_cs.dart';

void main() {
  group('ZIssueLocalizationCs', () {
    const localization = ZIssueLocalizationCs();

    test('lengthNotMet returns correct message', () {
      const issue = ZIssueLengthNotMet(expectedLength: 5, actualLength: 3);
      final result = localization.lengthNotMet(issue);
      expect(result, 'Očekávaná délka je 5, ale zadaná hodnota má délku 3.');
    });

    test('minLengthNotMet returns correct message', () {
      const issue = ZIssueMinLengthNotMet(minLength: 8, actualLength: 4);
      final result = localization.minLengthNotMet(issue);
      expect(result, 'Minimální požadovaná délka je 8, ale zadaná hodnota má délku pouze 4.');
    });

    test('maxLengthExceeded returns correct message', () {
      const issue = ZIssueMaxLengthExceeded(maxLength: 10, actualLength: 15);
      final result = localization.maxLengthExceeded(issue);
      expect(result, 'Maximální povolená délka je 10, ale zadaná hodnota má délku 15.');
    });

    test('minNotMet returns correct message', () {
      const issue = ZIssueMinNotMet(min: 100, val: 80);
      final result = localization.minNotMet(issue);
      expect(result, 'Minimální požadovaná hodnota je alespoň 100, ale je pouze 80.');
    });

    test('maxExceeded returns correct message', () {
      const issue = ZIssueMaxExceeded(max: 50, val: 75);
      final result = localization.maxExceeded(issue);
      expect(result, 'Maximální povolená hodnota je 50, ale je 75.');
    });

    test('parseFail returns correct message', () {
      const issue = ZIssueParseFail(
        from: String,
        to: int,
        val: 'abc123',
      );
      final result = localization.parseFail(issue);
      expect(result, "Hodnotu 'abc123' se nepodařilo převést z typu String na int.");
    });

    test('missingValue returns correct message', () {
      final issue = ZIssueMissingValue(rawPath: ZPath.property('name'));
      final result = localization.missingValue(issue);
      expect(result, "Nepodařilo se převést hodnotu pro 'name'. Hodnota nebyla nalezena.");
    });

    test('minDateTimeNotMet returns correct message', () {
      final issue = ZIssueMinDateTimeNotMet(
        min: DateTime.utc(2000, 1, 1, 10, 09),
        val: DateTime.utc(1999, 12, 31, 10, 1),
      );
      final result = localization.minDateTimeNotMet(issue);
      expect(result, "Datum musí být nejdřive '${issue.min.toLocal()}', ale je '${issue.val.toLocal()}'.");
    });

    test('maxDateTimeExceeded returns correct message', () {
      final issue = ZIssueMaxDateTimeExceeded(
        max: DateTime.utc(1999, 12, 31, 10, 1),
        val: DateTime.utc(2000, 1, 1, 10, 09),
      );
      final result = localization.maxDateTimeExceeded(issue);
      expect(result, "Datum musí být nejpozději '${issue.max.toLocal()}', ale je '${issue.val.toLocal()}'.");
    });

    group('custom returns correct message', () {
      test('custom returns the message if set in the issue', () {
        expect(
          localization.custom(const ZIssueCustom(message: 'Miluju ZodArt!')),
          'Miluju ZodArt!',
        );
      });
      test('custom returns default message if not set in the issue', () {
        expect(
          localization.custom(const ZIssueCustom()),
          'Hodnota je neplatná.',
        );
      });
    });
  });
}
