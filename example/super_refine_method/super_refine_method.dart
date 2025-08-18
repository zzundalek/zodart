// Example
// ignore_for_file: avoid_print

import 'package:zodart/zodart.dart';

/// Custom superRefiner for DateTime values.
/// Returns validation issues if the value is not in UTC or is before year 0.
SuperRefinerErrorRes? superRefiner(DateTime val) {
  final issues = <ZIssue>[];

  if (!val.isUtc) {
    issues.add(const ZIssueCustom(code: '10', message: 'DateTime should be in UTC'));
  }

  if (val.isBefore(DateTime(0))) {
    issues.add(const ZIssueCustom(code: '10', message: 'DateTime should not be B.C.'));
  }

  // Converts the issues list to a SuperRefinerErrorRes if not empty; returns null otherwise.
  // This is the expected return format for the `superRefine` method.
  return issues.toSuperRefinerRes();
}

void main() {
  final zDateTime = ZDateTime().superRefine(superRefiner);

  final res = zDateTime.parse(DateTime(0).subtract(const Duration(days: 1)));

  // Prints:
  // DateTime should be in UTC
  // DateTime should not be B.C.
  print(res.issueSummary);
}
