@GenerateNiceMocks([
  MockSpec<RecordTypePositionalField>(),
])
import 'package:analyzer/dart/element/type.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dart_type/dart_type.mocks.dart';
import 'record_type_positional_field.mocks.dart';

MockRecordTypePositionalField mockRecordPositionalField(String type) {
  final mockDartType = MockDartType();
  when(mockDartType.getDisplayString()).thenReturn(type);

  final mockPositionalField = MockRecordTypePositionalField();

  when(mockPositionalField.type).thenReturn(mockDartType);

  return mockPositionalField;
}
