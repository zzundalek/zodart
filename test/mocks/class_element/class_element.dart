@GenerateNiceMocks([
  MockSpec<ClassElement>(),
])
import 'package:analyzer/dart/element/element.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../constructor_element/constructor_element.mocks.dart';
import 'class_element.mocks.dart';

MockClassElement mockClassElement({
  required String name,
  List<MockConstructorElement> ctors = const [],
}) {
  final classElem = MockClassElement();
  when(classElem.name).thenReturn(name);
  when(classElem.constructors).thenReturn(ctors);

  return classElem;
}
