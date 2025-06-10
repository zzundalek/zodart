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
  });
}
