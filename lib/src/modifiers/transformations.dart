import '../base/base.dart';

/// A [ResTransformer] from `String` to `int`.
///
/// Takes a [String] [val], attempts to parse it to an `int` using [int.parse].
///
/// Returns a [ZRes<int>] containing the parsed integer on success.
///
/// On error (if parsing throws), returns a [ZIssueParseFail] wrapped
/// in a left [ZRes].
ZRes<int> stringToInt(String val) {
  try {
    return ZRes.success(int.parse(val));
  } on Exception catch (e) {
    return ZRes.errorSingleIssue(
      ZIssueParseFail(
        from: String,
        to: int,
        val: val,
        throwable: e,
      ),
    );
  }
}

/// A [ResTransformer] from `int` to `double`.
///
/// Returns a [ZRes<int>] containing the double value.
ZRes<double> intToDouble(int val) => ZRes.success(val.toDouble());

/// A [ResTransformer] from `String` to `double`.
///
/// Takes a [String] [val], attempts to parse it to an `double` using [double.parse].
///
/// Returns a [ZRes<double>] containing the parsed double on success.
///
/// On error (if parsing throws), returns a [ZIssueParseFail] wrapped
/// in a left [ZRes].
ZRes<double> stringToDouble(String val) {
  try {
    return ZRes.success(double.parse(val));
  } on Exception catch (e) {
    return ZRes.errorSingleIssue(
      ZIssueParseFail(
        from: String,
        to: double,
        val: val,
        throwable: e,
      ),
    );
  }
}

/// A [ResTransformer] from `String` to `DateTime`.
///
/// Takes a [String] [val], attempts to parse it to a `DateTime` using [DateTime.parse].
///
/// Returns a [ZRes<DateTime>] containing the parsed DateTime on success.
///
/// On error (if parsing throws), returns a [ZIssueParseFail] wrapped
/// in a left [ZRes].
ZRes<DateTime> stringToDateTime(String val) {
  try {
    return ZRes.success(DateTime.parse(val));
  } on Exception catch (e) {
    return ZRes.errorSingleIssue(
      ZIssueParseFail(
        from: String,
        to: DateTime,
        val: val,
        throwable: e,
      ),
    );
  }
}
