import 'package:test/test.dart';
import 'package:zodart/src/base/z_path.dart';

void main() {
  group('get pathStr', () {
    test('Returns null for empty path.', () {
      expect(ZPath.empty().pathStr, isNull);
    });
    test('Returns right path for index only.', () {
      expect(
        ZPath.index(1).pathStr,
        '[1]',
      );
    });
    test('Returns right path for two lists.', () {
      expect(
        const ZPath([
          ZIndex(1),
          ZIndex(5),
        ]).pathStr,
        '[1][5]',
      );
    });
    test('Returns right path for property only.', () {
      expect(
        const ZPath([
          ZProperty('user'),
          ZProperty('name'),
        ]).pathStr,
        'user.name',
      );
    });
    test('Returns right path for two properties.', () {
      expect(
        const ZPath([
          ZProperty('user'),
          ZProperty('name'),
        ]).pathStr,
        'user.name',
      );
    });
    test('Returns right path for a list followed by a property.', () {
      expect(
        const ZPath([
          ZIndex(1),
          ZProperty('name'),
        ]).pathStr,
        '[1].name',
      );
    });
    test('Returns right path for list and properties.', () {
      expect(
        const ZPath([
          ZProperty('users'),
          ZIndex(10),
          ZProperty('name'),
        ]).pathStr,
        'users[10].name',
      );
    });
  });
  group('appendPathItem', () {
    test('Returns right path for an empty path appending a property.', () {
      expect(
        ZPath.empty().appendPathItem(const ZPathItem.property('prop')),
        equals(const ZPath([ZPathItem.property('prop')])),
      );
    });
    test('Returns right path for an empty path appending an index.', () {
      expect(
        ZPath.empty().appendPathItem(const ZPathItem.index(0)),
        equals(const ZPath([ZPathItem.index(0)])),
      );
    });
    test('Returns right path for a path contaning a property appending a property.', () {
      expect(
        ZPath.property('prop1').appendPathItem(const ZPathItem.property('prop2')),
        equals(const ZPath([ZPathItem.property('prop1'), ZPathItem.property('prop2')])),
      );
    });
    test('Returns right path for a path containg an index appending an index.', () {
      expect(
        ZPath.index(0).appendPathItem(const ZPathItem.index(1)),
        equals(const ZPath([ZPathItem.index(0), ZPathItem.index(1)])),
      );
    });
  });
}
