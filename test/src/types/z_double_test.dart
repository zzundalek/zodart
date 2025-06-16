import 'package:test/test.dart';
import 'package:zodart/zodart.dart';

import '../../test_helper.dart';

void main() {
  group('parse', () {
    group('strict', () {
      final baseValidInputs = <ValidInput>[
        (input: -1.99, expected: -1.99),
        (input: -1.0, expected: -1.0),
        (input: 0.0, expected: 0.0),
        (input: 0.1, expected: 0.1),
        (input: 2.1, expected: 2.1),
      ];
      const baseInvalidInputs = <InvalidInput>[
        (input: '0', expected: [ZIssueParseFail(from: String, to: double, val: '0')]),
        (input: 1, expected: [ZIssueParseFail(from: int, to: double, val: 1)]),
        (input: emptyObject, expected: [ZIssueParseFail(from: Object, to: double, val: emptyObject)]),
      ];

      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: [
              ...baseInvalidInputs,
              (input: null, expected: const [ZIssueParseFail(from: Null, to: double, val: null)]),
            ],
          ),
          ZDouble(),
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
          ZDouble().nullable(),
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
          ZDouble().optional(),
        );
      });
    });
  });
  group('min', () {
    const min = 10.0;
    final baseValidInputs = <ValidInput>[
      (input: 10.0, expected: 10.0),
      (input: 11.0, expected: 11.0),
      (input: 999.0, expected: 999.0),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: 9.9, expected: [ZIssueMinNotMet(min: min, val: 9.9)]),
      (input: 0.9, expected: [ZIssueMinNotMet(min: min, val: 0.9)]),
      (input: -10.0, expected: [ZIssueMinNotMet(min: min, val: -10.0)]),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZDouble().min(min),
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
        ZDouble().nullable().min(min),
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
        ZDouble().min(min).nullable(),
      );
    });
  });
  group('max', () {
    const max = 10.0;
    final baseValidInputs = <ValidInput>[
      (input: 9.0, expected: 9.0),
      (input: 0.0, expected: 0.0),
      (input: -1.0, expected: -1.0),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: 11.0, expected: [ZIssueMaxExceeded(max: max, val: 11.0)]),
      (input: 12.0, expected: [ZIssueMaxExceeded(max: max, val: 12.0)]),
      (input: 999.0, expected: [ZIssueMaxExceeded(max: max, val: 999.0)]),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZDouble().max(max),
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
        ZDouble().nullable().max(max),
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
        ZDouble().max(max).nullable(),
      );
    });
  });

  group('refine', () {
    bool refinePositive(double val) => val > 0;

    const baseValidInputs = <ValidInput>[
      (input: 1.0, expected: 1.0),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: -1.0, expected: [ZIssue.custom()]),
    ];
    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZDouble().refine(refinePositive),
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
        ZDouble().nullable().refine(refinePositive),
      );
    });
    group('test the ZIssueCustom properties when the refiner does not pass ', () {
      test('when nothing passed, returns plain ZIssueCustom', () {
        expect(ZDouble().refine(refinePositive).parse(-1.0).rawIssues, equals(const [ZIssueCustom()]));
      });
      test('when a message is passed, returns ZIssueCustom with the message', () {
        expect(
          ZDouble().refine(refinePositive, message: 'Value is negative').parse(-1.0).rawIssues,
          equals(const [ZIssueCustom(message: 'Value is negative')]),
        );
      });
      test('when a code is passed, returns ZIssueCustom with the code', () {
        expect(
          ZDouble().refine(refinePositive, code: '001').parse(-1.0).rawIssues,
          equals(const [ZIssueCustom(code: '001')]),
        );
      });
      test('when a code and message is passed, returns ZIssueCustom with the code and the message', () {
        expect(
          ZDouble().refine(refinePositive, message: 'Value is negative', code: '001').parse(-1.0).rawIssues,
          equals(const [ZIssueCustom(message: 'Value is negative', code: '001')]),
        );
      });
    });
  });
}
