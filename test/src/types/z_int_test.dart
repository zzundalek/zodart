import 'package:test/test.dart';
import 'package:zodart/zodart.dart';

import '../../test_helper.dart';

void main() {
  group('parse', () {
    group('strict', () {
      final baseValidInputs = <ValidInput>[
        (input: -1, expected: -1),
        (input: 0, expected: 0),
        (input: 2, expected: 2),
      ];
      const baseInvalidInputs = <InvalidInput>[
        (input: '0', expected: [ZIssueParseFail(from: String, to: int, val: '0')]),
        (input: 1.1, expected: [ZIssueParseFail(from: double, to: int, val: 1.1)]),
        (input: emptyObject, expected: [ZIssueParseFail(from: Object, to: int, val: emptyObject)]),
      ];

      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: [
              ...baseInvalidInputs,
              (input: null, expected: const [ZIssueParseFail(from: Null, to: int, val: null)]),
            ],
          ),
          ZInt(),
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
          ZInt().nullable(),
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
          ZInt().optional(),
        );
      });
    });
  });

  group('min', () {
    const min = 10;
    final baseValidInputs = <ValidInput>[
      (input: 10, expected: 10),
      (input: 11, expected: 11),
      (input: 999, expected: 999),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: 9, expected: [ZIssueMinNotMet(min: min, val: 9)]),
      (input: 0, expected: [ZIssueMinNotMet(min: min, val: 0)]),
      (input: -10, expected: [ZIssueMinNotMet(min: min, val: -10)]),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZInt().min(min),
      );
    });
    group('nullable first', () {
      testInputs(
        (
          validInputs: [
            ...baseValidInputs,
            (input: null, expected: null),
          ],
          invalidInputs: baseInvalidInputs,
        ),
        ZInt().nullable().min(min),
      );
    });
    group('nullable last', () {
      testInputs(
        (
          validInputs: [
            ...baseValidInputs,
            (input: null, expected: null),
          ],
          invalidInputs: baseInvalidInputs,
        ),
        ZInt().min(min).nullable(),
      );
    });
  });
  group('max', () {
    const max = 10;
    final baseValidInputs = <ValidInput>[
      (input: 9, expected: 9),
      (input: 0, expected: 0),
      (input: -1, expected: -1),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: 11, expected: [ZIssueMaxExceeded(max: max, val: 11)]),
      (input: 12, expected: [ZIssueMaxExceeded(max: max, val: 12)]),
      (input: 999, expected: [ZIssueMaxExceeded(max: max, val: 999)]),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZInt().max(max),
      );
    });
    group('nullable first', () {
      testInputs(
        (
          validInputs: [
            ...baseValidInputs,
            (input: null, expected: null),
          ],
          invalidInputs: baseInvalidInputs,
        ),
        ZInt().nullable().max(max),
      );
    });
    group('nullable last', () {
      testInputs(
        (
          validInputs: [
            ...baseValidInputs,
            (input: null, expected: null),
          ],
          invalidInputs: baseInvalidInputs,
        ),
        ZInt().max(max).nullable(),
      );
    });
  });
}
