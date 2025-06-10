import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test/test.dart';
import 'package:zodart/zodart.dart';

part 'test_helper.freezed.dart';

typedef InputTests = ({List<ValidInput> validInputs, List<InvalidInput> invalidInputs});
typedef ValidInput = ({dynamic input, dynamic expected});
typedef InvalidInput = ({dynamic input, ZIssues expected});

/// Object to use in tests (== as identity)
const emptyObject = Object();

/// Object used for testing with overidden identity, hash and toString functions.
@freezed
abstract class TestObject with _$TestObject {
  const factory TestObject({
    required String reqStr,
    required int reqInt,
    String? nullableStr,
    int? nullableInt,
    String? optionalStr,
    int? optionalInt,
  }) = _TestObject;
}

void testSuccess<T>(dynamic val, T expectedValue) {
  expect(val, isA<T>(), reason: 'Expected the value to be a type $T but it was a ${val.runtimeType}.');
  expect(val, equals(expectedValue));
}

void testErrorMultiple(ZIssues issues, ZIssues expectedIssues) {
  if (expectedIssues.length != issues.length) {
    throw TestFailure(
      'Expected ${expectedIssues.length} issues but got ${issues.length}.\n'
      'Expected: $expectedIssues\nActual: $issues',
    );
  }

  for (final MapEntry(:key, :value) in expectedIssues.asMap().entries) {
    final expectedIssue = value;
    final index = key;
    final e = issues[index];
    expect(
      e.runtimeType,
      expectedIssue.runtimeType,
      reason: 'Expected the issue at $index to be a type ${e.runtimeType} , but it was a ${expectedIssue.runtimeType}.',
    );
    compareIssues(e, expectedIssue);
  }
}

/// Compares two [ZIssue] instances: [e] and [expectedIssue].
/// Performs a deep comparison omitting [ZIssueParseFail.throwable] if the type is [ZIssueParseFail],
/// otherwise falls back to `==`.
void compareIssues(ZIssue e, ZIssue expectedIssue) {
  if (e is ZIssueParseFail && expectedIssue is ZIssueParseFail) {
    expect(
      e,
      predicate<ZIssueParseFail>(
        (p) => p.from == expectedIssue.from && p.to == expectedIssue.to && p.val == expectedIssue.val,
        'ZIssueParseFail with from=${expectedIssue.from}, to=${expectedIssue.to}, val=${expectedIssue.val}',
      ),
    );
  } else {
    expect(e, equals(expectedIssue));
  }
}

/// Runs a group of tests to validate successful parsing of inputs.
///
/// Takes a [List] of [ValidInput]s where each item is a record of [ValidInput]
/// containing the input and the expected parsed result. Applies the `schema`
/// to each input and verifies that parsing succeeds with the expected result.
void testValidInputs(List<ValidInput> validInputs, ZBase<dynamic> schema) {
  for (final (:input, :expected) in validInputs) {
    test('Test a success. Input: "$input", expected: "$expected"', () {
      schema.parse(input).match(
            (_) => throw TestFailure('Expected the result to be a success, but it was an error.'),
            (val) => testSuccess(val, expected),
          );
    });
  }
}

/// Runs a group of tests to validate error parsing of inputs.
///
/// Takes a [List] of [InvalidInput]s where each item is a record of [InvalidInput]
/// containing the input and the expected parsed result. Applies the `schema`
/// to each input and verifies that parsing error with the expected result.
void testInvalidInputs(List<InvalidInput> invalidInputs, ZBase<dynamic> schema) {
  for (final (:input, :expected) in invalidInputs) {
    test('Test an error. Input: "$input", expected: "$expected"', () {
      schema.parse(input).match(
            (issues) => testErrorMultiple(issues, expected),
            (_) => throw TestFailure('Expected the result to be an error, but it was a success.'),
          );
    });
  }
}

void testInputs(InputTests inputs, ZBase<dynamic> schema) {
  testValidInputs(inputs.validInputs, schema);
  testInvalidInputs(inputs.invalidInputs, schema);
}
