import 'package:test/test.dart';
import 'package:zodart/src/localization/localization.dart';

void main() {
  group('ZLocalizationContext', () {
    final csService = ZIssueLocalizationService(Language.cs);
    final enService = ZIssueLocalizationService(Language.en);
    final jaService = ZIssueLocalizationService(Language.ja);

    setUp(() => ZLocalizationContext.current = ZIssueLocalizationService(defaultLanguage));

    test('default localization is set to ZIssueLocalizationEn', () {
      ZLocalizationContext.current = csService;
      expect(ZLocalizationContext.current, equals(csService));

      ZLocalizationContext.current = jaService;
      expect(ZLocalizationContext.current, equals(jaService));

      ZLocalizationContext.current = enService;
      expect(ZLocalizationContext.current, equals(enService));
    });

    tearDown(() => ZLocalizationContext.current = ZIssueLocalizationService(defaultLanguage));
  });
}
