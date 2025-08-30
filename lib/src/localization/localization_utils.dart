import '../base/base.dart';
import 'localization.dart';

/// Returns the localized text message for the [ZIssue].
///
/// Uses the [ZIssueLocalizationService] passed in [service] or [ZLocalizationContext.current] to resolve
/// a human-readable message describing the issue.
///
/// Includes the field path if [includePath] is set to true.
String localizeIssue(ZIssue issue, {required bool includePath, ZIssueLocalizationService? service}) {
  return (service ?? ZLocalizationContext.current).getIssueText(issue, includePath: includePath);
}

/// Extension on [ZIssues] (list of [ZIssue]) to provide localized messages easily.
extension ZIssuesLocalizationExt on ZIssues {
  /// Returns a list of localized messages for all issues in this [ZIssues].
  List<String> get localizedMessages => getLocalizedMessages(includePath: true);

  /// Returns a list of localized messages for all issues in this [ZIssues].
  ///
  /// Includes the field path if [includePath] is set to true.
  List<String> getLocalizedMessages({required bool includePath}) =>
      map((issue) => localizeIssue(issue, includePath: includePath)).toList();

  /// Returns all localized messages joined into a single string separated by newlines.
  String get localizedSummary => getLocalizedSummary(includePath: true);

  /// Returns all localized messages joined into a single string separated by newlines.
  ///
  /// Includes the field path if [includePath] is set to true.
  String getLocalizedSummary({required bool includePath}) => getLocalizedMessages(includePath: includePath).join('\n');
}
