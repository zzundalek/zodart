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
      group('nullable -> optional', () {
        testInputs(
          (
            validInputs: [
              ...baseValidInputs,
              (input: null, expected: null),
            ],
            invalidInputs: baseInvalidInputs,
          ),
          ZString().nullable().optional(),
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

  group('regex', () {
    const regex = 'Z[a-z]{2}A[a-z]{2}';
    final baseValidInputs = <ValidInput>[
      (input: 'I love ZodArt.', expected: 'I love ZodArt.'),
      (input: 'ZodArt makes my life easier', expected: 'ZodArt makes my life easier'),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: 'I like Dart.', expected: [ZIssueCustom()]),
      (input: 'I love zodart.', expected: [ZIssueCustom()]),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZString().regex(regex),
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
        ZString().nullable().regex(regex),
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
        ZString().regex(regex).nullable(),
      );
    });
    group('custom errors', () {
      final zStringWithCustomMessageAndCode = ZString().regex(regex, message: 'Custom error message', code: '01');
      final validValidInputs = <ValidInput>[
        (input: 'I love ZodArt.', expected: 'I love ZodArt.'),
      ];
      const invalidInputs = <InvalidInput>[
        (input: 'I like Dart.', expected: [ZIssueCustom(message: 'Custom error message', code: '01')]),
      ];
      group('required', () {
        testInputs(
          (
            validInputs: validValidInputs,
            invalidInputs: invalidInputs,
          ),
          zStringWithCustomMessageAndCode,
        );
      });
      group('nullable', () {
        testInputs(
          (
            validInputs: validValidInputs,
            invalidInputs: invalidInputs,
          ),
          zStringWithCustomMessageAndCode.nullable(),
        );
      });
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
  group('toLowerCase', () {
    final baseValidInputs = <ValidInput>[
      (input: '', expected: ''),
      (input: 'lower Case', expected: 'lower case'),
      (input: ' LOWER_CASE', expected: ' lower_case'),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: [],
        ),
        ZString().toLowerCase(),
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
        ZString().nullable().toLowerCase(),
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
        ZString().toLowerCase().nullable(),
      );
    });
  });
  group('toUpperCase', () {
    final baseValidInputs = <ValidInput>[
      (input: '', expected: ''),
      (input: 'upPer Case', expected: 'UPPER CASE'),
      (input: ' upper_case', expected: ' UPPER_CASE'),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: [],
        ),
        ZString().toUpperCase(),
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
        ZString().nullable().toUpperCase(),
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
        ZString().toUpperCase().nullable(),
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

  group('toDateTime', () {
    final baseValidInputs = <ValidInput>[
      (input: '2012-02-27', expected: DateTime(2012, 2, 27)),
      (input: '2012-02-27 13:27:00', expected: DateTime(2012, 2, 27, 13, 27)),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: '', expected: [ZIssueParseFail(from: String, to: DateTime, val: '')]),
      (input: 'abcd', expected: [ZIssueParseFail(from: String, to: DateTime, val: 'abcd')]),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: baseInvalidInputs,
        ),
        ZString().toDateTime(),
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
        ZString().nullable().toDateTime(),
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
        ZString().toDateTime().nullable(),
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

    group('refine does pass', () {
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

  group('superRefine', () {
    SuperRefinerErrorRes? refineNotEmptySingle(String val) => val.isEmpty ? (const ZIssueCustom(), others: []) : null;

    const baseValidInputs = <ValidInput>[
      (input: 'I love ZodArt', expected: 'I love ZodArt'),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: '', expected: [ZIssue.custom()]),
    ];
    group('superRefine does pass', () {
      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: baseInvalidInputs,
          ),
          ZString().superRefine(refineNotEmptySingle),
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
          ZString().nullable().superRefine(refineNotEmptySingle),
        );
      });
    });
    group('test result when the refiner does not pass ', () {
      test('returns one issue passed from super refiner', () {
        expect(ZString().superRefine(refineNotEmptySingle).parse('').rawIssues, equals(const [ZIssueCustom()]));
      });
      test('returns multiple issues passed from super refiner', () {
        SuperRefinerErrorRes? refineNotEmptyMultiple(String val) => val.isEmpty
            ? (const ZIssueCustom(message: 'first'), others: const [ZIssueCustom(message: 'second')])
            : null;

        expect(
          ZString().superRefine(refineNotEmptyMultiple).parse('').rawIssues,
          equals(const [
            ZIssueCustom(message: 'first'),
            ZIssueCustom(message: 'second'),
          ]),
        );
      });
    });
  });

  group('process', () {
    String processor(String val) => '${val}Art';

    test('required', () {
      final res = ZString().process(processor).parse('Zod');

      expect(res.value, 'ZodArt');
    });
    group('nullable before process', () {
      test('with a not null value', () {
        final res = ZString().nullable().process(processor).parse('Zod');

        expect(res.value, 'ZodArt');
      });
      test('value is null', () {
        final res = ZString().nullable().process(processor).parse(null);

        expect(res.value, isNull);
      });
    });
    group('nullable after process', () {
      test('with a not null value', () {
        final res = ZString().process(processor).nullable().parse('Zod');

        expect(res.value, 'ZodArt');
      });
      test('value is null', () {
        final res = ZString().process(processor).nullable().parse(null);

        expect(res.value, isNull);
      });
    });
  });

  group('onNull', () {
    String onNullaFallback() => 'default value';
    final validInputs = [
      (input: '', expected: ''),
      (input: 'some value', expected: 'some value'),
      (input: null, expected: 'default value'),
    ];
    group('nullable', () {
      testInputs(
        (
          validInputs: validInputs,
          invalidInputs: [],
        ),
        ZString().nullable().onNull(onNullaFallback),
      );
    });
    group('optional', () {
      testInputs(
        (
          validInputs: validInputs,
          invalidInputs: [],
        ),
        ZString().optional().onNull(onNullaFallback),
      );
    });
  });
}
