// Will be migrated in new version automatically https://github.com/dart-lang/source_gen/issues/743
// ignore_for_file: deprecated_member_use

@GenerateNiceMocks([
  MockSpec<ParameterElement>(),
])
import 'package:analyzer/dart/element/element.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dart_type/dart_type.mocks.dart';
import 'parameter_element.mocks.dart';

MockDartType mockDartType({required String type}) {
  final dartType = MockDartType();
  when(dartType.getDisplayString()).thenReturn(type);

  return dartType;
}

MockParameterElement mockNamedParameterElement({
  required String name,
  required String type,
  bool isRequired = true,
}) {
  final param = MockParameterElement();

  // named
  when(param.name).thenReturn(name);
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

MockParameterElement mockPositionalParameterElement({
  required bool isRequired,
  required String type,
}) {
  final param = MockParameterElement();

  // named
  when(param.name).thenReturn('');
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
