import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:zodart/src/base/base.dart';
import 'package:zodart/src/localization/localization.dart';

@GenerateNiceMocks([
  MockSpec<ZIssueLocalizationService>(),
])
import 'z_rest_test.mocks.dart';

/// Helper class to test the hash code
@immutable
class TestObj {
  const TestObj(this.val);

  final String val;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TestObj && const DeepCollectionEquality().equals(other.val, val));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(val));
}

void main() {
  group('ZRes', () {
    const testIssue = ZIssueParseFail(from: Null, to: String, val: null);
    test('isSuccess', () {
      expect(ZRes.success('string value').isSuccess, isTrue);
      expect(ZRes<String>.errorSingleIssue(testIssue).isSuccess, isFalse);
      expect(ZRes<String>.errorSingleIssue(testIssue).isSuccess, isFalse);
    });
    test('isError', () {
      expect(ZRes.success('string value').isError, isFalse);
      expect(ZRes<String>.errorSingleIssue(testIssue).isError, isTrue);
      expect(ZRes<String>.errorSingleIssue(testIssue).isError, isTrue);
    });
    test('get value', () {
      expect(ZRes.success('string value').value, equals('string value'));
      expect(ZRes<String>.errorSingleIssue(testIssue).value, isNull);
      expect(ZRes<String>.errorSingleIssue(testIssue).value, isNull);
    });
    test('get rawIssues', () {
      expect(ZRes.success('string value').rawIssues, isNull);
      expect(ZRes<String>.errorSingleIssue(testIssue).rawIssues, equals([testIssue]));
      expect(ZRes<String>.errorSingleIssue(testIssue).rawIssues, equals([testIssue]));
    });
    test('valueOr', () {
      String dummyValue(dynamic _) => 'dummy value';

      expect(ZRes.success('string value').valueOr(dummyValue), 'string value');
      expect(ZRes<String>.errorSingleIssue(testIssue).valueOr(dummyValue), 'dummy value');
      expect(ZRes<String>.errorSingleIssue(testIssue).valueOr(dummyValue), 'dummy value');
    });
    test('asResult', () {
      expect(ZRes.success('string value').asResult(), equals(const ZValue('string value')));
      expect(ZRes<String>.errorSingleIssue(testIssue).asResult(), equals(const ZError<String>([testIssue])));
      expect(ZRes<String>.errorSingleIssue(testIssue).asResult(), equals(const ZError<String>([testIssue])));
    });
    test('match', () {
      expect(ZRes.success('string value').match((_) => null, (r) => r), equals('string value'));
      expect(ZRes<String>.errorSingleIssue(testIssue).match((l) => l, (_) => null), equals([testIssue]));
      expect(ZRes<String>.errorSingleIssue(testIssue).match((l) => l, (_) => null), equals([testIssue]));
    });
    group('issueMessages', () {
      const stubbedMessage = 'stubbed message';
      late MockZIssueLocalizationService serviceMock;
      setUp(() {
        serviceMock = MockZIssueLocalizationService();
        when(
          serviceMock.getIssueText(argThat(isA<ZIssue>()), includePath: anyNamed('includePath')),
        ).thenReturn(stubbedMessage);
      });

      test('uses current ZIssueLocalizationService to return localized issueMessages', () {
        final res = runWithValue(zoneKeyForLocalizationService, serviceMock, () {
          expect(ZRes<String>.errorSingleIssue(testIssue).issueMessages, equals([stubbedMessage]));
          verify(serviceMock.getIssueText(testIssue, includePath: true)).called(1);
          verifyNoMoreInteractions(serviceMock);
          return true;
        });
        expect(res, isTrue);
      });
      test('returns null for issueMessages on success and does not call getIssueText', () {
        final res = runWithValue(zoneKeyForLocalizationService, serviceMock, () {
          expect(ZRes.success('string value').issueMessages, isNull);
          verifyNever(serviceMock.getIssueText(testIssue, includePath: anyNamed('includePath')));
          return true;
        });
        expect(res, isTrue);
      });
    });
    group('issueSummary', () {
      const stubbedMessages = [
        'stubbed message 1',
        'stubbed message 2',
      ];
      const testIssues = [
        ZIssueParseFail(from: Null, to: String, val: null),
        ZIssueParseFail(from: Null, to: int, val: null),
      ];

      late MockZIssueLocalizationService serviceMock;

      setUp(() {
        serviceMock = MockZIssueLocalizationService();
        when(
          serviceMock.getIssueText(testIssues[0], includePath: anyNamed('includePath')),
        ).thenReturn(stubbedMessages[0]);
        when(
          serviceMock.getIssueText(testIssues[1], includePath: anyNamed('includePath')),
        ).thenReturn(stubbedMessages[1]);
      });

      test('uses current ZIssueLocalizationService to return localized issueSummary', () {
        final res = runWithValue(zoneKeyForLocalizationService, serviceMock, () {
          expect(ZRes<String>.error(testIssues).issueSummary, equals(stubbedMessages.join('\n')));
          verify(serviceMock.getIssueText(testIssues[0], includePath: true)).called(1);
          verify(serviceMock.getIssueText(testIssues[1], includePath: true)).called(1);
          verifyNoMoreInteractions(serviceMock);
          return true;
        });
        expect(res, isTrue);
      });
      test('returns null for issueSummary on success and does not call getIssueText', () {
        final res = runWithValue(zoneKeyForLocalizationService, serviceMock, () {
          expect(ZRes.success('string value').issueSummary, isNull);
          verifyNever(serviceMock.getIssueText(any, includePath: anyNamed('includePath')));
          return true;
        });
        expect(res, isTrue);
      });
    });
    group('getMessagesFor', () {
      test('Returns null for success', () {
        expect(ZRes.success('val').getMessagesFor('dummy'), isNull);
      });
      test('Returns null if the path does not match', () {
        expect(
          ZRes<String>.errorSingleIssue(ZIssueMissingValue(rawPath: ZPath.property('zodArt'))).getMessagesFor('dummy'),
          isNull,
        );
      });
      test('Returns a list of the issue texts if the path does match', () {
        expect(
          ZRes<String>.errorSingleIssue(ZIssueMissingValue(rawPath: ZPath.property('zodArt'))).getMessagesFor('zodArt'),
          isA<List<String>>(),
        );
      });
    });
    group('getSummaryFor', () {
      test('Returns null for success', () {
        expect(ZRes.success('val').getSummaryFor('dummy'), isNull);
      });
      test('Returns null if the path does not match', () {
        expect(
          ZRes<String>.errorSingleIssue(ZIssueMissingValue(rawPath: ZPath.property('zodArt'))).getSummaryFor('dummy'),
          isNull,
        );
      });
      test('Returns a list of the issue texts if the path does match', () {
        expect(
          ZRes<String>.errorSingleIssue(ZIssueMissingValue(rawPath: ZPath.property('zodArt'))).getSummaryFor('zodArt'),
          isA<String>(),
        );
      });
      test('Path is not included in the return text', () {
        final text = ZRes<String>.errorSingleIssue(
          ZIssueMissingValue(rawPath: ZPath.property('zodArt')),
        ).getSummaryFor('zodArt');

        expect(RegExp(r'^\[.+\] .+$').hasMatch(text ?? ''), isFalse);
      });
    });
    group('getRawIssuesFor', () {
      test('Returns null for success', () {
        expect(ZRes.success('val').getRawIssuesFor('dummy'), isNull);
      });
      test('Returns null if the path does not match', () {
        expect(
          ZRes<String>.errorSingleIssue(ZIssueMissingValue(rawPath: ZPath.property('zodArt'))).getRawIssuesFor('dummy'),
          isNull,
        );
      });
      test('Returns a list of the issues if the path does match', () {
        expect(
          ZRes<String>.errorSingleIssue(
            ZIssueMissingValue(rawPath: ZPath.property('zodArt')),
          ).getRawIssuesFor('zodArt'),
          isA<List<ZIssue>>(),
        );
      });
    });
  });
  group('ZError', () {
    const testIssue = ZIssueParseFail(from: Null, to: String, val: null);
    group('messages', () {
      const stubbedMessage = 'stubbed message';
      late MockZIssueLocalizationService serviceMock;
      setUp(() {
        serviceMock = MockZIssueLocalizationService();
        when(
          serviceMock.getIssueText(argThat(isA<ZIssue>()), includePath: anyNamed('includePath')),
        ).thenReturn(stubbedMessage);
      });
      test('uses current ZIssueLocalizationService to return localized messages', () {
        final res = runWithValue(zoneKeyForLocalizationService, serviceMock, () {
          expect(const ZError<String>([testIssue]).messages, equals([stubbedMessage]));
          verify(serviceMock.getIssueText(testIssue, includePath: true)).called(1);
          verifyNoMoreInteractions(serviceMock);
          return true;
        });
        expect(res, isTrue);
      });
    });
    group('summary', () {
      const stubbedMessages = [
        'stubbed message 1',
        'stubbed message 2',
      ];
      const testIssues = [
        ZIssueParseFail(from: Null, to: String, val: null),
        ZIssueParseFail(from: Null, to: int, val: null),
      ];

      late MockZIssueLocalizationService serviceMock;

      setUp(() {
        serviceMock = MockZIssueLocalizationService();
        when(
          serviceMock.getIssueText(testIssues[0], includePath: anyNamed('includePath')),
        ).thenReturn(stubbedMessages[0]);
        when(
          serviceMock.getIssueText(testIssues[1], includePath: anyNamed('includePath')),
        ).thenReturn(stubbedMessages[1]);
      });

      test('uses current ZIssueLocalizationService to return localized summary', () {
        final res = runWithValue(zoneKeyForLocalizationService, serviceMock, () {
          expect(const ZError<String>(testIssues).summary, equals(stubbedMessages.join('\n')));
          verify(serviceMock.getIssueText(testIssues[0], includePath: true)).called(1);
          verify(serviceMock.getIssueText(testIssues[1], includePath: true)).called(1);
          verifyNoMoreInteractions(serviceMock);
          return true;
        });
        expect(res, isTrue);
      });
    });
    group('getMessagesFor', () {
      test('Returns null if the path does not match', () {
        expect(
          ZError<String>([ZIssueMissingValue(rawPath: ZPath.property('zodArt'))]).getMessagesFor('dummy'),
          isNull,
        );
      });
      test('Returns a list of the issue texts if the path does match', () {
        expect(
          ZError<String>([ZIssueMissingValue(rawPath: ZPath.property('zodArt'))]).getMessagesFor('zodArt'),
          isA<List<String>>(),
        );
      });
    });
    group('getSummaryFor', () {
      test('Returns null if the path does not match', () {
        expect(
          ZError<String>([ZIssueMissingValue(rawPath: ZPath.property('zodArt'))]).getSummaryFor('dummy'),
          isNull,
        );
      });
      test('Returns a list of the issue texts if the path does match', () {
        expect(
          ZError<String>([ZIssueMissingValue(rawPath: ZPath.property('zodArt'))]).getSummaryFor('zodArt'),
          isA<String>(),
        );
      });
    });
    group('getRawIssuesFor', () {
      test('Returns null if the path does not match', () {
        expect(
          ZError<String>([ZIssueMissingValue(rawPath: ZPath.property('zodArt'))]).getRawIssuesFor('dummy'),
          isNull,
        );
      });
      test('Returns a list of the issues if the path does match', () {
        expect(
          ZError<String>([ZIssueMissingValue(rawPath: ZPath.property('zodArt'))]).getRawIssuesFor('zodArt'),
          isA<List<ZIssue>>(),
        );
      });
    });
  });
}
