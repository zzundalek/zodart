import '../base/base.dart';

/// Returns the String length
int getStrLength(String val) => val.length;

/// Returns the length of a T  Iterable
int getIterableLength<T>(Iterable<T> val) => val.length;

/// Function which returns length of T
typedef LengthGetter<T> = int Function(T);

/// Builds a rule that checks a value of type [T] has length ≥ `min`.
///
/// Uses [lengthGetter] to extract the length.
/// Returns success if valid, otherwise [ZIssueMinLengthNotMet].
ResRule<T> Function(int min) minLengthRule<T>(LengthGetter<T> lengthGetter) {
  return (int min) {
    return (T val) {
      final length = lengthGetter(val);

      return length >= min
          ? ZRes.success(val)
          : ZRes.errorSingleIssue(
              ZIssueMinLengthNotMet(
                actualLength: length,
                minLength: min,
              ),
            );
    };
  };
}

/// Builds a rule that checks a value of type [T] has length ≤ `max`.
///
/// Uses [lengthGetter] to extract the length.
/// Returns success if valid, otherwise [ZIssueMaxLengthExceeded].
ResRule<T> Function(int max) maxLengthRule<T>(LengthGetter<T> lengthGetter) {
  return (int max) {
    return (T val) {
      final length = lengthGetter(val);

      return length <= max
          ? ZRes.success(val)
          : ZRes.errorSingleIssue(
              ZIssueMaxLengthExceeded(
                actualLength: length,
                maxLength: max,
              ),
            );
    };
  };
}

/// Returns a [ResRule] of type `ResRule<String>`, which checks minimum string length.
///
/// The returned rule will succeed if the input string's length is greater than or equal to [min],
/// otherwise it will return a [ZIssueMinLengthNotMet].
ResRule<String> minStrLengthRule(int min) => minLengthRule(getStrLength)(min);

/// Returns a [ResRule] of type `ResRule<String>`, which checks maximum string length.
///
/// The returned rule will succeed if the input string's length is less than or equal to [max],
/// otherwise it will return a [ZIssueMaxLengthExceeded].
ResRule<String> maxStrLengthRule(int max) => maxLengthRule(getStrLength)(max);

/// Returns a [ResRule] of type `ResRule<Iterable<T>>`, which checks minimum iterable length.
///
/// The returned rule will succeed if the input iterable's length is greater than or equal to [min],
/// otherwise it will return a [ZIssueMinLengthNotMet].
ResRule<Iterable<T>> minIterableLengthRule<T>(int min) => minLengthRule(getIterableLength<T>)(min);

/// Returns a [ResRule] of type `ResRule<Iterable<T>>`, which checks maximum iterable length.
///
/// The returned rule will succeed if the input iterable's length is less than or equal to [max],
/// otherwise it will return a [ZIssueMaxLengthExceeded].
ResRule<Iterable<T>> maxIterableLengthRule<T>(int max) => maxLengthRule(getIterableLength<T>)(max);

/// Returns a [ResRule] of type `ResRule<T>`, which checks minimum number value.
///
/// The returned rule will succeed if the input value is less than or equal to [min],
/// otherwise it will return a [ZIssueMinNotMet].
///
/// T must extend [num].
ResRule<T> minNumRule<T extends num>(T min) {
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

/// Returns a [ResRule] of type `ResRule<T>`, which checks maximum number value.
///
/// The returned rule will succeed if the input value is greater than or equal to [max],
/// otherwise it will return a [ZIssueMaxExceeded].
///
/// T must extend [num].
ResRule<T> maxNumRule<T extends num>(T max) {
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

/// Returns a [ResRule] of type `ResRule<String>`, which checks the string value against [regex].
///
/// The returned rule will succeed if the input value `hasMatch` against the [regex] string,
/// otherwise it will return a [ZIssueCustom].
ResRule<String> regexRule(String regex, {String? message, String? code}) {
  return (String val) {
    return RegExp(regex).hasMatch(val)
        ? ZRes.success(val)
        : ZRes.errorSingleIssue(ZIssueCustom(message: message, code: code));
  };
}

/// Returns a [ResRule] of type `ResRule<T>`, which wraps the passed refiner to return a [ZRes]
/// depending on the refiner result.
///
/// - If the refiner returns `true`, returns [ZRes.success] passing the checked value.
/// - If the refiner returns `false`, returns [ZRes.error] passing a [ZIssueCustom]
///   with the passed [message] and [code].
ResRule<T> refineRule<T>(Refiner<T> refiner, {String? message, String? code}) {
  return (T val) {
    return refiner(val) ? ZRes.success(val) : ZRes.errorSingleIssue(ZIssueCustom(message: message, code: code));
  };
}

/// Returns a [ResRule] of type `ResRule<T>`, which wraps the passed super refiner to return a [ZRes]
/// depending on the super refiner result.
///
/// - If the refiner returns `null`, returns [ZRes.success] passing the checked value.
/// - If the refiner returns [SuperRefinerErrorRes], returns [ZRes.error] passing all the [ZIssue]s
ResRule<T> superRefineRule<T>(SuperRefiner<T> refiner) {
  return (T val) {
    return switch (refiner(val)) {
      (final firstIssue, :final others) => ZRes.error([firstIssue, ...others]),
      null => ZRes.success(val),
    };
  };
}

/// Returns a [ResRule] of type `ResRule<DateTime>`, which checks minimum value.
///
/// The returned rule will succeed if the input datetime is later than or equal to [min],
/// otherwise it will return a [ZIssueMinDateTimeNotMet].
ResRule<DateTime> minDateTimeRule(DateTime min) {
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

/// Returns a [ResRule] of type `ResRule<DateTime>`, which checks maximum value.
///
/// The returned rule will succeed if the input datetime is befor than or equal to [max],
/// otherwise it will return a [ZIssueMaxDateTimeExceeded].
ResRule<DateTime> maxDateTimeRule(DateTime max) {
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
