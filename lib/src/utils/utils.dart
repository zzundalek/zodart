import 'package:fpdart/fpdart.dart';

import '../base/zodart_exceptions.dart';
import '../zodart_base.dart';

/// Extension which adds `whereOrNull` to [Iterable]
extension IterableWhereOrNull<T> on Iterable<T> {
  /// Filters the [Iterable] using the provided [test] function and returns the filtered result
  /// if it is not empty; otherwise, returns `null`.
  Iterable<T>? whereOrNull(bool Function(T) test) {
    final filteredIterable = where(test);
    return filteredIterable.isNotEmpty ? filteredIterable : null;
  }

  /// Filters the [Iterable] using the provided [test] function and returns the filtered result
  /// as an [Option], where `None` represents an empty result. The result remains lazy [Iterable].
  Option<Iterable<T>> whereOrOption(bool Function(T) test) {
    final filteredIterable = where(test);
    return Option.fromNullable(filteredIterable.isNotEmpty ? filteredIterable : null);
  }

  /// Filters the [Iterable] using the provided [test] function and returns the filtered result
  /// as an [Option<List<T>>], where `None` represents an empty result. The result is eagerly evaluated into a [List].
  Option<List<T>> whereOrOptionList(bool Function(T) test) => whereOrOption(test).map((t) => t.toList());
}

/// Filters the given [issues] by matching their [path] property against the specified [path].
///
/// Returns an [Option] containing a [List] of matching [ZIssue]s if any are found, or [None] if no matching issues exist.
///
/// This is useful for retrieving issues relevant to a specific path in a structured or hierarchical data model.
Option<ZIssues> findIssuesForPath(ZIssues issues, String path) =>
    issues.whereOrOptionList((issue) => issue.path == path);

/// Provides helper methods for [Map].
extension MapExt<K, V> on Map<K, V> {
  /// Returns a value for the key.
  ///
  /// If the map is not containing the key, throws a [ZodArtInternalException].
  V getOrThrow(K key) {
    if (!containsKey(key)) throw ZodArtInternalException('Key not found at map: $key');
    return this[key]!;
  }
}

/// Provides helper methods for [Either]
extension EitherExt<L, R> on Either<L, R> {
  /// Converts this [Either] to [Either<L, T>] if the `Right` value is of type [T].
  ///
  /// If the `Right` value is not of type [T], returns `Left` with the result of [onError].
  Either<L, T> refineRightType<T>(L Function(R) onError) {
    return flatMap((e) => e is T ? Right<L, T>(e as T) : Left<L, T>(onError(e)));
  }
}

/// Provides helper methods for [Either<L, List<R>>].
extension EitherListExtension<L, R> on Either<L, List<R>> {
  /// If the [Either] is [Right], then change its list values from type `R` to
  /// type `C` using function `mapper`.
  Either<L, List<C>> mapList<C>(C Function(R) mapper) => map((items) => items.map(mapper).toList());

  /// If the [Either] is [Right], then execute `traverseEither` with `mapper` on the [Right].
  Either<L, List<C>> flatMapList<C>(Either<L, C> Function(R) mapper) =>
      flatMap((items) => items.traverseEither(mapper));
}
