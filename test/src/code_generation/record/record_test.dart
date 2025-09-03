import 'package:code_builder/code_builder.dart';
import 'package:test/test.dart';
import 'package:zodart/src/code_generation/record/record.dart';
import '../../../mocks/record_type/record_type.dart';
import '../../../mocks/record_type/record_type.mocks.dart';
import '../../../mocks/record_type_named_field/record_type_named_field.dart';
import '../../../mocks/record_type_named_field/record_type_named_field.mocks.dart';
import '../../../mocks/record_type_positional_field/record_type_positional_field.dart';
import '../../../mocks/record_type_positional_field/record_type_positional_field.mocks.dart';

void main() {
  group('fromRecordType', () {
    late MockRecordType recordType;

    setUp(() {
      recordType = mockRecordType(namedFields: [], positionalFields: []);
    });
    test('test from record for empty record', () {
      final record = Record.fromRecordType(recordType);

      expect(
        record,
        equals(
          const Record(
            namedFields: {},
            positionalFields: [],
          ),
        ),
      );
    });
  });
  group('toUnnamedParam', () {
    late MockRecordTypePositionalField paramElement;

    setUp(() {
      paramElement = mockRecordPositionalField('String');
    });

    test('returns proper reference', () {
      expect(Record.toUnnamedParam(paramElement), refer('String'));
    });
  });
  group('toNamedParam', () {
    late MockRecordTypeNamedField paramElement;

    setUp(() {
      paramElement = mockRecordTypeNamedField(name: 'MyName', type: 'String');
    });

    test('returns proper name and reference', () {
      final res = Record.toNamedParam(paramElement);

      expect(res.key, 'MyName');
      expect(res.value, refer('String'));
    });
  });
}
