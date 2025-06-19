import '../base/base.dart';

/// Provides localized text messages for different types of [ZIssue]s.
///
/// Implementations of this class should return user-friendly, localized
/// error messages for various validation issues.
abstract class ZIssueLocalization {
  /// Returns a localized message indicating that the value does not meet the exact expected length.
  String lengthNotMet(ZIssueLengthNotMet issue);

  /// Returns a localized message indicating that the value is shorter than the minimum required length.
  String minLengthNotMet(ZIssueMinLengthNotMet issue);

  /// Returns a localized message indicating that the value exceeds the maximum allowed length.
  String maxLengthExceeded(ZIssueMaxLengthExceeded issue);

  /// Returns a localized message indicating that the numeric value is below the minimum threshold.
  String minNotMet(ZIssueMinNotMet issue);

  /// Returns a localized message indicating that the numeric value exceeds the maximum threshold.
  String maxExceeded(ZIssueMaxExceeded issue);

  /// Returns a localized message indicating that the value could not be parsed or converted.
  String parseFail(ZIssueParseFail issue);

  /// Returns a localized message indicating that a value was missing during parsing.
  String missingValue(ZIssueMissingValue issue);

  /// Returns a localized message indicating that the date time value is below the minimum threshold.
  String minDateTimeNotMet(ZIssueMinDateTimeNotMet issue);

  /// Returns a localized message indicating that the date time value exceeds the maximum threshold.
  String maxDateTimeExceeded(ZIssueMaxDateTimeExceeded issue);

  /// Returns a localized message for a custom issue.
  String custom(ZIssueCustom issue);
}
