import 'package:test/test.dart';
import 'package:zodart/src/base/base.dart';
import 'package:zodart/src/utils/utils.dart';
import 'package:zodart/src/zodart_base.dart';

void main() {
  group('IterableWhereOrNull', () {
    group('whereOrNull', () {
      test('Returns null if the list is empty', () {
        final res = <int>[].whereOrNull((p) => p > 1);
        expect(res, isNull);
      });
      test('Returns null if the filtered list is empty', () {
        final res = [0, 1].whereOrNull((p) => p > 1);
        expect(res, isNull);
      });
      test('Returns the filtered list if it is not empty', () {
        final res = [0, 1, 2, 3].whereOrNull((p) => p > 1);
        expect(res, equals([2, 3]));
      });
    });
    group('whereOrOption', () {
      test('Returns `none` if the list is empty', () {
        final res = <int>[].whereOrOption((p) => p > 1);
        expect(res.isNone(), isTrue);
      });
      test('Returns `none` if the filtered list is empty', () {
        final res = [0, 1].whereOrOption((p) => p > 1);
        expect(res.isNone(), isTrue);
      });
      test('Returns the filtered iterable if it is not empty', () {
        final res = [0, 1, 2, 3].whereOrOption((p) => p > 1);
        expect(res.isNone(), isFalse);
        expect(res.toNullable(), equals([2, 3]));
      });
    });
    group('whereOrOptionList', () {
      test('Returns `none` if the list is empty', () {
        final res = <int>[].whereOrOptionList((p) => p > 1);
        expect(res.isNone(), isTrue);
      });
      test('Returns `none` if the filtered list is empty', () {
        final res = [0, 1].whereOrOptionList((p) => p > 1);
        expect(res.isNone(), isTrue);
      });
      test('Returns the filtered list if it is not empty', () {
        final res = [0, 1, 2, 3].whereOrOptionList((p) => p > 1);
        expect(res.toNullable(), isA<List<int>>());
        expect(res.toNullable(), equals([2, 3]));
      });
    });
  });
  group('findIssuesForPath', () {
    final zIssuesRec = (
      empty: ZIssueParseFail(
        from: String,
        to: int,
        val: 'ZodArt',
        rawPath: ZPath.empty(),
      ),
      index0: ZIssueLengthNotMet(
        actualLength: 10,
        expectedLength: 1,
        rawPath: ZPath.index(0),
      ),
      index10: ZIssueMinLengthNotMet(
        minLength: 20,
        actualLength: 2,
        rawPath: ZPath.index(10),
      ),
      propName: ZIssueParseFail(
        from: String,
        to: int,
        val: 'ZodArt',
        rawPath: ZPath.property('name'),
      ),
      propValid: ZIssueParseFail(
        from: String,
        to: int,
        val: 'ZodArt',
        rawPath: ZPath.property('valid'),
      ),
      propIndexProp: const ZIssueParseFail(
        from: String,
        to: int,
        val: 'ZodArt',
        rawPath: ZPath(
          [
            ZProperty('users'),
            ZIndex(2),
            ZPathItem.property('name'),
          ],
        ),
      ),
      indexPropIndex: const ZIssueParseFail(
        from: String,
        to: int,
        val: 'ZodArt',
        rawPath: ZPath(
          [
            ZIndex(2),
            ZPathItem.property('users'),
            ZPathItem.index(11),
          ],
        ),
      ),
    );

    final zIssues = [
      zIssuesRec.empty,
      zIssuesRec.index0,
      zIssuesRec.index10,
      zIssuesRec.propName,
      zIssuesRec.propValid,
      zIssuesRec.propIndexProp,
      zIssuesRec.indexPropIndex,
    ];

    test('Returns `none` for not matching query', () {
      final res = findIssuesForPath(zIssues, 'someDummyPath');
      expect(res.isNone(), isTrue);
    });

    test('Returns correct issue for index query', () {
      final res = findIssuesForPath(zIssues, '[10]');
      expect(res.isSome(), isTrue);
      expect(res.toNullable(), equals([zIssuesRec.index10]));
    });

    test('Returns correct issue for property query', () {
      final res = findIssuesForPath(zIssues, 'name');
      expect(res.isSome(), isTrue);
      expect(res.toNullable(), equals([zIssuesRec.propName]));
    });

    test('Returns correct issue for nested prop.index.prop', () {
      final res = findIssuesForPath(zIssues, 'users[2].name');
      expect(res.isSome(), isTrue);
      expect(res.toNullable(), equals([zIssuesRec.propIndexProp]));
    });
    test('Returns correct issue for nested index.prop.index', () {
      final res = findIssuesForPath(zIssues, '[2].users[11]');
      expect(res.isSome(), isTrue);
      expect(res.toNullable(), equals([zIssuesRec.indexPropIndex]));
    });
    test('Returns both issues for duplicate path', () {
      final zIssueWithDuplicate = [...zIssues, zIssuesRec.propName];
      final res = findIssuesForPath(zIssueWithDuplicate, 'name');
      expect(res.isSome(), isTrue);
      expect(res.toNullable(), equals([zIssuesRec.propName, zIssuesRec.propName]));
    });
  });
}
