import 'package:test/test.dart';
import 'package:zodart/src/base/base.dart';
import 'package:zodart/src/base/cross_field_validation.dart';
import 'package:zodart/src/types/types.dart';

void main() {
  group('ParsedFieldAccessor', () {
    late final ParsedFieldAccessor parsedFieldAccessor;

    setUpAll(() {
      parsedFieldAccessor = ParsedFieldAccessor(
        {
          'id': ZInt(),
          'name': ZString(),
        },
        {
          'name': 'ZodArt',
        },
      );
    });

    test('Returns the correct value for successfuly parsed value.', () {
      expect(parsedFieldAccessor['name'], 'ZodArt');
    });

    test('Throws a ParsedFieldValueNotReadyException when the field is not present in the parsedValues.', () {
      expect(() => parsedFieldAccessor['id'], throwsA(isA<ParsedFieldValueNotReadyException>()));
    });

    test('Throws a FieldNotInSchemaAccessorException when the field is not in the schema.', () {
      expect(
        () => parsedFieldAccessor['dummy'],
        throwsA(
          isA<FieldNotInSchemaAccessorException>()
              .having(
                (e) => e.fieldName,
                'fieldName',
                'dummy',
              )
              .having(
                (e) => e.schemaFieldNames,
                'schemaFieldNames',
                ['id', 'name'],
              ),
        ),
      );
    });
  });

  group('FieldNotInSchemaAccessorException', () {
    test('toString returns correct string representation', () {
      final toStringRes = const FieldNotInSchemaAccessorException(
        fieldName: 'email',
        schemaFieldNames: ['id', 'name'],
      ).toString();

      expect(
        toStringRes,
        'FieldNotInSchemaAccessorException: Field "email" is not defined in the schema. '
        'Available fields are: [id, name].',
      );
    });
  });

  group('CrossFieldValidationExecutor', () {
    const zIssues1 = ZIssue.custom(message: 'issue1');
    const zIssues2 = ZIssue.custom(message: 'issue2');
    const zIssues3 = ZIssue.custom(message: 'issue3');

    test('Return empty list when no validator is passed', () {
      final validation = (
        crossValidators: <dynamic>[],
        parsedFieldAccessorFactory: ParsedFieldAccessor.new,
      );

      final res = CrossFieldValidationExecutor(validation).execute(
        succesfullyParsedValues: {},
        schema: {},
      );

      expect(res, isEmpty);
    });

    test('Return empty list when the only validator returns null', () {
      final validators = [(_) => null];

      final validation = (
        crossValidators: validators,
        parsedFieldAccessorFactory: ParsedFieldAccessor.new,
      );

      final res = CrossFieldValidationExecutor(validation).execute(
        succesfullyParsedValues: {},
        schema: {},
      );

      expect(res, isEmpty);
    });

    test('Return the issue returned by the validator', () {
      final validators = <CrossFieldValidator>[(_) => (zIssues1, others: [])];

      final validation = (
        crossValidators: validators,
        parsedFieldAccessorFactory: ParsedFieldAccessor.new,
      );

      final res = CrossFieldValidationExecutor(validation).execute(
        succesfullyParsedValues: {},
        schema: {},
      );

      expect(res, equals([zIssues1]));
    });

    test('Return all issues returned by the validators', () {
      final validators = <CrossFieldValidator>[
        (_) => (zIssues1, others: [zIssues2]),
        (_) => null,
        (_) => (zIssues3, others: []),
      ];

      final validation = (
        crossValidators: validators,
        parsedFieldAccessorFactory: ParsedFieldAccessor.new,
      );

      final res = CrossFieldValidationExecutor(validation).execute(
        succesfullyParsedValues: {},
        schema: {},
      );

      expect(res, equals([zIssues1, zIssues2, zIssues3]));
    });

    test('Validators accessing value which is not in succesfullyParsedValues are skipped', () {
      final validators = <CrossFieldValidator>[
        (_) => (zIssues1, others: []),
        (accessor) => accessor['name'] == '' ? null : (zIssues2, others: []),
        (accessor) => accessor['id'] == 0 ? null : (zIssues3, others: []),
      ];

      final validation = (
        crossValidators: validators,
        parsedFieldAccessorFactory: ParsedFieldAccessor.new,
      );

      final res = CrossFieldValidationExecutor(validation).execute(
        succesfullyParsedValues: {
          'id': 1,
        },
        schema: {
          'id': ZInt(),
          'name': ZString(),
        },
      );

      expect(res, equals([zIssues1, zIssues3]));
    });

    test('Throws FieldNotInSchemaAccessorException when validator tries to access a field not in the schema', () {
      final validators = <CrossFieldValidator>[
        (_) => (zIssues1, others: []),
        (accessor) => accessor['dummy'] == '' ? null : (zIssues2, others: []),
      ];

      final validation = (
        crossValidators: validators,
        parsedFieldAccessorFactory: ParsedFieldAccessor.new,
      );

      expect(
        () => CrossFieldValidationExecutor(validation).execute(
          succesfullyParsedValues: {},
          schema: {},
        ),
        throwsA(isA<FieldNotInSchemaAccessorException>()),
      );
    });
  });
}
