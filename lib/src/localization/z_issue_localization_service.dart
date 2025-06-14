import 'package:meta/meta.dart';

import '../base/base.dart';
import 'localization.dart';

/// Resolves [ZIssue] instances into user-friendly, localized messages.
class ZIssueLocalizationService {
  /// Creates a new service using the provided [Language].
  factory ZIssueLocalizationService(Language lang) {
    final localization = switch (lang) {
      Language.en => const ZIssueLocalizationEn(),
      Language.cs => const ZIssueLocalizationCs(),
      Language.ja => const ZIssueLocalizationJa(),
    };
    return ZIssueLocalizationService._(localization);
  }

  /// Creates a new service using the provided [ZIssueLocalization].
  ZIssueLocalizationService._(this._zIssueLocalization);

  final ZIssueLocalization _zIssueLocalization;

  /// Returns a localized message for the given [ZIssue].
  ///
  /// Uses the appropriate method from [_zIssueLocalization] based on the type of the issue.
  /// If the issue has an associated [ZIssue.path], it will be prefixed to the message.
  String getIssueText(ZIssue issue) {
    final messageText = switch (issue) {
      final ZIssueLengthNotMet issue => _zIssueLocalization.lengthNotMet(issue),
      final ZIssueMinLengthNotMet issue => _zIssueLocalization.minLengthNotMet(issue),
      final ZIssueMaxLengthExceeded issue => _zIssueLocalization.maxLengthExceeded(issue),
      final ZIssueMinNotMet issue => _zIssueLocalization.minNotMet(issue),
      final ZIssueMaxExceeded issue => _zIssueLocalization.maxExceeded(issue),
      final ZIssueParseFail issue => _zIssueLocalization.parseFail(issue),
      final ZIssueMissingValue issue => _zIssueLocalization.missingValue(issue),
      final ZIssueCustom issue => _zIssueLocalization.custom(issue),
    };

    /// Prepends the issue path (if available) to the message text.
    final path = issue.path;
    return path != null ? _withPath(messageText, path) : messageText;
  }

  /// Prepends the issue path to the message text.
  String _withPath(String messageText, String path) => '[$path] $messageText';
}

/// Creates a [ZIssueLocalizationService] instance with a custom [ZIssueLocalization].
///
/// This is intended for testing purposes only, to allow injection of
/// custom configuration in order to test the behavior.
///
/// This function is marked as `@visibleForTesting` and should not be used in
/// production code.
@visibleForTesting
ZIssueLocalizationService createZIssueLocalizationServiceForTesting(ZIssueLocalization issueLocalization) =>
    ZIssueLocalizationService._(issueLocalization);
