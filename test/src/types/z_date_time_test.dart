import 'package:test/test.dart';
import 'package:zodart/zodart.dart';

import '../../test_helper.dart';

void main() {
  group('parse', () {
    group('strict', () {
      final baseValidInputs = <ValidInput>[
        (input: DateTime(2012, 2, 27), expected: DateTime(2012, 2, 27)),
        (input: DateTime(2016, 2, 27, 10, 30), expected: DateTime(2016, 2, 27, 10, 30)),
      ];
      const baseInvalidInputs = <InvalidInput>[
        (input: 'ZodArt', expected: [ZIssueParseFail(from: String, to: DateTime, val: 'ZodArt')]),
        (input: 1, expected: [ZIssueParseFail(from: int, to: DateTime, val: 1)]),
        (input: 1.1, expected: [ZIssueParseFail(from: double, to: DateTime, val: 1.1)]),
        (input: emptyObject, expected: [ZIssueParseFail(from: Object, to: DateTime, val: emptyObject)]),
      ];

      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: [
              ...baseInvalidInputs,
              (input: null, expected: const [ZIssueParseFail(from: Null, to: DateTime, val: null)]),
            ],
          ),
          ZDateTime(),
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
          ZDateTime().nullable(),
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
          ZDateTime().optional(),
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
          ZDateTime().nullable().optional(),
        );
      });
    });
  });
  group('min', () {
    final min = DateTime(2024, 3, 25);
    final baseValidInputs = <ValidInput>[
      (input: min, expected: min),
      (input: DateTime(2024, 3, 25, 0, 1), expected: DateTime(2024, 3, 25, 0, 1)),
      (input: DateTime.parse('2026-01-01'), expected: DateTime.parse('2026-01-01')),
    ];
    final baseInvalidInputs = <InvalidInput>[
      (
        input: DateTime(2024, 3, 24),
        expected: [ZIssueMinDateTimeNotMet(min: min, val: DateTime(2024, 3, 24))],
      ),
      (
        input: DateTime(2024, 3, 24, 23, 59),
        expected: [ZIssueMinDateTimeNotMet(min: min, val: DateTime(2024, 3, 24, 23, 59))],
      ),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZDateTime().min(min),
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
        ZDateTime().nullable().min(min),
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
        ZDateTime().min(min).nullable(),
      );
    });
  });

  group('max', () {
    final max = DateTime(2024, 3, 25);
    final baseValidInputs = <ValidInput>[
      (input: max, expected: max),
      (input: DateTime(2024, 3, 24, 23, 59), expected: DateTime(2024, 3, 24, 23, 59)),
      (input: DateTime.parse('2022-01-01'), expected: DateTime.parse('2022-01-01')),
    ];
    final baseInvalidInputs = <InvalidInput>[
      (
        input: DateTime(2024, 3, 26),
        expected: [ZIssueMaxDateTimeExceeded(max: max, val: DateTime(2024, 3, 26))],
      ),
      (
        input: DateTime(2024, 3, 25, 0, 1),
        expected: [ZIssueMaxDateTimeExceeded(max: max, val: DateTime(2024, 3, 25, 0, 1))],
      ),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZDateTime().max(max),
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
        ZDateTime().nullable().max(max),
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
        ZDateTime().max(max).nullable(),
      );
    });
  });

  group('refine', () {
    bool refineYear1993(DateTime val) => val.year == 1993;
    final year1984 = DateTime(1984);

    final baseValidInputs = <ValidInput>[
      (input: DateTime.parse('1993-01-01'), expected: DateTime(1993)),
    ];
    final baseInvalidInputs = <InvalidInput>[
      (input: DateTime.parse('1918-10-28'), expected: const [ZIssue.custom()]),
    ];

    group('refine does pass', () {
      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: baseInvalidInputs,
          ),
          ZDateTime().refine(refineYear1993),
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
          ZDateTime().nullable().refine(refineYear1993),
        );
      });
    });
    group('test the ZIssueCustom properties when the refiner does not pass ', () {
      test('when nothing passed, returns plain ZIssueCustom', () {
        expect(ZDateTime().refine(refineYear1993).parse(year1984).rawIssues, equals(const [ZIssueCustom()]));
      });
      test('when a message is passed, returns ZIssueCustom with the message', () {
        expect(
          ZDateTime().refine(refineYear1993, message: 'String is empty').parse(year1984).rawIssues,
          equals(const [ZIssueCustom(message: 'String is empty')]),
        );
      });
      test('when a code is passed, returns ZIssueCustom with the code', () {
        expect(
          ZDateTime().refine(refineYear1993, code: '001').parse(year1984).rawIssues,
          equals(const [ZIssueCustom(code: '001')]),
        );
      });
      test('when a code and message is passed, returns ZIssueCustom with the code and the message', () {
        expect(
          ZDateTime().refine(refineYear1993, message: 'String is empty', code: '001').parse(year1984).rawIssues,
          equals(const [ZIssueCustom(message: 'String is empty', code: '001')]),
        );
      });
    });
  });

  group('superRefine', () {
    SuperRefinerErrorRes? refineYear1993(DateTime val) => val.year != 1993 ? (const ZIssueCustom(), others: []) : null;

    final year1984 = DateTime(1984);

    final baseValidInputs = <ValidInput>[
      (input: DateTime.parse('1993-01-01'), expected: DateTime(1993)),
    ];
    final baseInvalidInputs = <InvalidInput>[
      (input: DateTime.parse('1918-10-28'), expected: const [ZIssue.custom()]),
    ];

    group('superRefine does pass', () {
      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: baseInvalidInputs,
          ),
          ZDateTime().superRefine(refineYear1993),
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
          ZDateTime().nullable().superRefine(refineYear1993),
        );
      });
    });
    group('test result when the refiner does not pass ', () {
      test('returns one issue passed from super refiner', () {
        expect(ZDateTime().superRefine(refineYear1993).parse(year1984).rawIssues, equals(const [ZIssueCustom()]));
      });
      test('returns multiple issues passed from super refiner', () {
        SuperRefinerErrorRes? refineYear1993Multiple(DateTime val) => val.year != 1993
            ? (const ZIssueCustom(message: 'first'), others: const [ZIssueCustom(message: 'second')])
            : null;

        expect(
          ZDateTime().superRefine(refineYear1993Multiple).parse(year1984).rawIssues,
          equals(const [
            ZIssueCustom(message: 'first'),
            ZIssueCustom(message: 'second'),
          ]),
        );
      });
    });
  });
}
