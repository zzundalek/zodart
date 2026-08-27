import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:zodart/zodart.dart';

import '../../test_helper.dart';

/// Used for testing
enum Color { red, green, blue }

enum DifferentEnum { red, green, blue }

enum EnhancedColor {
  red('RED'),
  green('GREEN'),
  blue('BLUE');

  const EnhancedColor(this.code);

  final String code;
}

EnhancedColor? parseColor(Object? val) => switch (val) {
  final EnhancedColor color => color,
  final String code => EnhancedColor.values.firstWhereOrNull((color) => color.code == code),
  _ => null,
};

void main() {
  group('parse', () {
    group('simple', () {
      final simpleEnumSchema = ZEnum.simple(enumValues: Color.values);
      final baseValidInputs = <ValidInput>[
        (input: Color.red, expected: Color.red),
        (input: Color.green, expected: Color.green),
        (input: 'red', expected: Color.red),
        (input: 'blue', expected: Color.blue),
      ];
      const baseInvalidInputs = <InvalidInput>[
        (input: DifferentEnum.red, expected: [ZIssueParseFail(from: DifferentEnum, to: Color, val: DifferentEnum.red)]),
        (input: 'invalidColor', expected: [ZIssueParseFail(from: String, to: Color, val: 'invalidColor')]),
      ];

      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: [
              ...baseInvalidInputs,
              (input: null, expected: const [ZIssueRequired()]),
            ],
          ),
          simpleEnumSchema,
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
          simpleEnumSchema.nullable(),
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
          simpleEnumSchema.optional(),
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
          simpleEnumSchema.nullable().optional(),
        );
      });
    });

    group('withCustomParser', () {
      final simpleEnumSchema = ZEnum.withCustomParser(parseColor);
      final baseValidInputs = <ValidInput>[
        (input: EnhancedColor.red, expected: EnhancedColor.red),
        (input: EnhancedColor.green, expected: EnhancedColor.green),
        (input: 'RED', expected: EnhancedColor.red),
        (input: 'BLUE', expected: EnhancedColor.blue),
      ];
      const baseInvalidInputs = <InvalidInput>[
        (
          input: DifferentEnum.red,
          expected: [ZIssueParseFail(from: DifferentEnum, to: EnhancedColor, val: DifferentEnum.red)],
        ),
        (
          input: 'invalidEnhancedColor',
          expected: [ZIssueParseFail(from: String, to: EnhancedColor, val: 'invalidEnhancedColor')],
        ),
      ];

      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: [
              ...baseInvalidInputs,
              (input: null, expected: const [ZIssueParseFail(from: Null, to: EnhancedColor, val: null)]),
            ],
          ),
          simpleEnumSchema,
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
          simpleEnumSchema.nullable(),
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
          simpleEnumSchema.optional(),
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
          simpleEnumSchema.nullable().optional(),
        );
      });
    });
  });

  group('refine', () {
    final simpleEnumSchema = ZEnum.simple(enumValues: Color.values);
    bool refineIsBlue(Color val) => val == Color.blue;

    const baseValidInputs = <ValidInput>[
      (input: 'blue', expected: Color.blue),
      (input: Color.blue, expected: Color.blue),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: Color.red, expected: [ZIssue.custom()]),
      (input: 'red', expected: [ZIssue.custom()]),
    ];

    group('refine does pass', () {
      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: baseInvalidInputs,
          ),
          simpleEnumSchema.refine(refineIsBlue),
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
          simpleEnumSchema.nullable().refine(refineIsBlue),
        );
      });
    });
    group('test the ZIssueCustom properties when the refiner does not pass ', () {
      test('when nothing passed, returns plain ZIssueCustom', () {
        expect(simpleEnumSchema.refine(refineIsBlue).parse(Color.red).rawIssues, equals(const [ZIssueCustom()]));
      });
      test('when a message is passed, returns ZIssueCustom with the message', () {
        expect(
          simpleEnumSchema.refine(refineIsBlue, message: 'The color should be blue').parse(Color.red).rawIssues,
          equals(const [ZIssueCustom(message: 'The color should be blue')]),
        );
      });
      test('when a code is passed, returns ZIssueCustom with the code', () {
        expect(
          simpleEnumSchema.refine(refineIsBlue, code: '001').parse(Color.red).rawIssues,
          equals(const [ZIssueCustom(code: '001')]),
        );
      });
      test('when a code and message is passed, returns ZIssueCustom with the code and the message', () {
        expect(
          simpleEnumSchema
              .refine(refineIsBlue, message: 'The color should be blue', code: '001')
              .parse(Color.red)
              .rawIssues,
          equals(const [ZIssueCustom(message: 'The color should be blue', code: '001')]),
        );
      });
    });
  });

  group('superRefine', () {
    final simpleEnumSchema = ZEnum.simple(enumValues: Color.values);

    SuperRefinerErrorRes? refineIsBlueSingle(Color val) =>
        val != Color.blue ? (const ZIssueCustom(), others: []) : null;

    const baseValidInputs = <ValidInput>[
      (input: 'blue', expected: Color.blue),
      (input: Color.blue, expected: Color.blue),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: Color.red, expected: [ZIssue.custom()]),
      (input: 'red', expected: [ZIssue.custom()]),
    ];
    group('superRefine does pass', () {
      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: baseInvalidInputs,
          ),
          simpleEnumSchema.superRefine(refineIsBlueSingle),
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
          simpleEnumSchema.nullable().superRefine(refineIsBlueSingle),
        );
      });
    });
    group('test result when the refiner does not pass ', () {
      test('returns one issue passed from super refiner', () {
        expect(
          simpleEnumSchema.superRefine(refineIsBlueSingle).parse(Color.red).rawIssues,
          equals(const [ZIssueCustom()]),
        );
      });
      test('returns multiple issues passed from super refiner', () {
        SuperRefinerErrorRes? refineIsBlueMultiple(Color val) => val != Color.blue
            ? (const ZIssueCustom(message: 'first'), others: const [ZIssueCustom(message: 'second')])
            : null;

        expect(
          simpleEnumSchema.superRefine(refineIsBlueMultiple).parse(Color.red).rawIssues,
          equals(const [
            ZIssueCustom(message: 'first'),
            ZIssueCustom(message: 'second'),
          ]),
        );
      });
    });
  });

  group('process', () {
    final simpleEnumSchema = ZEnum.simple(enumValues: Color.values);

    /// Swap blue and red colors
    Color processor(Color val) => switch (val) {
      Color.blue => Color.red,
      Color.red => Color.blue,
      _ => val,
    };

    test('required', () {
      final res = simpleEnumSchema.process(processor).parse(Color.red);

      expect(res.value, Color.blue);
    });
    group('nullable before process', () {
      test('with a not null value', () {
        final res = simpleEnumSchema.nullable().process(processor).parse(Color.red);

        expect(res.value, Color.blue);
      });
      test('value is null', () {
        final res = simpleEnumSchema.nullable().process(processor).parse(null);

        expect(res.value, isNull);
      });
    });
    group('nullable after process', () {
      test('with a not null value', () {
        final res = simpleEnumSchema.process(processor).nullable().parse(Color.red);

        expect(res.value, Color.blue);
      });
      test('value is null', () {
        final res = simpleEnumSchema.process(processor).nullable().parse(null);

        expect(res.value, isNull);
      });
    });
  });

  group('onNull', () {
    final simpleEnumSchema = ZEnum.simple(enumValues: Color.values);

    Color onNullaFallback() => Color.green;
    final validInputs = [
      (input: 'blue', expected: Color.blue),
      (input: Color.blue, expected: Color.blue),
      (input: null, expected: Color.green),
    ];
    group('nullable', () {
      testInputs(
        (
          validInputs: validInputs,
          invalidInputs: [],
        ),
        simpleEnumSchema.nullable().onNull(onNullaFallback),
      );
    });
    group('optional', () {
      testInputs(
        (
          validInputs: validInputs,
          invalidInputs: [],
        ),
        simpleEnumSchema.optional().onNull(onNullaFallback),
      );
    });
  });
}
