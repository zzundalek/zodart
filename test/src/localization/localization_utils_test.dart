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
      when(mockService.getIssueText(argThat(isA<ZIssue>()))).thenReturn(stubbedMessage);
    });
    test('uses the passed ZIssueLocalizationService to localize the issue and returns the expected result', () {
      const issue = ZIssueLengthNotMet(expectedLength: 1, actualLength: 2);
      final res = localizeIssue(issue, service: mockService);
      expect(res, stubbedMessage);
      verify(mockService.getIssueText(issue)).called(1);
      verifyNoMoreInteractions(mockService);
    });
  });
}
