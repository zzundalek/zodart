import '../base/base.dart';

/// A [Transformer] from `String` to `int`.
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

/// A [Transformer] from `String` to `double`.
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
