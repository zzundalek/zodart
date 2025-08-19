import 'package:code_builder/code_builder.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:zodart/src/code_generation/ctor/ctor.dart';
import '../../../mocks/constructor_element/constructor_element.mocks.dart';
import '../../../mocks/formal_parameter_element/formal_parameter_element.dart';
import '../../../mocks/formal_parameter_element/formal_parameter_element.mocks.dart';

void main() {
  group('fromCtorElement', () {
    late MockConstructorElement2 ctorElement;

    setUp(() {
      ctorElement = MockConstructorElement2();

      when(ctorElement.isConst).thenReturn(true);
      when(ctorElement.isFactory).thenReturn(true);
      when(ctorElement.formalParameters).thenReturn([]);
    });
    test('unnamed', () {
      when(ctorElement.name3).thenReturn('new');

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
      when(ctorElement.name3).thenReturn('myName');

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
    late MockFormalParameterElement paramElement;

    setUp(() {
      paramElement = mockPositionalParameterElement(isRequired: false, type: 'String');
    });

    test('returns proper reference', () {
      expect(Ctor.toUnnamedParam(paramElement), refer('String'));
    });
  });
  group('toNamedParam', () {
    late MockFormalParameterElement paramElement;

    setUp(() {
      paramElement = mockNamedParameterElement(name: 'MyName', type: 'String');
    });

    test('returns proper name and reference', () {
      final res = Ctor.toNamedParam(paramElement);

      expect(res.key, 'MyName');
      expect(res.value, refer('String'));
    });

    test('throws an ArgumentError for unnamed params', () {
      final unnamedParamElement = mockPositionalParameterElement(type: 'String', isRequired: false);

      expect(
        () => Ctor.toNamedParam(unnamedParamElement),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
