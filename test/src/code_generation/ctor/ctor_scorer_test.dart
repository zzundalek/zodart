import 'package:test/test.dart';
import 'package:zodart/src/code_generation/ctor/ctor_analysis.dart';
import 'package:zodart/src/code_generation/ctor/ctor_scorer.dart';

import '../../../mocks/ctor_analysis/ctor_analysis.dart';
import 'ctor_test_helper.dart';

void testEqualScore(
  CtorAnalysis a,
  CtorAnalysis b,
) => testScoreOrder(
  a,
  b,
  comparisonSymbol: '==',
  comparisonFunc: (a, b) => a == b,
);

void testHigherScore(
  CtorAnalysis a,
  CtorAnalysis b,
) => testScoreOrder(
  a,
  b,
  comparisonSymbol: '>',
  comparisonFunc: (a, b) => a > b,
);

void testScoreOrder(
  CtorAnalysis a,
  CtorAnalysis b, {
  required bool Function(int, int) comparisonFunc,
  required String comparisonSymbol,
}) {
  final aScore = CtorScorer(a).getScore();
  final bScore = CtorScorer(b).getScore();

  expect(
    comparisonFunc(aScore, bScore),
    isTrue,
    reason:
        'Score order check $aScore $comparisonSymbol $bScore failed.\n'
        '######################################\n'
        '#######         Detail        ########\n'
        '######################################\n'
        'Missing in ctor:\n'
        '${a.missingInEntity}\n'
        '${b.missingInEntity}\n'
        '\n'
        'Missing in schema:\n'
        '${a.missingInSchema}\n'
        '${b.missingInSchema}\n'
        '\n'
        'Type mismatches:\n'
        '${a.typeMismatches}\n'
        '${b.typeMismatches}\n'
        '\n'
        'Schema:\n'
        '${a.schema}\n'
        '${b.schema}\n'
        '\n'
        'Ctor:\n'
        '${a.ctor}\n'
        '${b.ctor}\n',
  );
}

