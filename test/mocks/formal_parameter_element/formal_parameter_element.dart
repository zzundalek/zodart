@GenerateNiceMocks([
  MockSpec<FormalParameterElement>(),
])
import 'package:analyzer/dart/element/element.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dart_type/dart_type.mocks.dart';
import 'formal_parameter_element.mocks.dart';

MockDartType mockDartType({required String type}) {
  final dartType = MockDartType();
  when(dartType.getDisplayString()).thenReturn(type);

  return dartType;
}

MockFormalParameterElement mockNamedParameterElement({
  required String name,
  required String type,
  bool isRequired = true,
}) {
  final param = MockFormalParameterElement();

  // named
  when(param.name).thenReturn(name);
  when(param.isNamed).thenReturn(true);
  when(param.isRequiredNamed).thenReturn(isRequired);
  when(param.isOptionalNamed).thenReturn(!isRequired);

  // positional
  when(param.isRequiredPositional).thenReturn(false);
  when(param.isOptionalNamed).thenReturn(false);

  // type
  final dartType = mockDartType(type: type);
  when(param.type).thenReturn(dartType);

  return param;
}

MockFormalParameterElement mockPositionalParameterElement({
  required bool isRequired,
  required String type,
}) {
  final param = MockFormalParameterElement();

  when(param.name).thenReturn(null);
  when(param.isNamed).thenReturn(false);
  when(param.isRequiredNamed).thenReturn(false);
  when(param.isOptionalNamed).thenReturn(false);

  // positional
  when(param.isRequiredPositional).thenReturn(isRequired);
  when(param.isOptionalNamed).thenReturn(!isRequired);

  // type
  final dartType = mockDartType(type: type);
  when(param.type).thenReturn(dartType);

  return param;
}
