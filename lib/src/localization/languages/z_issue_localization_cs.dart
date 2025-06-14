import '../../base/base.dart';
import '../z_issue_localization.dart';

/// Provides issue localization messages in Czech.
class ZIssueLocalizationCs implements ZIssueLocalization {
  /// Creates a new Czech localization instance.
  const ZIssueLocalizationCs();

  @override
  String lengthNotMet(ZIssueLengthNotMet issue) =>
      'Očekávaná délka je ${issue.expectedLength}, ale zadaná hodnota má délku ${issue.actualLength}.';

  @override
  String minLengthNotMet(ZIssueMinLengthNotMet issue) =>
      'Minimální požadovaná délka je ${issue.minLength}, ale zadaná hodnota má délku pouze ${issue.actualLength}.';

  @override
  String maxLengthExceeded(ZIssueMaxLengthExceeded issue) =>
      'Maximální povolená délka je ${issue.maxLength}, ale zadaná hodnota má délku ${issue.actualLength}.';

  @override
  String minNotMet(ZIssueMinNotMet issue) =>
      'Minimální požadovaná hodnota je alespoň ${issue.min}, ale je pouze ${issue.val}.';

  @override
  String maxExceeded(ZIssueMaxExceeded issue) => 'Maximální povolená hodnota je ${issue.max}, ale je ${issue.val}.';

  @override
  String parseFail(ZIssueParseFail issue) =>
      "Hodnotu '${issue.val}' se nepodařilo převést z typu ${issue.from} na ${issue.to}.";

  @override
  String missingValue(ZIssueMissingValue issue) =>
      "Nepodařilo se převést hodnotu pro '${issue.rawPath.pathStr}'. Hodnota nebyla nalezena.";

  @override
  String custom(ZIssueCustom issue) => issue.message ?? 'Hodnota je neplatná.';
}
