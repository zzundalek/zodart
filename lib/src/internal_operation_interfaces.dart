import 'base/base.dart';
import 'types/types.dart';

/// Interface implemented by every subclass of [ZBase] defining custom checks, transformations etc.
abstract class ZTransformations<From, To> {
  /// Adds a custom refinement to ensure the value satisfies the given [refiner].
  ///
  /// If the [refiner] returns `false`, the validation will fail
  /// with a [ZRes.errorSingleIssue] containing a [ZIssueCustom].
  ///
  /// You can optionally provide a custom error [message] and [code].
  ///
  /// This is a simplified alternative to [superRefine].
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

  /// Adds a check to ensure that the value satisfies the given [refiner].
  ///
  /// This is a more flexible and expressive alternative to the [refine] function.
  ///
  /// Refining is skipped when the value is `null`.
  ///
  /// Example:
  /// ```dart
  /// SuperRefinerErrorRes? superRefineEmptyString(String val) {
  ///   final issues = <ZIssue>[];
  ///
  ///   if (val.isEmpty) {
  ///     issues.add(const ZIssueCustom(code: '10', message: 'The value should not be empty.'));
  ///   }
  ///
  ///   return issues.toSuperRefinerRes();
  /// }
  /// final schema = ZString().superRefine(superRefineEmptyString);
  /// ```
  ZBase<To> superRefine(SuperRefiner<From> refiner);

  /// Adds a custom processing of a value using [processor].
  ///
  /// Processing is skipped when the value is `null`.
  ///
  /// Example:
  /// ```dart
  /// String processor(String val) => '$val - but most of all, ZodArt is my hero.';
  /// final schema = ZString().process(processor).parse('Hello, world!');
  /// ```
  ZBase<To> process(Processor<From> processor);
}

/// Interface implemented by every nullable subclass of [ZBase] defining custom checks, transformations etc.
// Will add more in the future
// ignore: one_member_abstracts
abstract class ZNullableTransformations<From, To> {
  /// Specifies a fallback transformation to apply when the value is `null`.
  ///
  /// Useful for transforming a `null` value into a valid non-null result.
  ///
  /// Example:
  /// ```dart
  /// String onNull() => 'default value';
  /// ZString().nullable().onNull(onNull).parse(null); // Returns 'default value'
  /// ```
  ZBase<To> onNull(NullFallback<From> nullFallback);
}
