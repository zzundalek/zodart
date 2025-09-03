@GenerateNiceMocks([
  MockSpec<ConstructorElement2>(),
])
import 'package:analyzer/dart/element/element2.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../formal_parameter_element/formal_parameter_element.mocks.dart';
import 'constructor_element.mocks.dart';

MockConstructorElement2 mockConstructorElement({
  required String? name,
  required List<MockFormalParameterElement> paramElements,
  bool isConst = true,
  bool isFactory = false,
  bool isPublic = true,
}) {
  final ctor = MockConstructorElement2();

  when(ctor.name3).thenReturn(name);
  when(ctor.formalParameters).thenReturn(paramElements);
  when(ctor.isConst).thenReturn(isConst);
  when(ctor.isFactory).thenReturn(isFactory);
  when(ctor.isPublic).thenReturn(isPublic);

  return ctor;
}
