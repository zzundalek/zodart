@GenerateNiceMocks([
  MockSpec<RecordTypeNamedField>(),
])
import 'package:analyzer/dart/element/type.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dart_type/dart_type.mocks.dart';
import 'record_type_named_field.mocks.dart';

MockRecordTypeNamedField mockRecordTypeNamedField({required String name, required String type}) {
  final mockDartType = MockDartType();
  when(mockDartType.getDisplayString()).thenReturn(type);

  final mockNamedField = MockRecordTypeNamedField();

  when(mockNamedField.name).thenReturn(name);
  when(mockNamedField.type).thenReturn(mockDartType);

  return mockNamedField;
}
