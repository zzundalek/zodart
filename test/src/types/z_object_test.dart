import 'package:test/test.dart';
import 'package:zodart/src/base/cross_field_validation.dart' show FieldNotInSchemaAccessorException;
import 'package:zodart/src/base/zodart_exceptions.dart' show ZConsumerCausedException;
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

typedef SimpleRec = ({String val});

/// Helper class to test cross-field validation
class TypedFieldAccessor extends ParsedFieldAccessor {
  TypedFieldAccessor(super.schema, super.parsedValues);

  int get id => this['id'] as int;

  String get name => this['name'] as String;
}

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
            ZIssueRequired(
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
                expected: const [ZIssueRequired()],
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

  group('toObj', () {
    SimpleRec toNewObj(({double val}) val) => (val: val.val.toStringAsFixed(2));

    ({double val}) fromJson(Map<String, Object?> json) => (val: json['val']! as double);
    final schema = {'val': ZDouble()};

    final baseValidInputs = <ValidInput>[
      (input: {'val': 1.0}, expected: (val: '1.00')),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: [],
        ),
        ZObject<({double val})>.withMapper(schema, fromJson: fromJson).toObj(toNewObj),
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
        ZObject<({double val})>.withMapper(schema, fromJson: fromJson).nullable().toObj(toNewObj),
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
        ZObject<({double val})>.withMapper(schema, fromJson: fromJson).toObj(toNewObj).nullable(),
      );
    });
  });

  group('toStr', () {
    String toStr(SimpleRec val) => 'Hello ${val.val}!';
    final zObj = ZObject<SimpleRec>.withMapper(
      {'val': ZString()},
      fromJson: (v) => (
        val: v['val'],
      ),
    );
    final baseValidInputs = <ValidInput>[
      (
        input: {'val': 'ZodArt'},
        expected: 'Hello ZodArt!',
      ),
    ];

    group('required', () {
      testInputs(
        (
          validInputs: baseValidInputs,
          invalidInputs: [],
        ),
        zObj.toStr(toStr),
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
        zObj.nullable().toStr(toStr),
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
        zObj.toStr(toStr).nullable(),
      );
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

  group('process', () {
    SimpleRec processor(SimpleRec rec) => (val: '${rec.val}Art');
    final zObj = ZObject<SimpleRec>.withMapper(
      {'val': ZString()},
      fromJson: (v) => (
        val: v['val'],
      ),
    );

    const input = {'val': 'Zod'};

    const output = (
      val: 'ZodArt',
    );

    test('required', () {
      final res = zObj.process(processor).parse(input);

      expect(res.value, output);
    });
    group('nullable before process', () {
      test('with a not null value', () {
        final res = zObj.nullable().process(processor).parse(input);

        expect(res.value, output);
      });
      test('value is null', () {
        final res = zObj.nullable().process(processor).parse(null);

        expect(res.value, isNull);
      });
    });
    group('nullable after process', () {
      test('with a not null value', () {
        final res = zObj.process(processor).nullable().parse(input);

        expect(res.value, output);
      });
      test('value is null', () {
        final res = zObj.process(processor).nullable().parse(null);

        expect(res.value, isNull);
      });
    });
  });

  group('onNull', () {
    SimpleRec onNullaFallback() => (val: 'default value');
    final validInputs = [
      (input: {'val': 'some value'}, expected: (val: 'some value')),
      (input: null, expected: (val: 'default value')),
    ];

    final zObj = ZObject<SimpleRec>.withMapper(
      {
        'val': ZString(),
      },
      fromJson: (json) => (val: json['val']),
    );

    group('nullable', () {
      testInputs(
        (
          validInputs: validInputs,
          invalidInputs: [],
        ),
        zObj.nullable().onNull(onNullaFallback),
      );
    });
    group('optional', () {
      testInputs(
        (
          validInputs: validInputs,
          invalidInputs: [],
        ),
        zObj.optional().onNull(onNullaFallback),
      );
    });
  });

  group('Cross-field validation', () {
    final zIssue1 = ZIssue.custom(message: 'issue1', rawPath: ZPath.property('id'));

    ({int id, String name}) fromJson(Map<String, dynamic> json) => (id: json['id'], name: json['name']);

    final schema = <String, ZBase<dynamic>>{'id': ZInt().min(1), 'name': ZString().min(1)};

    test('Throws FieldNotInSchemaAccessorException when accessing a field not in schema', () {
      SuperRefinerErrorRes? invalidFieldAccessValidator(ParsedFieldAccessor fieldValues) =>
          (fieldValues['dummy'] as int) < 10 ? null : (zIssue1, others: []);

      final zObject = ZObject.withMapper(
        schema,
        fromJson: fromJson,
        crossValidators: [invalidFieldAccessValidator],
      );

      expect(
        () => zObject.parse({'id': 100, 'name': ''}),
        throwsA(
          isA<FieldNotInSchemaAccessorException>()
              .having((e) => e.fieldName, 'Field name', 'dummy')
              .having((e) => e.schemaFieldNames, 'Schema field names', equals(['id', 'name']))
              .having((e) => e, 'Exception extends ZConsumerCausedException', isA<ZConsumerCausedException>()),
        ),
      );
    });

    group('withMapper', () {
      SuperRefinerErrorRes? isIdLowerThan10(ParsedFieldAccessor fieldValues) =>
          (fieldValues['id'] as int) < 10 ? null : (zIssue1, others: []);

      test('parsing with cross validation returns issues for the field with issues for other fields', () {
        final res = ZObject.withMapper(
          schema,
          fromJson: fromJson,
          crossValidators: [isIdLowerThan10],
        ).parse({'id': 100, 'name': ''});

        expect(res.rawIssues, isA<List<ZIssue>>().having((issues) => issues.length, 'Number of issues', 2));
        expect(res.getRawIssuesFor('id'), equals([zIssue1]));
      });

      test('if the field used in the cross-validator is not parsed properly that issue is returned instead', () {
        final res = ZObject.withMapper(
          schema,
          fromJson: fromJson,
          crossValidators: [isIdLowerThan10],
        ).parse({'id': 0, 'name': ''});

        expect(res.rawIssues, isA<List<ZIssue>>().having((issues) => issues.length, 'Number of issues', 2));
        expect(
          res.getRawIssuesFor('id'),
          isA<List<ZIssue>>()
              .having((issues) => issues.length, 'Number of issues for id', 1)
              .having((issues) => issues.first, 'The issue type is ZIssueMinNotMet', isA<ZIssueMinNotMet>()),
        );
      });
    });

    group('withTypedCrossFieldValidation', () {
      SuperRefinerErrorRes? isIdLowerThan10(TypedFieldAccessor fieldValues) =>
          fieldValues.id < 10 ? null : (zIssue1, others: []);

      test('parsing with cross validation returns issues for the field with issues for other fields', () {
        final res = ZObject.withTypedCrossFieldValidation(
          schema,
          fromJson: fromJson,
          crossValidators: [isIdLowerThan10],
          parsedFieldAccessorFactory: TypedFieldAccessor.new,
        ).parse({'id': 100, 'name': ''});

        expect(res.rawIssues, isA<List<ZIssue>>().having((issues) => issues.length, 'Number of issues', 2));
        expect(res.getRawIssuesFor('id'), equals([zIssue1]));
      });

      test('if the field used in the cross-validator is not parsed properly that issue is returned instead', () {
        final res = ZObject.withTypedCrossFieldValidation(
          schema,
          fromJson: fromJson,
          crossValidators: [isIdLowerThan10],
          parsedFieldAccessorFactory: TypedFieldAccessor.new,
        ).parse({'id': 0, 'name': ''});

        expect(res.rawIssues, isA<List<ZIssue>>().having((issues) => issues.length, 'Number of issues', 2));
        expect(
          res.getRawIssuesFor('id'),
          isA<List<ZIssue>>()
              .having((issues) => issues.length, 'Number of issues for id', 1)
              .having((issues) => issues.first, 'The issue type is ZIssueMinNotMet', isA<ZIssueMinNotMet>()),
        );
      });
    });
  });

  group('preParser', () {
    ({String? name, int? age}) simpleMapper(Map<String, dynamic> val) => (
      name: val['name'],
      age: val['age'],
    );

    group('required', () {
      test('PreParsers are executed in right order and null is not shortcuted', () {
        final preParsers = [
          (Object? val) => val == null ? ZRes.success(<String, dynamic>{}) : ZRes.success(val),
          (Object? val) => val is Map<String, dynamic> && !val.containsKey('name')
              ? ZRes.success({...val, 'name': null})
              : ZRes.success(val),
          (Object? val) => val is Map<String, dynamic> && !val.containsKey('age')
              ? ZRes.success({...val, 'age': null})
              : ZRes.success(val),
        ];

        final zObject = ZObject.withMapper(
          {
            'name': ZString().nullable(),
            'age': ZInt().nullable(),
          },
          fromJson: simpleMapper,
          preParsers: preParsers,
        );

        final res = zObject.parse(null);
        expect(res.isSuccess, isTrue);
        expect(res.value, (name: null, age: null));
      });
      test('PreParser ZRes error is kept', () {
        final preParsers = [
          (Object? val) => val is! Map<String, dynamic>
              ? ZRes<String>.errorSingleIssue(const ZIssueCustom(code: 'customError'))
              : ZRes.success(val),
        ];

        final zObject = ZObject.withMapper(
          {
            'name': ZString().optional(),
            'age': ZInt().optional(),
          },
          fromJson: simpleMapper,
          preParsers: preParsers,
        );

        final res = zObject.parse('dummy');

        expect(res.isError, true);
        expect(res.rawIssues!.first, const ZIssueCustom(code: 'customError'));
      });
    });
    group('nullable', () {
      final preParsers = [
        (Object? val) => val is Map<String, dynamic> && !val.containsKey('age')
            ? ZRes.success({...val, 'age': 0})
            : ZRes.success(val),
      ];

      final zObject = ZObject.withMapper(
        {
          'name': ZString().optional(),
          'age': ZInt().nullable(),
        },
        fromJson: simpleMapper,
        preParsers: preParsers,
      );

      test('PreParsers are executed', () {
        final res = zObject.nullable().parse(<String, dynamic>{});
        expect(res.value, (name: null, age: 0));
      });
      test('Null is propagated', () {
        final res = zObject.nullable().parse(null);
        expect(res.value, null);
      });
    });
  });
}
