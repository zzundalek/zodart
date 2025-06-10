import '../../base/base.dart';
import '../z_issue_localization.dart';

/// Provides issue localization messages in English.
class ZIssueLocalizationEn implements ZIssueLocalization {
  /// Creates a new English localization instance.
  const ZIssueLocalizationEn();
  @override
  String lengthNotMet(ZIssueLengthNotMet issue) =>
      'Expected length of ${issue.expectedLength}, but got ${issue.actualLength}.';

  @override
  String minLengthNotMet(ZIssueMinLengthNotMet issue) =>
      'Expected minimum length of ${issue.minLength}, but got ${issue.actualLength}.';

  @override
  String maxLengthExceeded(ZIssueMaxLengthExceeded issue) =>
      'Expected maximum length of ${issue.maxLength}, but got ${issue.actualLength}.';

  @override
  String minNotMet(ZIssueMinNotMet issue) => 'Expected a value ≥ ${issue.min}, but got ${issue.val}.';

  @override
  String maxExceeded(ZIssueMaxExceeded issue) => 'Expected a value ≤ ${issue.max}, but got ${issue.val}.';

  @override
  String parseFail(ZIssueParseFail issue) => "Failed to parse value '${issue.val}', from ${issue.from} to ${issue.to}.";

  @override
  String missingValue(ZIssueMissingValue issue) =>
      "Failed to parse value at '${issue.rawPath.pathStr}'. Value not found.";
}
