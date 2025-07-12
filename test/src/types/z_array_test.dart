import 'package:test/test.dart';
import 'package:zodart/zodart.dart';

import '../../test_helper.dart';

void main() {
  group('parse', () {
    group('strict', () {
      final baseValidInputs = <ValidInput>[
        (
          input: ['String value'],
          expected: ['String value'],
        ),
      ];
      final baseInvalidInputs = <InvalidInput>[
        (
          input: [1, 'String value', -1.0, emptyObject],
          expected: [
            ZIssueParseFail(
              from: int,
              to: String,
              val: 1,
              rawPath: ZPath.index(0),
            ),
            ZIssueParseFail(
              from: double,
              to: String,
              val: -1.0,
              rawPath: ZPath.index(2),
            ),
            ZIssueParseFail(
              from: Object,
              to: String,
              val: emptyObject,
              rawPath: ZPath.index(3),
            ),
          ],
        ),
        (
          input: emptyObject,
          expected: const [
            ZIssueParseFail(
              from: Object,
              to: List<String>,
              val: emptyObject,
            ),
          ],
        ),
        (
          input: ['String value', 'String value2', null, 'String value 4'],
          expected: [
            const ZIssueParseFail(
              from: Null,
              to: String,
              val: null,
            ),
          ],
        ),
      ];

      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: [
              ...baseInvalidInputs,
              (
                input: null,
                expected: const [ZIssueParseFail(from: Null, to: List<String>, val: null)],
              ),
            ],
          ),
          ZArray(ZString()),
        );
      });
      group('nullable', () {
        testInputs(
          (
            validInputs: [
              ...baseValidInputs,
              (
                input: null,
                expected: null,
              ),
            ],
            invalidInputs: baseInvalidInputs,
          ),
          ZArray(ZString()).nullable(),
        );
      });
      group('optional', () {
        testInputs(
          (
            validInputs: [
              ...baseValidInputs,
              (
                input: null,
                expected: null,
              ),
            ],
            invalidInputs: baseInvalidInputs,
          ),
          ZArray(ZString()).optional(),
        );
      });
      group('nullable -> optional', () {
        testInputs(
          (
            validInputs: [
              ...baseValidInputs,
              (
                input: null,
                expected: null,
              ),
            ],
            invalidInputs: baseInvalidInputs,
          ),
          ZArray(ZString()).nullable().optional(),
        );
      });
    });
  });

  group('toStr', () {
    String toSumUSD(List<double> val) {
      final sum = val.fold<double>(0, (sum, curr) => sum + curr);
      return '\$${sum.toStringAsFixed(1)}';
    }

    final baseValidInputs = <ValidInput>[
      (input: [1.0, 20.1, 6.1, 0.0], expected: r'$27.2'),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: [],
        ),
        ZArray(ZDouble()).toStr(toSumUSD),
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
        ZArray(ZDouble()).nullable().toStr(toSumUSD),
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
        ZArray(ZDouble()).toStr(toSumUSD).nullable(),
      );
    });
  });

  group('refine', () {
    bool refineNotEmpty(List<dynamic> val) => val.isNotEmpty;

    const baseValidInputs = <ValidInput>[
      (input: ['I love ZodArt'], expected: ['I love ZodArt']),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: <String>[], expected: [ZIssue.custom()]),
    ];

    group('refine does pass', () {
      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: baseInvalidInputs,
          ),
          ZArray(ZString()).refine(refineNotEmpty),
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
          ZArray(ZString()).nullable().refine(refineNotEmpty),
        );
      });
    });
    group('test the ZIssueCustom properties when the refiner does not pass ', () {
      test('when nothing passed, returns plain ZIssueCustom', () {
        expect(ZArray(ZString()).refine(refineNotEmpty).parse([]).rawIssues, equals(const [ZIssueCustom()]));
      });
      test('when a message is passed, returns ZIssueCustom with the message', () {
        expect(
          ZArray(ZString()).refine(refineNotEmpty, message: 'The list is empty').parse([]).rawIssues,
          equals(const [ZIssueCustom(message: 'The list is empty')]),
        );
      });
      test('when a code is passed, returns ZIssueCustom with the code', () {
        expect(
          ZArray(ZString()).refine(refineNotEmpty, code: '001').parse([]).rawIssues,
          equals(const [ZIssueCustom(code: '001')]),
        );
      });
      test('when a code and message is passed, returns ZIssueCustom with the code and the message', () {
        expect(
          ZArray(ZString()).refine(refineNotEmpty, message: 'The list is empty', code: '001').parse([]).rawIssues,
          equals(const [ZIssueCustom(message: 'The list is empty', code: '001')]),
        );
      });
    });
  });

  group('superRefine', () {
    SuperRefinerErrorRes? refineNotEmpty(List<dynamic> val) => val.isEmpty ? (const ZIssueCustom(), others: []) : null;

    const baseValidInputs = <ValidInput>[
      (input: ['I love ZodArt'], expected: ['I love ZodArt']),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: <String>[], expected: [ZIssue.custom()]),
    ];
    group('superRefine does pass', () {
      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: baseInvalidInputs,
          ),
          ZArray(ZString()).superRefine(refineNotEmpty),
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
          ZArray(ZString()).nullable().superRefine(refineNotEmpty),
        );
      });
    });
    group('test result when the refiner does not pass ', () {
      test('returns one issue passed from super refiner', () {
        expect(ZArray(ZString()).superRefine(refineNotEmpty).parse([]).rawIssues, equals(const [ZIssueCustom()]));
      });
      test('returns multiple issues passed from super refiner', () {
        SuperRefinerErrorRes? refineNotEmptyMultiple(List<dynamic> val) => val.isEmpty
            ? (const ZIssueCustom(message: 'first'), others: const [ZIssueCustom(message: 'second')])
            : null;

        expect(
          ZArray(ZString()).superRefine(refineNotEmptyMultiple).parse([]).rawIssues,
          equals(const [
            ZIssueCustom(message: 'first'),
            ZIssueCustom(message: 'second'),
          ]),
        );
      });
    });
  });

  group('process', () {
    List<String> processor(List<String> values) {
      return [values.reversed.join()];
    }

    final zArray = ZArray(ZString());

    const input = ['dan', 'da', 'Dan'];
    const output = ['Dandadan'];

    test('required', () {
      final res = ZArray(ZString()).process(processor).parse(input);

      expect(res.value, output);
    });
    group('nullable before process', () {
      test('with a not null value', () {
        final res = zArray.nullable().process(processor).parse(input);

        expect(res.value, output);
      });
      test('value is null', () {
        final res = zArray.nullable().process(processor).parse(null);

        expect(res.value, isNull);
      });
    });
    group('nullable after process', () {
      test('with a not null value', () {
        final res = zArray.process(processor).nullable().parse(input);

        expect(res.value, output);
      });
      test('value is null', () {
        final res = zArray.process(processor).nullable().parse(null);

        expect(res.value, isNull);
      });
    });
  });
}
