import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'z_path.freezed.dart';

/// Represents an object path, consisting of a list of [ZPathItem]s.
///
/// Examples:
/// - `user.name` → `[ZProperty('user'), ZProperty('name')]`
/// - `users[10].name` → `[ZProperty('users'), ZIndex(10), ZProperty('name')]`
@freezed
abstract class ZPath with _$ZPath {
  /// Main constructor.
  const factory ZPath(List<ZPathItem> path) = _Path;

  /// Creates an empty path.
  factory ZPath.empty() => const ZPath([]);

  /// Creates a path with a single index.
  factory ZPath.index(int index) => ZPath([ZIndex(index)]);

  /// Creates a path with a single property.
  factory ZPath.property(String property) => ZPath([ZProperty(property)]);

  const ZPath._();

  /// Formats a single path segment as a string, considering its position in the path.
  ///
  /// - The first property is not prefixed with a dot.
  /// - Subsequent properties are prefixed with a dot.
  /// - Indices are always formatted as `[index]`.
  String _formatPathSegment(ZPathItem item, bool isFirst) => switch (item) {
        ZIndex(:final index) => '[$index]',
        ZProperty(:final property) when isFirst => property,
        ZProperty(:final property) => '.$property',
      };

  /// Returns a string representation of the path,
  /// e.g. `user.name`, `users[10].name`, `[1].name`.
  String? get pathStr {
    if (path.isEmpty) return null;

    return path.foldLeftWithIndex<String>('', (curr, item, index) => curr += _formatPathSegment(item, index == 0));
  }

  /// Adds a path item to the beginning of this path.
  ZPath prependPathItem(ZPathItem pathItem) => copyWith(path: [pathItem, ...path]);

  /// Adds an index to the beginning of this path.
  ZPath prependIndex(int index) => prependPathItem(ZIndex(index));

  /// Adds a property to the beginning of this path.
  ZPath prependProperty(String property) => prependPathItem(ZProperty(property));
}

/// A single path item, either an index `[n]` or a property `prop`.
@freezed
sealed class ZPathItem with _$ZPathItem {
  /// Index path item.
  const factory ZPathItem.index(int index) = ZIndex;

  /// Property path item.
  const factory ZPathItem.property(String property) = ZProperty;
}
