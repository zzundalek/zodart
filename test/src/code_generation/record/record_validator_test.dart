import 'package:fpdart/fpdart.dart';
import 'package:test/test.dart';
import 'package:zodart/src/code_generation/record/record_validator.dart';

import '../../../mocks/record_type/record_type.dart';
import '../ctor/ctor_test_helper.dart' show throwsArgumentErrorWith;
import 'record_test_helper.dart';

void main() {
  group('validateRecord', () {
    group('schema validation', () {
      test('throws an ArgumentError error if an empty schema is passed', () {
        final record = mockRecordType(namedFields: [], positionalFields: []);

        expect(
          () => validateRecord(recordType: record, schema: {}),
          throwsArgumentErrorWith('Schema cannot be empty'),
        );
      });
    });

    group('record validation based on analysis', () {
      test('returns Right for a valid record', () {
        final record = mockRecordType(namedFields: [(name: 'strVal', type: 'String')], positionalFields: []);

        expect(
          validateRecord(recordType: record, schema: {'strVal': refs.str}),
          isA<Right<dynamic, dynamic>>(),
        );
      });
      test('returns Left for an invalid record', () {
        final record = mockRecordType(namedFields: [], positionalFields: []);

        expect(
          validateRecord(recordType: record, schema: {'strVal': refs.str}),
          isA<Left<dynamic, dynamic>>(),
        );
      });
    });
  });
}
