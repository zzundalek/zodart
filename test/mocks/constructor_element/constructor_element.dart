@GenerateNiceMocks([
  MockSpec<ConstructorElement>(),
])
import 'package:analyzer/dart/element/element.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../formal_parameter_element/formal_parameter_element.mocks.dart';
import 'constructor_element.mocks.dart';

MockConstructorElement mockConstructorElement({
  required String? name,
  required List<MockFormalParameterElement> paramElements,
  bool isConst = true,
  bool isFactory = false,
  bool isPublic = true,
}) {
  final ctor = MockConstructorElement();

  when(ctor.name).thenReturn(name);
  when(ctor.formalParameters).thenReturn(paramElements);
  when(ctor.isConst).thenReturn(isConst);
  when(ctor.isFactory).thenReturn(isFactory);
  when(ctor.isPublic).thenReturn(isPublic);

  return ctor;
}
