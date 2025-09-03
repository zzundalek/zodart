@GenerateNiceMocks([
  MockSpec<ClassElement2>(),
])
import 'package:analyzer/dart/element/element2.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../constructor_element/constructor_element.mocks.dart';
import 'class_element.mocks.dart';

MockClassElement2 mockClassElement({
  required String name,
  List<MockConstructorElement2> ctors = const [],
}) {
  final classElem = MockClassElement2();
  when(classElem.name3).thenReturn(name);
  when(classElem.constructors2).thenReturn(ctors);

  return classElem;
}
