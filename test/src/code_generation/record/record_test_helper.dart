import 'package:code_builder/code_builder.dart';
import 'package:test/test.dart';
import 'package:zodart/src/code_generation/analysis/entity_analysis.dart';
import 'package:zodart/src/code_generation/record/record.dart';
import 'package:zodart/src/code_generation/record/record_analysis.dart';

typedef ExpectedResult = ({
  bool hasPositionalParams,
  Map<String, TypeMismatch> typeMismatches,
  Set<String> missingInRecord,
  Set<String> missingInSchema,
  bool isValid,
});

extension ExpectedResultExt on ExpectedResult {
  ExpectedResult copyWith({
    bool? hasPositionalParams,
    Map<String, TypeMismatch>? typeMismatches,
    Set<String>? missingInRecord,
    Set<String>? missingInSchema,
    bool? isValid,
  }) {
    return (
      hasPositionalParams: hasPositionalParams ?? this.hasPositionalParams,
      typeMismatches: typeMismatches ?? this.typeMismatches,
      missingInRecord: missingInRecord ?? this.missingInRecord,
      missingInSchema: missingInSchema ?? this.missingInSchema,
      isValid: isValid ?? this.isValid,
    );
  }
}

void testAnalysisResult(ExpectedResult expectedResult, RecordAnalysis recordAnalysis) {
  expect(
    recordAnalysis.hasReqPositionalParams,
    expectedResult.hasPositionalParams,
    reason:
        "Expected hasReqPositionalParams to be '${expectedResult.hasPositionalParams}', "
        "but got '${recordAnalysis.hasReqPositionalParams}'.",
  );

  expect(
    recordAnalysis.hasOptPositionalParams,
    isFalse,
    reason:
        'Expected hasOptPositionalParams to be false, '
        "but got '${recordAnalysis.hasOptPositionalParams}'.",
  );

  expect(
    recordAnalysis.isValid,
    expectedResult.isValid,
    reason:
        "Expected isValid to be '${expectedResult.isValid}', "
        "but got '${recordAnalysis.isValid}'.",
  );

  expect(recordAnalysis.missingInEntity, unorderedEquals(expectedResult.missingInRecord));
  expect(recordAnalysis.missingInSchema, unorderedEquals(expectedResult.missingInSchema));
  expect(recordAnalysis.typeMismatches, equals(expectedResult.typeMismatches));
}

const ExpectedResult defaultExpectedResult = (
  hasPositionalParams: false,
  typeMismatches: {},
  missingInRecord: {},
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

const defaultRecord = Record(
  namedFields: {},
  positionalFields: [],
);
