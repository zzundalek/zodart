import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../localization/localization.dart';
import '../utils/utils.dart';
import 'base.dart';

part 'z_res.freezed.dart';

/// A sealed class representing the result of a [ZRes] operation.
///
/// The result can be either a [ZValue] (success) or a [ZError] (error).
/// Use Dart pattern matching (`switch` or `if case`) to extract the value or error.
@freezed
sealed class ZResult<T> with _$ZResult<T> {
  const ZResult._();

  /// Represents a successful [ZRes] result.
  ///
  /// Contains the resolved value [val] of type [T].
  const factory ZResult.value(T val) = ZValue<T>;

  /// Represents a failed [ZRes] result.
  ///
  /// Contains an unmodifiable list of issues.
  const factory ZResult.error(ZIssues rawIssues) = ZError<T>;
}

/// A standard result type used across parsing, validation and transformation.
///
/// Contains either a list of [ZIssue]s or a successful value of type [T].
class ZRes<T> {
  /// Creates a successful [ZRes] wrapping the value [val].
  ///
  /// Example:
  /// ```dart
  /// final success = ZRes.success(42);
  /// print(success.value); // 42
  /// ```
  factory ZRes.success(T val) => ZRes._(Either<ZIssues, T>.right(val));

  /// Creates an error [ZRes] wrapping a list of [issues].
  ///
  /// Example:
  /// ```dart
  /// final error = ZRes<String>.error([ZIssue.lengthNotMet(expectedLength: 10, actualLength: 9)]);
  /// print(error.isError); // true
  /// ```
  factory ZRes.error(ZIssues issues) {
    if (issues.isEmpty) throw ArgumentError('The issues list must contain at least one issue!');
    return ZRes._(Either<ZIssues, T>.left(issues));
  }

  /// Creates an error [ZRes] wrapping a single [issue].
  ///
  /// Example:
  /// ```dart
  /// final errorSingleIssue = ZRes<String>.errorSingleIssue(ZIssue.lengthNotMet(expectedLength: 10, actualLength: 9));
  /// print(errorSingleIssue.issues); // [ZIssueLengthNotMet]
  /// ```
  factory ZRes.errorSingleIssue(ZIssue issue) => ZRes.error([issue]);

  /// Internal constructor for [ZRes].
  ///
  /// Use factory constructors [ZRes.success], [ZRes.error], or [ZRes.errorSingleIssue] instead.
  const ZRes._(this._either);

  /// ❗ Internal only: DO NOT expose fpdart.Either in public API
  final Either<ZIssues, T> _either;

  /// Returns `true` if the operation result is success.
  bool get isSuccess => _either.isRight();

  /// Returns `true` if the operation result is error.
  bool get isError => _either.isLeft();

  /// Returns value of type [T] on success or null.
  T? get value => _either.getRight().toNullable();

  /// The list of [ZIssue]s associated with the error or null if the operation result is success.
  ZIssues? get rawIssues => _either.getLeft().toNullable();

  /// Returns the value if the result is successful; otherwise, computes a fallback using [onError].
  ///
  /// This is useful when you want to extract the success value or provide a default/derived value
  /// from the list of [ZIssue]s in case of failure.
  ///
  /// Example:
  /// ```dart
  /// final result = ZRes.errorSingleIssue<int>(ZIssueMinNotMet(min: 10, val: 9);
  /// final strValue = result.valueOr((issues) => -1); // returns -1
  /// ```
  ///
  /// If the result is successful, returns the contained value directly.
  T valueOr(T Function(ZIssues) onError) => fold(onError, identity);

  /// Returns a result of the operation represented by sealed class [ZResult].
  ///
  /// Use Dart pattern matching (`switch` or `if case`) to extract the value or error.
  ///
  /// Example:
  /// ```dart
  ///  final result = switch (ZRes.success('value').asResult()) {
  ///    ZValue(:final val) => 'Success: $val',
  ///    ZError(:final issues) => 'issues: $issues',
  ///  };
  /// ```
  ZResult<T> asResult() => fold(ZError.new, ZValue.new);

  /// Applies [onError] if error, or [onSuccess] if success.
  ///
  /// Example:
  /// ```dart
  /// final output = ZRes.success('1').match(
  ///   (issues) => 'Issues: $issues',
  ///   (value) => 'Value: $value',
  /// );
  /// print(output);
  /// ```
  C match<C>(C Function(ZIssues l) onError, C Function(T r) onSuccess) => fold(onError, onSuccess);

  /// Applies [onError] if error, or [onSuccess] if success.
  ///
  /// Example:
  /// ```dart
  /// final output = ZRes.success('1').fold(
  ///   (issues) => 'Issues: $issues',
  ///   (value) => 'Value: $value',
  /// );
  /// print(output);
  /// ```
  C fold<C>(C Function(ZIssues) onError, C Function(T) onSuccess) => _either.match(onError, onSuccess);
}

/// Extension that provides utility methods on [ZRes] to improve the end-user experience.
extension ZResExt<T> on ZRes<T> {
  /// Returns the list of localized issue messages if the result is an error, or `null` if the result is a success.
  List<String>? get issueMessages => match(
    (rawIssues) => rawIssues.localizedMessages,
    (_) => null,
  );

  /// Returns the list of localized issue messages joined by newline if the result is an error, or `null` if the result is a success.
  String? get issueSummary => match(
    (rawIssues) => rawIssues.localizedSummary,
    (_) => null,
  );

  /// Returns the list of localized issue messages for the given [path], or `null` if no matching issues are found.
  List<String>? getMessagesFor(String path) =>
      _findIssuesForPath(path).map((issues) => issues.localizedMessages).toNullable();

  /// Returns the list of [ZIssue]s for the given [path], or `null` if no matching issues are found.
  ZIssues? getRawIssuesFor(String path) => _findIssuesForPath(path).toNullable();

  /// Returns localized issue messages joined by a newline for the given [path],
  /// or `null` if no matching issues are found.
  ///
  /// Includes the field path if [includePath] is set to true. Default: `false`.
  String? getSummaryFor(String path, {bool includePath = false}) =>
      _findIssuesForPath(path).map((issues) => issues.getLocalizedSummary(includePath: includePath)).toNullable();

  Option<ZIssues> _findIssuesForPath(String path) => match(
    (rawIssues) => findIssuesForPath(rawIssues, path),
    (_) => const Option.none(),
  );
}

/// Extension that provides utility methods on [ZError] to improve the end-user experience.
extension ZErrorExt<T> on ZError<T> {
  /// The list of localized issue messages associated with the error.
  List<String> get messages => rawIssues.localizedMessages;

  /// All localized issue messages associated with the error joined by newline.
  String get summary => rawIssues.localizedSummary;

  /// Returns the list of localized issue messages for the given [path], or `null` if no matching issues are found.
  List<String>? getMessagesFor(String path) =>
      findIssuesForPath(rawIssues, path).map((issues) => issues.localizedMessages).toNullable();

  /// Returns the list of [ZIssue]s for the given [path], or `null` if no matching issues are found.
  ZIssues? getRawIssuesFor(String path) => findIssuesForPath(rawIssues, path).toNullable();

  /// Returns localized issue messages joined by a newline for the given [path],
  /// or `null` if no matching issues are found.
  String? getSummaryFor(String path) =>
      findIssuesForPath(rawIssues, path).map((issues) => issues.localizedSummary).toNullable();
}
