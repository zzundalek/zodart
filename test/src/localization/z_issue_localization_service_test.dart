import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:zodart/src/base/base.dart';
import 'package:zodart/src/localization/localization.dart';

@GenerateNiceMocks([
  MockSpec<ZIssueLocalization>(),
])
import 'z_issue_localization_service_test.mocks.dart';

void main() {
  group('getIssueText', () {
    late MockZIssueLocalization mockIssueLocalization;
    late ZIssueLocalizationService service;
    const stubbedMessage = 'stubbed message';

    setUp(() {
      mockIssueLocalization = MockZIssueLocalization();
      service = createZIssueLocalizationServiceForTesting(mockIssueLocalization);
      when(mockIssueLocalization.lengthNotMet(argThat(isA<ZIssueLengthNotMet>()))).thenReturn(stubbedMessage);
      when(mockIssueLocalization.minLengthNotMet(argThat(isA<ZIssueMinLengthNotMet>()))).thenReturn(stubbedMessage);
      when(mockIssueLocalization.maxLengthExceeded(argThat(isA<ZIssueMaxLengthExceeded>()))).thenReturn(stubbedMessage);
      when(mockIssueLocalization.minNotMet(argThat(isA<ZIssueMinNotMet>()))).thenReturn(stubbedMessage);
      when(mockIssueLocalization.maxExceeded(argThat(isA<ZIssueMaxExceeded>()))).thenReturn(stubbedMessage);
      when(mockIssueLocalization.parseFail(argThat(isA<ZIssueParseFail>()))).thenReturn(stubbedMessage);
      when(mockIssueLocalization.missingValue(argThat(isA<ZIssueMissingValue>()))).thenReturn(stubbedMessage);
    });

    test('calls lengthNotMet for ZIssueLengthNotMet', () {
      const issue = ZIssueLengthNotMet(expectedLength: 1, actualLength: 2);
      service.getIssueText(issue);
      verify(mockIssueLocalization.lengthNotMet(issue)).called(1);
      verifyNoMoreInteractions(mockIssueLocalization);
    });
    test('calls minLengthNotMet for ZIssueMinLengthNotMet', () {
      const issue = ZIssueMinLengthNotMet(minLength: 10, actualLength: 9);
      service.getIssueText(issue);
      verify(mockIssueLocalization.minLengthNotMet(issue)).called(1);
      verifyNoMoreInteractions(mockIssueLocalization);
    });
    test('calls maxLengthExceeded for ZIssueMaxLengthExceeded', () {
      const issue = ZIssueMaxLengthExceeded(maxLength: 10, actualLength: 11);
      service.getIssueText(issue);
      verify(mockIssueLocalization.maxLengthExceeded(issue)).called(1);
      verifyNoMoreInteractions(mockIssueLocalization);
    });
    test('calls minNotMet for ZIssueMinNotMet', () {
      const issue = ZIssueMinNotMet(min: 10, val: 9);
      service.getIssueText(issue);
      verify(mockIssueLocalization.minNotMet(issue)).called(1);
      verifyNoMoreInteractions(mockIssueLocalization);
    });
    test('calls maxExceeded for ZIssueMaxExceeded', () {
      const issue = ZIssueMaxExceeded(max: 10, val: 11);
      service.getIssueText(issue);
      verify(mockIssueLocalization.maxExceeded(issue)).called(1);
      verifyNoMoreInteractions(mockIssueLocalization);
    });
    test('calls parseFail for ZIssueParseFail', () {
      const issue = ZIssueParseFail(from: String, to: int, val: 'dummy');
      service.getIssueText(issue);
      verify(mockIssueLocalization.parseFail(issue)).called(1);
      verifyNoMoreInteractions(mockIssueLocalization);
    });
    test('calls missingValue for ZIssueMissingValue', () {
      final issue = ZIssueMissingValue(rawPath: ZPath.property('name'));
      service.getIssueText(issue);
      verify(mockIssueLocalization.missingValue(issue)).called(1);
      verifyNoMoreInteractions(mockIssueLocalization);
    });
  });
}