void main() {
  group('getScore', () {
    group('ctors comparison by ctor modifiers', () {
      test('const ctor is scored higher', () {
        final constCtor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor,
          schema: {},
        );
        final nonConstCtor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor.copyWith(isConst: false),
          schema: {},
        );
        testHigherScore(constCtor, nonConstCtor);
      });
      test('factory ctor is scored lower', () {
        final ctor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor,
          schema: {},
        );
        final factorCtor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor.copyWith(isFactory: true),
          schema: {},
        );
        testHigherScore(ctor, factorCtor);
      });
      test('named ctor is scored lower', () {
        final unnamedCtor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor,
          schema: {},
        );
        final namedCtor = mockCtorAnalysis(
          ctor: defaultNamedCtor,
          schema: {},
        );
        testHigherScore(unnamedCtor, namedCtor);
      });
      test('factory const named ctor is scored higher than unnamed not_factory not_const ctor', () {
        final ctor1 = mockCtorAnalysis(
          ctor: defaultNamedCtor.copyWith(isFactory: true),
          schema: {},
          missingInCtor: {'someVal1'},
        );
        final ctor2 = mockCtorAnalysis(
          ctor: defaultUnnamedCtor.copyWith(isConst: false),
          schema: {},
          missingInCtor: {'someVal1', 'someVal2'},
        );
        testHigherScore(ctor1, ctor2);
      });
    });
    group('ctors comparison by ctor modifiers vs params', () {
      test('lower scored valid ctor is scored higher than ctor with optional positional param', () {
        final validCtor = mockCtorAnalysis(
          ctor: defaultNamedCtor.copyWith(isConst: false, isFactory: true),
          schema: {},
        );
        final optPositionalParamCtor = mockCtorAnalysis(
          ctor: defaultNamedCtor.copyWith(optPositionalParams: [refs.optStr]),
          schema: {},
        );
        testHigherScore(validCtor, optPositionalParamCtor);
      });
    });
    group('ctors comparison by params vs schema', () {
      test('ctor with missing param is scored same as ctor with param not in schema', () {
        final c1 = mockCtorAnalysis(
          ctor: defaultNamedCtor,
          schema: {},
          missingInCtor: {'someValue'},
        );
        final c2 = mockCtorAnalysis(
          ctor: defaultNamedCtor,
          schema: {},
          missingInSchema: {'someValue'},
        );
        testEqualScore(c1, c2);
      });
      test('ctor with missing param is scored same as ctor with required positional param', () {
        final c1 = mockCtorAnalysis(
          ctor: defaultNamedCtor,
          schema: {},
          missingInCtor: {'someValue'},
        );
        final c2 = mockCtorAnalysis(
          ctor: defaultNamedCtor.copyWith(reqPositionalParams: [refs.str]),
          schema: {},
        );
        testEqualScore(c1, c2);
      });
      test('ctor with param type mismatch is scored higher than ctor with missing param', () {
        final paramMismatchCtor = mockCtorAnalysis(
          ctor: defaultNamedCtor,
          schema: {},
          typeMismatches: {'someValue': (expectedType: 'String', actualType: 'String?')},
        );
        final missingParamCtor = mockCtorAnalysis(
          ctor: defaultNamedCtor,
          missingInCtor: {'someValue'},
          schema: {},
        );
        testHigherScore(paramMismatchCtor, missingParamCtor);
      });
      test('ctor with optional positional param is scored higher than ctor with param type mismatch', () {
        final optPositionalParamCtor = mockCtorAnalysis(
          ctor: defaultNamedCtor.copyWith(optPositionalParams: [refs.optStr]),
          schema: {},
        );
        final paramMismatchCtor = mockCtorAnalysis(
          ctor: defaultNamedCtor,
          schema: {},
          typeMismatches: {'someValue': (expectedType: 'String', actualType: 'String?')},
        );
        testHigherScore(optPositionalParamCtor, paramMismatchCtor);
      });
      test('a valid ctor is scored higher that ctor with optional param', () {
        final validCtor = mockCtorAnalysis(
          ctor: defaultNamedCtor,
          schema: {},
        );
        final optPositionalParamCtor = mockCtorAnalysis(
          ctor: defaultNamedCtor.copyWith(optPositionalParams: [refs.optStr]),
          schema: {},
        );
        testHigherScore(validCtor, optPositionalParamCtor);
      });
    });
    group('ctors comparison by params (multiply)', () {
      test('ctor with missing one param is scored higher than ctor with missing two params', () {
        final missingOneParamCtor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor,
          schema: {},
          missingInCtor: {'someVal1'},
        );
        final missingTwoParamsCtor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor,
          schema: {},
          missingInCtor: {'someVal1', 'someVal2'},
        );
        testHigherScore(missingOneParamCtor, missingTwoParamsCtor);
      });
      test('ctor with one param missing in schema is scored higher than ctor with missing two params in schema', () {
        final missingOneParamCtor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor,
          schema: {},
          missingInSchema: {'someVal1'},
        );
        final missingTwoParamsCtor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor,
          schema: {},
          missingInSchema: {'someVal1', 'someVal2'},
        );
        testHigherScore(missingOneParamCtor, missingTwoParamsCtor);
      });
      test('ctor with one required positional param is scored higher than ctor with two', () {
        final oneParamCtor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor.copyWith(reqPositionalParams: [refs.str]),
          schema: {},
        );
        final twoParamsCtor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor.copyWith(reqPositionalParams: [refs.double, refs.optInt]),
          schema: {},
        );
        testHigherScore(oneParamCtor, twoParamsCtor);
      });
      test('ctor with one mismatch is scored higher than ctor with two', () {
        final oneMismatchCtor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor,
          schema: {},
          typeMismatches: {
            'val1': (expectedType: 'String?', actualType: 'String'),
          },
        );
        final twoMismatchCtor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor,
          schema: {},
          typeMismatches: {
            'val1': (expectedType: 'String?', actualType: 'String'),
            'val2': (expectedType: 'int', actualType: 'double'),
          },
        );
        testHigherScore(oneMismatchCtor, twoMismatchCtor);
      });
      test('ctor with one positional optional param is scored higher than ctor with two', () {
        final oneMismatchCtor = mockCtorAnalysis(
          ctor: defaultNamedCtor.copyWith(optPositionalParams: [refs.optDouble]),
          schema: {},
        );
        final twoMismatchCtor = mockCtorAnalysis(
          ctor: defaultNamedCtor.copyWith(optPositionalParams: [refs.optDouble, refs.optStr]),
          schema: {},
        );
        testHigherScore(oneMismatchCtor, twoMismatchCtor);
      });
    });
    group('score value check', () {
      test('check the best valid ctor score value', () {
        final validCtor = mockCtorAnalysis(
          ctor: defaultUnnamedCtor,
          schema: {},
        );
        final score = CtorScorer(validCtor).getScore();
        expect(score, 8);
      });
    });
  });
}
