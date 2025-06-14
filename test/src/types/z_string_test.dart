import 'package:test/test.dart';
import 'package:zodart/zodart.dart';

import '../../test_helper.dart';

void main() {
  group('parse', () {
    group('strict', () {
      final baseValidInputs = <ValidInput>[
        (input: '-1', expected: '-1'),
        (input: '0', expected: '0'),
        (input: '2', expected: '2'),
        (input: 'some string', expected: 'some string'),
      ];
      const baseInvalidInputs = <InvalidInput>[
        (input: 1, expected: [ZIssueParseFail(from: int, to: String, val: 1)]),
        (input: 1.1, expected: [ZIssueParseFail(from: double, to: String, val: 1.1)]),
        (input: emptyObject, expected: [ZIssueParseFail(from: Object, to: String, val: emptyObject)]),
      ];

      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: [
              ...baseInvalidInputs,
              (input: null, expected: const [ZIssueParseFail(from: Null, to: String, val: null)]),
            ],
          ),
          ZString(),
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
          ZString().nullable(),
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
          ZString().optional(),
        );
      });
    });
  });
  group('min', () {
    const min = 10;
    const baseValidInputs = <ValidInput>[
      (input: 'ten__chars', expected: 'ten__chars'),
      (input: 'longer__str', expected: 'longer__str'),
      (input: 'extremely long string 3311', expected: 'extremely long string 3311'),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: '', expected: [ZIssueMinLengthNotMet(minLength: min, actualLength: 0)]),
      (input: '1', expected: [ZIssueMinLengthNotMet(minLength: min, actualLength: 1)]),
      (input: '123456789', expected: [ZIssueMinLengthNotMet(minLength: min, actualLength: 9)]),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZString().min(min),
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
        ZString().nullable().min(min),
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
        ZString().min(min).nullable(),
      );
    });
  });
  group('max', () {
    const max = 10;
    final baseValidInputs = <ValidInput>[
      (input: '', expected: ''),
      (input: '1', expected: '1'),
      (input: 'ten__chars', expected: 'ten__chars'),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: '12345678901', expected: [ZIssueMaxLengthExceeded(maxLength: max, actualLength: 11)]),
      (input: 'extremely long string 3311', expected: [ZIssueMaxLengthExceeded(maxLength: max, actualLength: 26)]),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZString().max(max),
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
        ZString().nullable().max(max),
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
        ZString().max(max).nullable(),
      );
    });
  });
  group('trim', () {
    final baseValidInputs = <ValidInput>[
      (input: '', expected: ''),
      (input: 'text before trim', expected: 'text before trim'),
      (input: '  text before trim', expected: 'text before trim'),
      (input: 'text before trim    ', expected: 'text before trim'),
      (input: '    text before trim    ', expected: 'text before trim'),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: [],
        ),
        ZString().trim(),
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
        ZString().nullable().trim(),
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
        ZString().trim().nullable(),
      );
    });
  });
  group('toInt', () {
    final baseValidInputs = <ValidInput>[
      (input: '-1', expected: -1),
      (input: '0', expected: 0),
      (input: '1', expected: 1),
      (input: '1000', expected: 1000),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: '', expected: [ZIssueParseFail(from: String, to: int, val: '')]),
      (input: '1.31', expected: [ZIssueParseFail(from: String, to: int, val: '1.31')]),
      (input: 'abcd', expected: [ZIssueParseFail(from: String, to: int, val: 'abcd')]),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZString().toInt(),
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
        ZString().nullable().toInt(),
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
        ZString().toInt().nullable(),
      );
    });
  });
  group('toDouble', () {
    final baseValidInputs = <ValidInput>[
      (input: '-1.1', expected: -1.1),
      (input: '-1', expected: -1),
      (input: '0.0', expected: 0.0),
      (input: '0', expected: 0.0),
      (input: '1.0', expected: 1.0),
      (input: '1', expected: 1.0),
      (input: '1000.0', expected: 1000.0),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: '', expected: [ZIssueParseFail(from: String, to: double, val: '')]),
      (input: 'abcd', expected: [ZIssueParseFail(from: String, to: double, val: 'abcd')]),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZString().toDouble(),
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
        ZString().nullable().toDouble(),
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
        ZString().toDouble().nullable(),
      );
    });
  });

  group('refine', () {
    bool refineNotEmpty(String val) => val.isNotEmpty;

    const baseValidInputs = <ValidInput>[
      (input: 'I love ZodArt', expected: 'I love ZodArt'),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: '', expected: [ZIssue.custom()]),
    ];
    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZString().refine(refineNotEmpty),
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
        ZString().nullable().refine(refineNotEmpty),
      );
    });
    group('test the ZIssueCustom properties when the refiner does not pass ', () {
      test('when nothing passed, returns plain ZIssueCustom', () {
        expect(ZString().refine(refineNotEmpty).parse('').rawIssues, equals(const [ZIssueCustom()]));
      });
      test('when a message is passed, returns ZIssueCustom with the message', () {
        expect(
          ZString().refine(refineNotEmpty, message: 'String is empty').parse('').rawIssues,
          equals(const [ZIssueCustom(message: 'String is empty')]),
        );
      });
      test('when a code is passed, returns ZIssueCustom with the code', () {
        expect(
          ZString().refine(refineNotEmpty, code: '001').parse('').rawIssues,
          equals(const [ZIssueCustom(code: '001')]),
        );
      });
      test('when a code and message is passed, returns ZIssueCustom with the code and the message', () {
        expect(
          ZString().refine(refineNotEmpty, message: 'String is empty', code: '001').parse('').rawIssues,
          equals(const [ZIssueCustom(message: 'String is empty', code: '001')]),
        );
      });
    });
  });
}
