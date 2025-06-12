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
    });
  });
}
