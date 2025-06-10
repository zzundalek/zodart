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
}
