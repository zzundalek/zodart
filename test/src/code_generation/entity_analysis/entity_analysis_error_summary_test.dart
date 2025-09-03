import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:zodart/src/code_generation/analysis/entity_analysis_error_summary.dart';

import '../../../mocks/entity_analysis/entity_analysis.dart';

void main() {
  group('errorSummary', () {
    late MockEntityAnalysis entityAnalysis;

    setUp(() {
      entityAnalysis = MockEntityAnalysis();
      when(entityAnalysis.hasReqPositionalParams).thenReturn(false);
      when(entityAnalysis.hasOptPositionalParams).thenReturn(false);
      when(entityAnalysis.missingInEntity).thenReturn({});
      when(entityAnalysis.missingInSchema).thenReturn({});
      when(entityAnalysis.typeMismatches).thenReturn({});
    });

    test('returns empty string if the entity is valid', () {
      expect(entityAnalysis.errorSummary, isEmpty);
    });

    test('returns correct error string for required unnamed params', () {
      when(entityAnalysis.hasReqPositionalParams).thenReturn(true);
      expect(entityAnalysis.errorSummary, '- requires unnamed (positional) parameters\n');
    });

    test('returns correct error string for optional unnamed params', () {
      when(entityAnalysis.hasOptPositionalParams).thenReturn(true);
      expect(entityAnalysis.errorSummary, '- allows unnamed (positional) parameters\n');
    });

    test('returns correct error string for missing entity params', () {
      when(entityAnalysis.missingInEntity).thenReturn({'strVal', 'intVal'});
      expect(entityAnalysis.errorSummary, '- missing required schema parameters: {strVal, intVal}\n');
    });

    test('returns correct error string for missing schema params', () {
      when(entityAnalysis.missingInSchema).thenReturn({'someValue'});
      expect(entityAnalysis.errorSummary, '- unexpected parameters not defined in the schema: {someValue}\n');
    });

    test('returns correct error string for type mismatches', () {
      when(entityAnalysis.typeMismatches).thenReturn({
        'strVal': (expectedType: 'String', actualType: 'double'),
        'optIntVal': (expectedType: 'int?', actualType: null),
      });

      expect(
        entityAnalysis.errorSummary,
        '- parameters type mismatch(es):\n'
        "  - 'strVal' expected type is 'String', but received 'double'\n"
        "  - 'optIntVal' expected type is 'int?', but received 'null'\n",
      );
    });

    test('returns correct error string with right error order for all error types', () {
      when(entityAnalysis.hasReqPositionalParams).thenReturn(true);
      when(entityAnalysis.hasOptPositionalParams).thenReturn(true);
      when(entityAnalysis.missingInEntity).thenReturn({'strVal', 'intVal'});
      when(entityAnalysis.missingInSchema).thenReturn({'someValue'});
      when(entityAnalysis.typeMismatches).thenReturn({
        'strVal': (expectedType: 'String', actualType: 'double'),
        'optIntVal': (expectedType: 'int?', actualType: null),
      });

      expect(
        entityAnalysis.errorSummary,
        '''
- requires unnamed (positional) parameters
- allows unnamed (positional) parameters
- missing required schema parameters: {strVal, intVal}
- unexpected parameters not defined in the schema: {someValue}
- parameters type mismatch(es):
  - 'strVal' expected type is 'String', but received 'double'
  - 'optIntVal' expected type is 'int?', but received 'null'
''',
      );
    });
  });
}
