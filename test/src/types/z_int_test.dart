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
      group('nullable -> optional', () {
        testInputs(
          (
            validInputs: [
              ...baseValidInputs,
              (input: null, expected: null),
            ],
            invalidInputs: baseInvalidInputs,
          ),
          ZInt().nullable().optional(),
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

  group('toDouble', () {
    final baseValidInputs = <ValidInput>[
      (input: -1, expected: -1.0),
      (input: 0, expected: 0.0),
      (input: 9, expected: 9.0),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: [],
        ),
        ZInt().toDouble(),
      );
    });
    group('nullable first', () {
      testInputs(
        (
          validInputs: [
            ...baseValidInputs,
            (input: null, expected: null),
          ],
          invalidInputs: [],
        ),
        ZInt().nullable().toDouble(),
      );
    });
    group('nullable last', () {
      testInputs(
        (
          validInputs: [
            ...baseValidInputs,
            (input: null, expected: null),
          ],
          invalidInputs: [],
        ),
        ZInt().toDouble().nullable(),
      );
    });
  });

  group('toStr', () {
    String toUSD(int val) => '\$$val';
    final baseValidInputs = <ValidInput>[
      (input: 9, expected: r'$9'),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: [],
        ),
        ZInt().toStr(toUSD),
      );
    });
    group('nullable first', () {
      testInputs(
        (
          validInputs: [
            ...baseValidInputs,
            (input: null, expected: null),
          ],
          invalidInputs: [],
        ),
        ZInt().nullable().toStr(toUSD),
      );
    });
    group('nullable last', () {
      testInputs(
        (
          validInputs: [
            ...baseValidInputs,
            (input: null, expected: null),
          ],
          invalidInputs: [],
        ),
        ZInt().toStr(toUSD).nullable(),
      );
    });
  });

  group('refine', () {
    bool refinePositive(int val) => val > 0;

    const baseValidInputs = <ValidInput>[
      (input: 1, expected: 1),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: -1, expected: [ZIssue.custom()]),
    ];

    group('refine does pass', () {
      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: baseInvalidInputs,
          ),
          ZInt().refine(refinePositive),
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
          ZInt().nullable().refine(refinePositive),
        );
      });
    });
    group('test the ZIssueCustom properties when the refiner does not pass ', () {
      test('when nothing passed, returns plain ZIssueCustom', () {
        expect(ZInt().refine(refinePositive).parse(-1).rawIssues, equals(const [ZIssueCustom()]));
      });
      test('when a message is passed, returns ZIssueCustom with the message', () {
        expect(
          ZInt().refine(refinePositive, message: 'Value is negative').parse(-1).rawIssues,
          equals(const [ZIssueCustom(message: 'Value is negative')]),
        );
      });
      test('when a code is passed, returns ZIssueCustom with the code', () {
        expect(
          ZInt().refine(refinePositive, code: '001').parse(-1).rawIssues,
          equals(const [ZIssueCustom(code: '001')]),
        );
      });
      test('when a code and message is passed, returns ZIssueCustom with the code and the message', () {
        expect(
          ZInt().refine(refinePositive, message: 'Value is negative', code: '001').parse(-1).rawIssues,
          equals(const [ZIssueCustom(message: 'Value is negative', code: '001')]),
        );
      });
    });
  });

  group('superRefine', () {
    SuperRefinerErrorRes? refinePositive(int val) => val <= 0 ? (const ZIssueCustom(), others: []) : null;

    const baseValidInputs = <ValidInput>[
      (input: 1, expected: 1),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: -1, expected: [ZIssue.custom()]),
    ];
    group('superRefine does pass', () {
      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: baseInvalidInputs,
          ),
          ZInt().superRefine(refinePositive),
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
          ZInt().nullable().superRefine(refinePositive),
        );
      });
    });
    group('test result when the refiner does not pass ', () {
      test('returns one issue passed from super refiner', () {
        expect(ZInt().superRefine(refinePositive).parse(-1).rawIssues, equals(const [ZIssueCustom()]));
      });
      test('returns multiple issues passed from super refiner', () {
        SuperRefinerErrorRes? refinePositiveMultiple(int val) =>
            val <= 0 ? (const ZIssueCustom(message: 'first'), others: const [ZIssueCustom(message: 'second')]) : null;

        expect(
          ZInt().superRefine(refinePositiveMultiple).parse(-1).rawIssues,
          equals(const [
            ZIssueCustom(message: 'first'),
            ZIssueCustom(message: 'second'),
          ]),
        );
      });
    });
  });

  group('process', () {
    int processor(int val) => val + 10;

    test('required', () {
      final res = ZInt().process(processor).parse(1);

      expect(res.value, 11);
    });
    group('nullable before process', () {
      test('with a not null value', () {
        final res = ZInt().nullable().process(processor).parse(1);

        expect(res.value, 11);
      });
      test('value is null', () {
        final res = ZInt().nullable().process(processor).parse(null);

        expect(res.value, isNull);
      });
    });
    group('nullable after process', () {
      test('with a not null value', () {
        final res = ZInt().process(processor).nullable().parse(1);

        expect(res.value, 11);
      });
      test('value is null', () {
        final res = ZInt().process(processor).nullable().parse(null);

        expect(res.value, isNull);
      });
    });
  });
}
