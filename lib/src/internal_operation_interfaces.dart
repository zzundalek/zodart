import 'base/base.dart';
import 'types/types.dart';

/// Interface implemented by every subclass of [ZBase] defining custom checks, trasnformations etc.
///
/// More methods will be added.
// ignore: one_member_abstracts
abstract class ZTransformations<From, To> {
  /// Adds a custom refinement to ensure the value satisfies the given [refiner].
  ///
  /// If the [refiner] returns `false`, the validation will fail
  /// with a [ZRes.errorSingleIssue] containing a [ZIssueCustom].
  ///
  /// You can optionally provide a custom error [message] and [code].
  ///
  /// Refining is skipped when the value is `null`.
  ///
  /// Example:
  /// ```dart
  /// final schema = ZString().refine(
  ///   (val) => val.isNotEmpty,
  ///   message: 'String is empty',
  /// );
  /// ```
  ZBase<To> refine(Refiner<From> refiner, {String? message, String? code});
}
