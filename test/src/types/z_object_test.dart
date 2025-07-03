import 'package:test/test.dart';
import 'package:zodart/zodart.dart';

import '../../test_helper.dart';

TestObject testObjectMapper(Map<String, dynamic> val) => TestObject(
  reqStr: val['reqStr'] as String,
  reqInt: val['reqInt'] as int,
  nullableStr: val['nullableStr'] as String?,
  nullableInt: val['nullableInt'] as int?,
  optionalStr: val['optionalStr'] as String?,
  optionalInt: val['optionalInt'] as int?,
);

ZSchema schema = {
  'reqStr': ZString(),
  'reqInt': ZInt(),
  'nullableStr': ZString().nullable(),
  'nullableInt': ZInt().nullable(),
  'optionalStr': ZString().optional(),
  'optionalInt': ZInt().optional(),
};

void main() {
  group('parse', () {
    group('strict', () {
      final baseValidInputs = <ValidInput>[
        (
          input: {
            'reqStr': 'string',
            'reqInt': -1,
            'nullableStr': 'nullable Str value',
            'nullableInt': 0,
            'optionalStr': 'optional Str value',
            'optionalInt': 1,
          },
          expected: const TestObject(
            reqStr: 'string',
            reqInt: -1,
            nullableStr: 'nullable Str value',
            nullableInt: 0,
            optionalStr: 'optional Str value',
            optionalInt: 1,
          ),
        ),
        (
          input: {
            'reqStr': 'string',
            'reqInt': -1,
            'nullableStr': null,
            'nullableInt': null,
            'optionalStr': null,
            'optionalInt': null,
          },
          expected: const TestObject(
            reqStr: 'string',
            reqInt: -1,
          ),
        ),
        (
          input: {
            'reqStr': 'string',
            'reqInt': -1,
            'nullableStr': null,
            'nullableInt': null,
          },
          expected: const TestObject(
            reqStr: 'string',
            reqInt: -1,
          ),
        ),
      ];
      final baseInvalidInputs = <InvalidInput>[
        (
          input: {
            'reqStr': 'string',
            'reqInt': null,
            'nullableStr': null,
            'nullableInt': null,
          },
          expected: [
            ZIssueParseFail(
              from: Null,
              to: int,
              val: null,
              rawPath: ZPath.property('reqInt'),
            ),
          ],
        ),
        (
          input: emptyObject,
          expected: [
            ZIssueParseFail(
              from: Object,
              to: TestObject,
              val: emptyObject,
              rawPath: ZPath.property(''),
            ),
          ],
        ),
        (
          input: <String, dynamic>{},
          expected: [
            ZIssueMissingValue(rawPath: ZPath.property('reqStr')),
            ZIssueMissingValue(rawPath: ZPath.property('reqInt')),
            ZIssueMissingValue(rawPath: ZPath.property('nullableStr')),
            ZIssueMissingValue(rawPath: ZPath.property('nullableInt')),
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
                expected: const [ZIssueParseFail(from: Null, to: TestObject, val: null)],
              ),
            ],
          ),
          ZObject<TestObject>.withMapper(schema, fromJson: testObjectMapper),
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
          ZObject<TestObject>.withMapper(schema, fromJson: testObjectMapper).nullable(),
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
          ZObject<TestObject>.withMapper(schema, fromJson: testObjectMapper).optional(),
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
          ZObject<TestObject>.withMapper(schema, fromJson: testObjectMapper).nullable().optional(),
        );
      });
    });
  });

  group('refine', () {
    bool refineFromLowerThanTo((int, int) val) => val.$1 <= val.$2;
    (int, int) fromJson(Map<String, dynamic> val) => (val['from'], val['to']);
    final schema = {'from': ZInt(), 'to': ZInt()};

    const invalidValue = {'from': 10, 'to': 1};

    final zObj = ZObject<(int, int)>.withMapper(schema, fromJson: fromJson);

    const baseValidInputs = <ValidInput>[
      (input: {'from': 0, 'to': 1}, expected: (0, 1)),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: {'from': 90, 'to': 1}, expected: [ZIssue.custom()]),
    ];

    group('refine does pass', () {
      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: baseInvalidInputs,
          ),
          zObj.refine(refineFromLowerThanTo),
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
          zObj.nullable().refine(refineFromLowerThanTo),
        );
      });
    });
    group('test the ZIssueCustom properties when the refiner does not pass ', () {
      test('when nothing passed, returns plain ZIssueCustom', () {
        expect(
          zObj.refine(refineFromLowerThanTo).parse(invalidValue).rawIssues,
          equals(const [ZIssueCustom()]),
        );
      });
      test('when a message is passed, returns ZIssueCustom with the message', () {
        expect(
          zObj.refine(refineFromLowerThanTo, message: 'From is greater than To').parse(invalidValue).rawIssues,
          equals(const [ZIssueCustom(message: 'From is greater than To')]),
        );
      });
      test('when a code is passed, returns ZIssueCustom with the code', () {
        expect(
          zObj.refine(refineFromLowerThanTo, code: '001').parse(invalidValue).rawIssues,
          equals(const [ZIssueCustom(code: '001')]),
        );
      });
      test('when a code and message is passed, returns ZIssueCustom with the code and the message', () {
        expect(
          zObj
              .refine(refineFromLowerThanTo, message: 'From is greater than To', code: '001')
              .parse(invalidValue)
              .rawIssues,
          equals(const [ZIssueCustom(message: 'From is greater than To', code: '001')]),
        );
      });
    });
  });

  group('superRefine', () {
    SuperRefinerErrorRes? refineFromLowerThanTo((int, int) val) =>
        val.$1 > val.$2 ? (const ZIssueCustom(), others: []) : null;

    (int, int) fromJson(Map<String, dynamic> val) => (val['from'], val['to']);
    final schema = {'from': ZInt(), 'to': ZInt()};

    const invalidValue = {'from': 10, 'to': 1};

    final zObj = ZObject<(int, int)>.withMapper(schema, fromJson: fromJson);

    const baseValidInputs = <ValidInput>[
      (input: {'from': 0, 'to': 1}, expected: (0, 1)),
    ];
    const baseInvalidInputs = <InvalidInput>[
      (input: {'from': 90, 'to': 1}, expected: [ZIssue.custom()]),
    ];

    group('superRefine does pass', () {
      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: baseInvalidInputs,
          ),
          zObj.superRefine(refineFromLowerThanTo),
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
          zObj.nullable().superRefine(refineFromLowerThanTo),
        );
      });
    });
    group('test result when the refiner does not pass ', () {
      test('returns one issue passed from super refiner', () {
        expect(zObj.superRefine(refineFromLowerThanTo).parse(invalidValue).rawIssues, equals(const [ZIssueCustom()]));
      });
      test('returns multiple issues passed from super refiner', () {
        SuperRefinerErrorRes? refineFromLowerThanToMultiple((int, int) val) => val.$1 > val.$2
            ? (const ZIssueCustom(message: 'first'), others: const [ZIssueCustom(message: 'second')])
            : null;

        expect(
          zObj.superRefine(refineFromLowerThanToMultiple).parse(invalidValue).rawIssues,
          equals(const [
            ZIssueCustom(message: 'first'),
            ZIssueCustom(message: 'second'),
          ]),
        );
      });
    });
  });
}
