import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:zodart/src/base/base.dart';
import 'package:zodart/src/localization/localization.dart';

@GenerateNiceMocks([
  MockSpec<ZIssueLocalizationService>(),
])
import 'localization_utils_test.mocks.dart';

void main() {
  group('localizeIssue', () {
    const stubbedMessage = 'stubbed message';

    late MockZIssueLocalizationService mockService;
    setUp(() {
      mockService = MockZIssueLocalizationService();
      when(
        mockService.getIssueText(argThat(isA<ZIssue>()), includePath: anyNamed('includePath')),
      ).thenReturn(stubbedMessage);
    });
    test('uses the passed ZIssueLocalizationService to localize the issue and returns the expected result', () {
      const issue = ZIssueLengthNotMet(expectedLength: 1, actualLength: 2);
      final res = localizeIssue(issue, includePath: true, service: mockService);
      expect(res, stubbedMessage);
      verify(mockService.getIssueText(issue, includePath: anyNamed('includePath'))).called(1);
      verifyNoMoreInteractions(mockService);
    });
    group('validates includePath param is properly passed', () {
      const issue = ZIssueLengthNotMet(expectedLength: 1, actualLength: 2);
      test('check includePath true', () {
        final res = localizeIssue(issue, includePath: true, service: mockService);
        expect(res, stubbedMessage);
        verify(mockService.getIssueText(issue, includePath: true)).called(1);
        verifyNoMoreInteractions(mockService);
      });
      test('check includePath false', () {
        final res = localizeIssue(issue, includePath: false, service: mockService);
        expect(res, stubbedMessage);
        verify(mockService.getIssueText(issue, includePath: false)).called(1);
        verifyNoMoreInteractions(mockService);
      });
    });
  });
}
