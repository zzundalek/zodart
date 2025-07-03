import '../base/z_typedefs.dart';

/// Extension on [ZIssues] that provides a utility for converting to [SuperRefinerErrorRes],
/// typically used in `superRefine` implementations.
extension ZIssuesToSuperRefinerRes on ZIssues {
  /// Converts this [ZIssues] to a [SuperRefinerErrorRes] tuple.
  /// Returns `null` if the list is empty.
  SuperRefinerErrorRes? toSuperRefinerRes() {
    if (isNotEmpty) {
      return (first, others: sublist(1));
    } else {
      return null;
    }
  }
}
