// Will be migrated in new version automatically https://github.com/dart-lang/source_gen/issues/743
// ignore_for_file: deprecated_member_use

@GenerateNiceMocks([
  MockSpec<ConstructorElement>(),
])
import 'package:analyzer/dart/element/element.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../parameter_element/parameter_element.mocks.dart';
import 'constructor_element.mocks.dart';

MockConstructorElement mockConstructorElement({
  required String? name,
  required List<MockParameterElement> paramElements,
  bool isConst = true,
  bool isFactory = false,
  bool isPublic = true,
}) {
  final ctor = MockConstructorElement();

  when(ctor.name).thenReturn(name ?? '');
  when(ctor.parameters).thenReturn(paramElements);
  when(ctor.isConst).thenReturn(isConst);
  when(ctor.isFactory).thenReturn(isFactory);
  when(ctor.isPublic).thenReturn(isPublic);

  return ctor;
}
