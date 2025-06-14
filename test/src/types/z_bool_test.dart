import 'package:test/test.dart';
import 'package:zodart/zodart.dart';

import '../../test_helper.dart';

void main() {
  group('parse', () {
    group('strict', () {
      final baseValidInputs = <ValidInput>[
        (input: true, expected: true),
        (input: false, expected: false),
      ];
      final baseInvalidInputs = <InvalidInput>[];

      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: [
              ...baseInvalidInputs,
              (input: null, expected: const [ZIssueParseFail(from: Null, to: bool, val: null)]),
            ],
          ),
          ZBool(),
        );
      });
      group('nullable', () {
        testInputs(
          (
            validInputs: [
              ...baseValidInputs,
              (input: null, expected: null),
            ],
            invalidInputs: baseInvalidInputs,
          ),
          ZBool().nullable(),
        );
      });
      group('optional', () {
        testInputs(
          (
            validInputs: [
              ...baseValidInputs,
              (input: null, expected: null),
            ],
            invalidInputs: baseInvalidInputs,
          ),
          ZBool().optional(),
        );
      });
    });
  });

  group('refine', () {
    // Easy format for test
    // ignore: avoid_positional_boolean_parameters
    bool refineTrue(bool val) => val;

    const baseValidInputs = <ValidInput>[
      (input: true, expected: true),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: false, expected: [ZIssue.custom()]),
    ];
    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZBool().refine(refineTrue),
      );
    });
    group('nullable', () {
      testInputs(
        (
          validInputs: [
            ...baseValidInputs,
            (input: null, expected: null),
          ],
          invalidInputs: baseInvalidInputs,
        ),
        ZBool().nullable().refine(refineTrue),
      );
    });
    group('test the ZIssueCustom properties when the refiner does not pass ', () {
      test('when nothing passed, returns plain ZIssueCustom', () {
        expect(ZBool().refine(refineTrue).parse(false).rawIssues, equals(const [ZIssueCustom()]));
      });
      test('when a message is passed, returns ZIssueCustom with the message', () {
        expect(
          ZBool().refine(refineTrue, message: 'Value is false').parse(false).rawIssues,
          equals(const [ZIssueCustom(message: 'Value is false')]),
        );
      });
      test('when a code is passed, returns ZIssueCustom with the code', () {
        expect(
          ZBool().refine(refineTrue, code: '001').parse(false).rawIssues,
          equals(const [ZIssueCustom(code: '001')]),
        );
      });
      test('when a code and message is passed, returns ZIssueCustom with the code and the message', () {
        expect(
          ZBool().refine(refineTrue, message: 'Value is false', code: '001').parse(false).rawIssues,
          equals(const [ZIssueCustom(message: 'Value is false', code: '001')]),
        );
      });
    });
  });
}
