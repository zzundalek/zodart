import 'package:test/test.dart';
import 'package:zodart/src/base/z_issue.dart';
import 'package:zodart/src/base/z_path.dart';
import 'package:zodart/src/localization/languages/z_issue_localization_ja.dart';

void main() {
  group('ZIssueLocalizationJa', () {
    const localization = ZIssueLocalizationJa();

    test('lengthNotMet returns correct message', () {
      const issue = ZIssueLengthNotMet(expectedLength: 5, actualLength: 3);
      final result = localization.lengthNotMet(issue);
      expect(result, '期待される長さは「5」ですが、入力された値の長さは「3」です。');
    });

    test('minLengthNotMet returns correct message', () {
      const issue = ZIssueMinLengthNotMet(minLength: 8, actualLength: 4);
      final result = localization.minLengthNotMet(issue);
      expect(result, '最小の必要な長さは「8」ですが、入力された値の長さは「4」に過ぎません。');
    });

    test('maxLengthExceeded returns correct message', () {
      const issue = ZIssueMaxLengthExceeded(maxLength: 10, actualLength: 15);
      final result = localization.maxLengthExceeded(issue);
      expect(result, '最大許容長さは「10」ですが、入力された値の長さは「15」です。');
    });

    test('minNotMet returns correct message', () {
      const issue = ZIssueMinNotMet(min: 100, val: 80);
      final result = localization.minNotMet(issue);
      expect(result, '最小の必要な値は「100」ですが、実際の値は「80」です。');
    });

    test('maxExceeded returns correct message', () {
      const issue = ZIssueMaxExceeded(max: 50, val: 75);
      final result = localization.maxExceeded(issue);
      expect(result, '最大許容値は「50」ですが、実際の値は「75」です。');
    });

    test('parseFail returns correct message', () {
      const issue = ZIssueParseFail(
        from: String,
        to: int,
        val: 'abc123',
      );
      final result = localization.parseFail(issue);
      expect(result, '値「abc123」を「String」型から「int」型に変換できませんでした。');
    });

    test('missingValue returns correct message', () {
      final issue = ZIssueMissingValue(rawPath: ZPath.property('name'));
      final result = localization.missingValue(issue);
      expect(result, '「name」の値が見つかりませんでした。');
    });

    test('minDateTimeNotMet returns correct message', () {
      final issue = ZIssueMinDateTimeNotMet(
        min: DateTime.utc(2000, 1, 1, 10, 09),
        val: DateTime.utc(1999, 12, 31, 10, 1),
      );
      final result = localization.minDateTimeNotMet(issue);
      expect(result, '日付は「${issue.min.toLocal()}」以降である必要がありますが、「${issue.val.toLocal()}」が指定されました。');
    });

    test('maxDateTimeExceeded returns correct message', () {
      final issue = ZIssueMaxDateTimeExceeded(
        max: DateTime.utc(1999, 12, 31, 10, 1),
        val: DateTime.utc(2000, 1, 1, 10, 09),
      );
      final result = localization.maxDateTimeExceeded(issue);
      expect(result, '日付は「${issue.max.toLocal()}」以前である必要がありますが、「${issue.val.toLocal()}」が指定されました。');
    });

    group('custom returns correct message', () {
      test('custom returns the message if set in the issue', () {
        expect(
          localization.custom(const ZIssueCustom(message: 'ZodArtが好きです!')),
          'ZodArtが好きです!',
        );
      });
      test('custom returns default message if not set in the issue', () {
        expect(
          localization.custom(const ZIssueCustom()),
          '値が無効です。',
        );
      });
    });
  });
}
