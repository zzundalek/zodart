import '../base/base.dart';

/// Returns a [Rule] of type `Rule<String>`, which checks minimum string length.
///
/// The returned rule will succeed if the input string's length is greater than or equal to [min],
/// otherwise it will return a [ZIssueMinLengthNotMet].
Rule<String> minStrLengthRule(int min) {
  return (String val) {
    final length = val.length;

    return length >= min
        ? ZRes.success(val)
        : ZRes.errorSingleIssue(
            ZIssueMinLengthNotMet(
              actualLength: length,
              minLength: min,
            ),
          );
  };
}

/// Returns a [Rule] of type `Rule<String>`, which checks maximum string length.
///
/// The returned rule will succeed if the input string's length is less than or equal to [max],
/// otherwise it will return a [ZIssueMaxLengthExceeded].
Rule<String> maxStrLengthRule(int max) {
  return (String val) {
    final length = val.length;

    return length <= max
        ? ZRes.success(val)
        : ZRes.errorSingleIssue(
            ZIssueMaxLengthExceeded(
              actualLength: length,
              maxLength: max,
            ),
          );
  };
}

/// Returns a [Rule] of type `Rule<T>`, which checks minimum number value.
///
/// The returned rule will succeed if the input value is less than or equal to [min],
/// otherwise it will return a [ZIssueMinNotMet].
///
/// T must extend [num].
Rule<T> minNumRule<T extends num>(T min) {
  return (T val) {
    return val >= min
        ? ZRes.success(val)
        : ZRes.errorSingleIssue(
            ZIssueMinNotMet(
              min: min,
              val: val,
            ),
          );
  };
}

/// Returns a [Rule] of type `Rule<T>`, which checks maximum number value.
///
/// The returned rule will succeed if the input value is greater than or equal to [max],
/// otherwise it will return a [ZIssueMaxExceeded].
///
/// T must extend [num].
Rule<T> maxNumRule<T extends num>(T max) {
  return (T val) {
    return val <= max
        ? ZRes.success(val)
        : ZRes.errorSingleIssue(
            ZIssueMaxExceeded(
              max: max,
              val: val,
            ),
          );
  };
}

/// Returns a [Rule] of type `Rule<String>`, which trims and returns the String value.
Rule<String> trimRule() =>
    (String val) => ZRes.success(val.trim());
