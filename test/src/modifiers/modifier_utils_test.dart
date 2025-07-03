import 'package:test/test.dart';
import 'package:zodart/src/base/z_issue.dart';
import 'package:zodart/src/modifiers/modifier_utils.dart';

void main() {
  const issue1 = ZIssue.custom(message: 'issue1');
  const issue2 = ZIssue.custom(message: 'issue2');
  const issue3 = ZIssue.custom(message: 'issue3');

  group('toSuperRefinerRes', () {
    test('Returns null when given an empty list of issues', () {
      const emptyIssues = <ZIssue>[];
      final res = emptyIssues.toSuperRefinerRes();
      expect(res, isNull);
    });

    test('Returns the single issue as primary and an empty others list when given one issue', () {
      const emptyIssues = [issue1];
      final res = emptyIssues.toSuperRefinerRes();

      expect(res?.$1, issue1);
      expect(res?.others, isEmpty);
    });

    test('Returns the first issue as primary and remaining issues in others when given multiple issues', () {
      const emptyIssues = [issue1, issue2, issue3];
      final res = emptyIssues.toSuperRefinerRes();

      expect(res?.$1, equals(issue1));
      expect(res?.others, hasLength(2));
      expect(res?.others[0], issue2);
      expect(res?.others[1], issue3);
    });
  });
}
