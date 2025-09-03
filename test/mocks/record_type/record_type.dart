@GenerateNiceMocks([
  MockSpec<RecordType>(),
])
import 'package:analyzer/dart/element/type.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../record_type_named_field/record_type_named_field.dart';
import '../record_type_positional_field/record_type_positional_field.dart';
import 'record_type.mocks.dart';

MockRecordType mockRecordType({
  required List<({String name, String type})> namedFields,
  required List<String> positionalFields,
}) {
  final record = MockRecordType();

  final namedFieldsRec = namedFields
      .map(
        (namedField) => mockRecordTypeNamedField(name: namedField.name, type: namedField.type),
      )
      .toList();

  final positionalFieldsRec = positionalFields.map(mockRecordPositionalField).toList();

  when(record.namedFields).thenReturn(namedFieldsRec);
  when(record.positionalFields).thenReturn(positionalFieldsRec);

  return record;
}
