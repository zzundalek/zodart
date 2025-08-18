import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:zodart/src/code_generation/ctor/_ctor.dart';

import '../../../mocks/ctor_analysis/ctor_analysis.dart';

void main() {
  group('errorSummary', () {
    late MockCtorAnalysis ctorAnalysis;

    setUp(() {
      ctorAnalysis = MockCtorAnalysis();
      when(ctorAnalysis.hasReqPositionalParams).thenReturn(false);
      when(ctorAnalysis.hasOptPositionalParams).thenReturn(false);
      when(ctorAnalysis.missingInCtor).thenReturn({});
      when(ctorAnalysis.missingInSchema).thenReturn({});
      when(ctorAnalysis.typeMismatches).thenReturn({});
    });

    test('returns empty string if the ctor is valid', () {
      expect(ctorAnalysis.errorSummary, isEmpty);
    });

    test('returns correct error string for required unnamed params', () {
      when(ctorAnalysis.hasReqPositionalParams).thenReturn(true);
      expect(ctorAnalysis.errorSummary, '- requires unnamed (positional) parameters.\n');
    });

    test('returns correct error string for optional unnamed params', () {
      when(ctorAnalysis.hasOptPositionalParams).thenReturn(true);
      expect(ctorAnalysis.errorSummary, '- allows unnamed (positional) parameters.\n');
    });

    test('returns correct error string for missing ctor params', () {
      when(ctorAnalysis.missingInCtor).thenReturn({'strVal', 'intVal'});
      expect(ctorAnalysis.errorSummary, '- missing required schema parameters: {strVal, intVal}\n');
    });

    test('returns correct error string for missing schema params', () {
      when(ctorAnalysis.missingInSchema).thenReturn({'someValue'});
      expect(ctorAnalysis.errorSummary, '- unexpected parameters not defined in the schema: {someValue}\n');
    });

    test('returns correct error string for type mismatches', () {
      when(ctorAnalysis.typeMismatches).thenReturn({
        'strVal': (expectedType: 'String', actualType: 'double'),
        'optIntVal': (expectedType: 'int?', actualType: null),
      });

      expect(
        ctorAnalysis.errorSummary,
        '- parameters type mismatch(es):\n'
        "    - 'strVal' expected type is 'String', but received 'double'\n"
        "    - 'optIntVal' expected type is 'int?', but received 'null'\n",
      );
    });

    test('returns correct error string with right error order for all error types', () {
      when(ctorAnalysis.hasReqPositionalParams).thenReturn(true);
      when(ctorAnalysis.hasOptPositionalParams).thenReturn(true);
      when(ctorAnalysis.missingInCtor).thenReturn({'strVal', 'intVal'});
      when(ctorAnalysis.missingInSchema).thenReturn({'someValue'});
      when(ctorAnalysis.typeMismatches).thenReturn({
        'strVal': (expectedType: 'String', actualType: 'double'),
        'optIntVal': (expectedType: 'int?', actualType: null),
      });

      expect(
        ctorAnalysis.errorSummary,
        '''
- requires unnamed (positional) parameters.
- allows unnamed (positional) parameters.
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
