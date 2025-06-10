import '../base/base.dart';
import 'localization.dart';

/// Returns the localized text message for the [ZIssue].
///
/// Uses the [ZIssueLocalizationService] passed in [service] or [ZLocalizationContext.current] to resolve
/// a human-readable message describing the issue.
String localizeIssue(ZIssue issue, {ZIssueLocalizationService? service}) {
  return (service ?? ZLocalizationContext.current).getIssueText(issue);
}

/// Extension on [ZIssues] (list of [ZIssue]) to provide localized messages easily.
extension ZIssuesLocalizationExt on ZIssues {
  /// Returns a list of localized messages for all issues in this [ZIssues].
  List<String> get localizedMessages => map(localizeIssue).toList();

  /// Returns all localized messages joined into a single string separated by newlines.
  String get localizedSummary => localizedMessages.join('\n');
}
