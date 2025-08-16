import 'package:code_builder/code_builder.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:zodart/src/code_generation/ctor/ctor.dart';
import '../../../mocks/constructor_element/constructor_element.mocks.dart';
import '../../../mocks/dart_type/dart_type.mocks.dart';
import '../../../mocks/parameter_element/parameter_element.mocks.dart';

void main() {
  group('fromCtorElement', () {
    late MockConstructorElement ctorElement;

    setUp(() {
      ctorElement = MockConstructorElement();

      when(ctorElement.isConst).thenReturn(true);
      when(ctorElement.isFactory).thenReturn(true);
      when(ctorElement.parameters).thenReturn([]);
    });
    test('unnamed', () {
      when(ctorElement.name).thenReturn('');

      final ctor = Ctor.fromCtorElement(ctorElement);

      expect(
        ctor,
        equals(
          const UnnamedCtor(
            isConst: true,
            isFactory: true,
            reqNamedParams: {},
            optNamedParams: {},
            reqPositionalParams: [],
            optPositionalParams: [],
          ),
        ),
      );
    });
    test('named', () {
      when(ctorElement.name).thenReturn('myName');

      final ctor = Ctor.fromCtorElement(ctorElement);

      expect(
        ctor,
        equals(
          const NamedCtor(
            name: 'myName',
            isConst: true,
            isFactory: true,
            reqNamedParams: {},
            optNamedParams: {},
            reqPositionalParams: [],
            optPositionalParams: [],
          ),
        ),
      );
    });
  });
  group('getDisplayName', () {
    test('UnnamedCtor', () {
      const ctor = UnnamedCtor(
        isConst: true,
        isFactory: true,
        reqNamedParams: {},
        optNamedParams: {},
        reqPositionalParams: [],
        optPositionalParams: [],
      );
      expect(ctor.getDisplayName(), '<unnamed>');
    });
    test('NamedCtor', () {
      const ctor = NamedCtor(
        name: 'MyCtorName',
        isConst: false,
        isFactory: false,
        reqNamedParams: {},
        optNamedParams: {},
        reqPositionalParams: [],
        optPositionalParams: [],
      );
      expect(ctor.getDisplayName(), 'MyCtorName');
    });
  });
  group('toUnnamedParam', () {
    late MockParameterElement paramElement;
    late MockDartType dartType;

    setUp(() {
      paramElement = MockParameterElement();
      dartType = MockDartType();

      when(paramElement.type).thenReturn(dartType);
      when(dartType.getDisplayString()).thenReturn('String');
    });

    test('returns proper reference', () {
      expect(Ctor.toUnnamedParam(paramElement), refer('String'));
    });
  });
  group('toNamedParam', () {
    late MockParameterElement paramElement;
    late MockDartType dartType;

    setUp(() {
      paramElement = MockParameterElement();
      dartType = MockDartType();

      when(paramElement.type).thenReturn(dartType);
      when(paramElement.name).thenReturn('MyName');
      when(dartType.getDisplayString()).thenReturn('String');
    });

    test('returns proper name and reference', () {
      final res = Ctor.toNamedParam(paramElement);

      expect(res.key, 'MyName');
      expect(res.value, refer('String'));
    });
  });
}
