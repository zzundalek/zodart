import '../../base/base.dart';
import '../z_issue_localization.dart';

/// Provides issue localization messages in Japanese.
class ZIssueLocalizationJa implements ZIssueLocalization {
  /// Creates a new Japanese localization instance.
  const ZIssueLocalizationJa();

  @override
  String lengthNotMet(ZIssueLengthNotMet issue) =>
      '期待される長さは「${issue.expectedLength}」ですが、入力された値の長さは「${issue.actualLength}」です。';

  @override
  String minLengthNotMet(ZIssueMinLengthNotMet issue) =>
      '最小の必要な長さは「${issue.minLength}」ですが、入力された値の長さは「${issue.actualLength}」に過ぎません。';

  @override
  String maxLengthExceeded(ZIssueMaxLengthExceeded issue) =>
      '最大許容長さは「${issue.maxLength}」ですが、入力された値の長さは「${issue.actualLength}」です。';

  @override
  String minNotMet(ZIssueMinNotMet issue) => '最小の必要な値は「${issue.min}」ですが、実際の値は「${issue.val}」です。';

  @override
  String maxExceeded(ZIssueMaxExceeded issue) => '最大許容値は「${issue.max}」ですが、実際の値は「${issue.val}」です。';

  @override
  String parseFail(ZIssueParseFail issue) => '値「${issue.val}」を「${issue.from}」型から「${issue.to}」型に変換できませんでした。';

  @override
  String missingValue(ZIssueMissingValue issue) => '「${issue.rawPath.pathStr}」の値が見つかりませんでした。';
}
