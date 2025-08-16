import 'package:test/test.dart';
import 'package:zodart/src/code_generation/ctor/_ctor.dart';

import 'ctor_test_helper.dart';

void main() {
  group('from', () {
    test('retuns a valid analysis for only required params', () {
      final ctor = defaultNamedCtor.copyWith(
        reqNamedParams: {'reqStr': refs.str},
      );
      final schema = {
        'reqStr': refs.str,
      };

      testAnalysisResult(
        defaultExpectedResult,
        CtorAnalysis.from(ctor: ctor, schema: schema),
      );
    });

    test('retuns an invalid analysis if ctor contains a required positional args', () {
      final ctor = defaultUnnamedCtor.copyWith(
        reqNamedParams: {'reqStr': refs.str},
        reqPositionalParams: [refs.str],
      );
      final schema = {
        'reqStr': refs.str,
      };

      testAnalysisResult(
        defaultExpectedResult.copyWith(hasReqPositionalParams: true, isValid: false),
        CtorAnalysis.from(ctor: ctor, schema: schema),
      );
    });

    test('retuns an invalid analysis if ctor contains an optional positional args', () {
      final ctor = defaultNamedCtor.copyWith(
        reqNamedParams: {'reqStr': refs.str},
        optPositionalParams: [refs.str],
      );
      final schema = {
        'reqStr': refs.str,
      };

      testAnalysisResult(
        defaultExpectedResult.copyWith(hasOptPositionalParams: true, isValid: false),
        CtorAnalysis.from(ctor: ctor, schema: schema),
      );
    });
    test('retuns an invalid analysis if ctor is missing params contained in the schema', () {
      final ctor = defaultNamedCtor.copyWith();
      final schema = {
        'reqStr': refs.str,
      };

      testAnalysisResult(
        defaultExpectedResult.copyWith(isValid: false, missingInCtor: {'reqStr'}),
        CtorAnalysis.from(ctor: ctor, schema: schema),
      );
    });
    test('retuns an invalid analysis if there is a type mismatch', () {
      final ctor = defaultUnnamedCtor.copyWith(
        reqNamedParams: {'reqStr': refs.double},
      );
      final schema = {
        'reqStr': refs.str,
      };

      testAnalysisResult(
        defaultExpectedResult.copyWith(
          isValid: false,
          typeMismatches: {'reqStr': (expectedType: 'String', actualType: 'double')},
        ),
        CtorAnalysis.from(ctor: ctor, schema: schema),
      );
    });

    test('analysis contains the original schema and ctor', () {
      final ctor = defaultUnnamedCtor.copyWith(
        reqNamedParams: {'reqStr': refs.double},
      );
      final schema = {
        'reqStr': refs.str,
      };

      final analysis = CtorAnalysis.from(ctor: ctor, schema: schema);

      expect(analysis.ctor, equals(ctor));
      expect(analysis.schema, equals(schema));
    });
  });
}
