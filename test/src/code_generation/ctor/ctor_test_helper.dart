import 'package:code_builder/code_builder.dart';
import 'package:test/test.dart';
import 'package:zodart/src/code_generation/analysis/entity_analysis.dart';
import 'package:zodart/src/code_generation/ctor/_ctor.dart';

typedef ExpectedResult = ({
  bool hasOptPositionalParams,
  bool hasReqPositionalParams,
  Map<String, TypeMismatch> typeMismatches,
  Set<String> missingInCtor,
  Set<String> missingInSchema,
  bool isValid,
});

extension ExpectedResultExt on ExpectedResult {
  ExpectedResult copyWith({
    bool? hasOptPositionalParams,
    bool? hasReqPositionalParams,
    Map<String, TypeMismatch>? typeMismatches,
    Set<String>? missingInCtor,
    Set<String>? missingInSchema,
    bool? isValid,
  }) {
    return (
      hasOptPositionalParams: hasOptPositionalParams ?? this.hasOptPositionalParams,
      hasReqPositionalParams: hasReqPositionalParams ?? this.hasReqPositionalParams,
      typeMismatches: typeMismatches ?? this.typeMismatches,
      missingInCtor: missingInCtor ?? this.missingInCtor,
      missingInSchema: missingInSchema ?? this.missingInSchema,
      isValid: isValid ?? this.isValid,
    );
  }
}

void testAnalysisResult(ExpectedResult expectedResult, CtorAnalysis ctorAnalysis) {
  expect(
    ctorAnalysis.hasOptPositionalParams,
    expectedResult.hasOptPositionalParams,
    reason:
        "Expected hasOptPositionalParams to be '${expectedResult.hasOptPositionalParams}', "
        "but got '${ctorAnalysis.hasOptPositionalParams}'.",
  );

  expect(
    ctorAnalysis.hasReqPositionalParams,
    expectedResult.hasReqPositionalParams,
    reason:
        "Expected hasReqPositionalParams to be '${expectedResult.hasReqPositionalParams}', "
        "but got '${ctorAnalysis.hasReqPositionalParams}'.",
  );

  expect(
    ctorAnalysis.isValid,
    expectedResult.isValid,
    reason:
        "Expected isValid to be '${expectedResult.isValid}', "
        "but got '${ctorAnalysis.isValid}'.",
  );

  expect(ctorAnalysis.missingInEntity, unorderedEquals(expectedResult.missingInCtor));
  expect(ctorAnalysis.missingInSchema, unorderedEquals(expectedResult.missingInSchema));
  expect(ctorAnalysis.typeMismatches, equals(expectedResult.typeMismatches));
}

const ExpectedResult defaultExpectedResult = (
  hasOptPositionalParams: false,
  hasReqPositionalParams: false,
  typeMismatches: {},
  missingInCtor: {},
  missingInSchema: {},
  isValid: true,
);

// NOT needed
// ignore: specify_nonobvious_property_types
final refs = (
  str: refer('String'),
  int: refer('int'),
  double: refer('double'),
  optStr: refer('String?'),
  optInt: refer('int?'),
  optDouble: refer('double?'),
);

const defaultUnnamedCtor = UnnamedCtor(
  isConst: true,
  isFactory: false,
  reqNamedParams: {},
  optNamedParams: {},
  reqPositionalParams: [],
  optPositionalParams: [],
);

const defaultNamedCtor = NamedCtor(
  name: 'myCtor',
  isConst: true,
  isFactory: false,
  reqNamedParams: {},
  optNamedParams: {},
  reqPositionalParams: [],
  optPositionalParams: [],
);

Matcher throwsArgumentErrorWith(String message) => throwsA(
  predicate(
    (e) => e is ArgumentError && e.message == message,
  ),
);

class PicksValidCtorMatcher extends Matcher {
  const PicksValidCtorMatcher({required this.expected, required this.isValid});

  static const matchStateReason = 'reason';

  final Ctor expected;
  final bool isValid;

  @override
  bool matches(dynamic item, Map<dynamic, dynamic> matchState) {
    if (item is! BestCtor) {
      matchState[matchStateReason] = 'Item is not a BestCtor type (was ${item.runtimeType})';
      return false;
    }

    final isPickedCtorValid = item.isRight();
    if (isPickedCtorValid != isValid) {
      matchState[matchStateReason] = 'Picked ctor validity mismatch. Expected $isValid, got $isPickedCtorValid.';
      return false;
    }
    final picked = extractPickedCtor(item);
    if (picked != expected) {
      matchState[matchStateReason] = 'Picked ctor was $picked instead of $expected';
      return false;
    }
    return true;
  }

  Ctor extractPickedCtor(BestCtor bestCtor) => bestCtor.getOrElse((left) => left.ctor);

  @override
  Description describe(Description description) =>
      description.add('Picks a ${isValid ? 'valid' : 'invalid'} ctor: $expected');

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map<dynamic, dynamic> matchState,
    bool verbose,
  ) {
    final str = matchState[matchStateReason] ?? 'Unknown mismatch';

    return mismatchDescription.add('$str');
  }
}
