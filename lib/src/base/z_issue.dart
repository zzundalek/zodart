import 'package:freezed_annotation/freezed_annotation.dart';

import 'z_path.dart';

part 'z_issue.freezed.dart';

/// Concrete issue that occurred during parsing, validation, or transformation.
///
/// This is a sealed class that defines various kinds of structured issues.
@freezed
sealed class ZIssue with _$ZIssue {
  const ZIssue._();

  /// Issue indicating that a value's length does not match the expected length exactly.
  const factory ZIssue.lengthNotMet({
    required int expectedLength,
    required int actualLength,
    @Default(ZPath([])) ZPath rawPath,
  }) = ZIssueLengthNotMet;

  /// Issue indicating that a value's length is shorter than the minimum required length.
  const factory ZIssue.minLengthNotMet({
    required int minLength,
    required int actualLength,
    @Default(ZPath([])) ZPath rawPath,
  }) = ZIssueMinLengthNotMet;

  /// Issue indicating that a value's length exceeds the maximum allowed length.
  const factory ZIssue.maxLengthExceeded({
    required int maxLength,
    required int actualLength,
    @Default(ZPath([])) ZPath rawPath,
  }) = ZIssueMaxLengthExceeded;

  /// Issue indicating that a numeric value is less than the minimum allowed.
  const factory ZIssue.minNotMet({
    required num min,
    required num val,
    @Default(ZPath([])) ZPath rawPath,
  }) = ZIssueMinNotMet;

  /// Issue indicating that a numeric value exceeds the maximum allowed.
  const factory ZIssue.maxExceeded({
    required num max,
    required num val,
    @Default(ZPath([])) ZPath rawPath,
  }) = ZIssueMaxExceeded;

  /// Issue indicating a failure to parse a value from one type to another.
  const factory ZIssue.parseFail({
    required Type from,
    required Type to,
    required dynamic val,
    Object? throwable,
    @Default(ZPath([])) ZPath rawPath,
  }) = ZIssueParseFail;

  /// Issue indicating a missing value during parsing.
  const factory ZIssue.missingValue({
    required ZPath rawPath,
    Object? throwable,
  }) = ZIssueMissingValue;

  /// Returns path in String format. If the path is empty returns null.
  String? get path => rawPath.pathStr;
}
