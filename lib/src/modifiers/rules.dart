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

/// Returns a [Rule] of type `Rule<T>`, which wraps the passed refiner to return a [ZRes]
/// depending on the refiner result.
///
/// - If the refiner returns `true`, returns [ZRes.success] passing the checked value.
/// - If the refiner returns `false`, returns [ZRes.error] passing a [ZIssueCustom]
///   with the passed [message] and [code].
Rule<T> refineRule<T>(Refiner<T> refiner, {String? message, String? code}) {
  return (T val) {
    return refiner(val) ? ZRes.success(val) : ZRes.errorSingleIssue(ZIssueCustom(message: message, code: code));
  };
}

/// Returns a [Rule] of type `Rule<T>`, which wraps the passed super refiner to return a [ZRes]
/// depending on the super refiner result.
///
/// - If the refiner returns `null`, returns [ZRes.success] passing the checked value.
/// - If the refiner returns [SuperRefinerErrorRes], returns [ZRes.error] passing all the [ZIssue]s
Rule<T> superRefineRule<T>(SuperRefiner<T> refiner) {
  return (T val) {
    return switch (refiner(val)) {
      (final firstIssue, :final others) => ZRes.error([firstIssue, ...others]),
      null => ZRes.success(val),
    };
  };
}

/// Returns a [Rule] of type `Rule<DateTime>`, which checks minimum value.
///
/// The returned rule will succeed if the input datetime is later than or equal to [min],
/// otherwise it will return a [ZIssueMinDateTimeNotMet].
Rule<DateTime> minDateTimeRule(DateTime min) {
  return (DateTime val) {
    return val.isAfter(min) || val.isAtSameMomentAs(min)
        ? ZRes.success(val)
        : ZRes.errorSingleIssue(
            ZIssueMinDateTimeNotMet(
              val: val,
              min: min,
            ),
          );
  };
}

/// Returns a [Rule] of type `Rule<DateTime>`, which checks maximum value.
///
/// The returned rule will succeed if the input datetime is befor than or equal to [max],
/// otherwise it will return a [ZIssueMaxDateTimeExceeded].
Rule<DateTime> maxDateTimeRule(DateTime max) {
  return (DateTime val) {
    return val.isBefore(max) || val.isAtSameMomentAs(max)
        ? ZRes.success(val)
        : ZRes.errorSingleIssue(
            ZIssueMaxDateTimeExceeded(
              val: val,
              max: max,
            ),
          );
  };
}
