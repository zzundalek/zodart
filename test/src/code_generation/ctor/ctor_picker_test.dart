import 'package:test/test.dart';
import 'package:zodart/src/code_generation/ctor/_ctor.dart';

import '../../../mocks/class_element/class_element.dart';
import '../../../mocks/constructor_element/constructor_element.dart';
import '../../../mocks/constructor_element/constructor_element.mocks.dart';
import '../../../mocks/formal_parameter_element/formal_parameter_element.dart';
import 'ctor_test_helper.dart';

void main() {
  group('pickBestCtor', () {
    group('validation', () {
      test('throws an ArgumentError error if an empty ctor elements list is passed', () {
        expect(
          () => pickBestCtor(ctorElements: [], schema: {'strVal': refs.str}),
          throwsArgumentErrorWith('Must provide at least one constructor'),
        );
      });

      test('throws an ArgumentError error if an empty schema is passed', () {
        final ctor = MockConstructorElement();

        expect(
          () => pickBestCtor(ctorElements: [ctor], schema: {}),
          throwsArgumentErrorWith('Schema cannot be empty'),
        );
      });
    });

    group('one ctor', () {
      group('valid ctor', () {
        test('picks the only one available unnamed valid ctor', () {
          final ctor = mockConstructorElement(
            name: null,
            paramElements: [
              mockNamedParameterElement(name: 'strVal', type: 'String'),
            ],
          );

          final expectedCtor = defaultUnnamedCtor.copyWith(
            reqNamedParams: {'strVal': refs.str},
          );

          expect(
            pickBestCtor(ctorElements: [ctor], schema: {'strVal': refs.str}),
            PicksValidCtorMatcher(expected: expectedCtor, isValid: true),
          );
        });
        test('picks the only one available named valid ctor', () {
          final ctor = mockConstructorElement(
            name: 'myCtor',
            paramElements: [
              mockNamedParameterElement(name: 'strVal', type: 'String'),
            ],
          );

          final expectedCtor = defaultNamedCtor.copyWith(
            reqNamedParams: {'strVal': refs.str},
          );

          expect(
            pickBestCtor(ctorElements: [ctor], schema: {'strVal': refs.str}),
            PicksValidCtorMatcher(expected: expectedCtor, isValid: true),
          );
        });
      });
      group('invalid ctor', () {
        test('picks the only one available unnamed invalid ctor', () {
          final ctor = mockConstructorElement(
            name: null,
            paramElements: [],
          );

          final expectedCtor = defaultUnnamedCtor.copyWith();

          expect(
            pickBestCtor(ctorElements: [ctor], schema: {'strVal': refs.str}),
            PicksValidCtorMatcher(expected: expectedCtor, isValid: false),
          );
        });
        test('picks the only one available named invalid ctor', () {
          final ctor = mockConstructorElement(
            name: 'myCtor',
            paramElements: [],
          );

          final expectedCtor = defaultNamedCtor.copyWith();

          expect(
            pickBestCtor(ctorElements: [ctor], schema: {'strVal': refs.str}),
            PicksValidCtorMatcher(expected: expectedCtor, isValid: false),
          );
        });
      });
    });
    group('multiple ctors', () {
      test('prefers unnamed const ctor to other ctors', () {
        final unnamedConstCtor = mockConstructorElement(
          name: null,
          paramElements: [
            mockNamedParameterElement(name: 'optIntVal', type: 'int?'),
          ],
        );
        final unnamedCtor = mockConstructorElement(
          name: null,
          isConst: false,
          paramElements: [
            mockNamedParameterElement(name: 'optIntVal', type: 'int?'),
          ],
        );
        final namedCtor = mockConstructorElement(
          name: 'myCtor',
          paramElements: [
            mockNamedParameterElement(name: 'optIntVal', type: 'int?'),
          ],
        );

        final expectedCtor = defaultUnnamedCtor.copyWith(
          reqNamedParams: {'optIntVal': refs.optInt},
        );

        expect(
          pickBestCtor(ctorElements: [namedCtor, unnamedConstCtor, unnamedCtor], schema: {'optIntVal': refs.optInt}),
          PicksValidCtorMatcher(expected: expectedCtor, isValid: true),
        );
      });
    });
  });
  group('getPublicCtorElements', () {
    test('returns only public ctors', () {
      final publicNamedCtor = mockConstructorElement(name: 'publicNamed', paramElements: []);
      final privateNamedCtor = mockConstructorElement(name: 'privateNamed', isPublic: false, paramElements: []);

      final publicUnnamedCtor = mockConstructorElement(name: null, paramElements: []);
      final privateUnnamedCtor = mockConstructorElement(name: null, isPublic: false, paramElements: []);

      final classElement = mockClassElement(
        name: 'MyClass',
        ctors: [
          publicNamedCtor,
          privateNamedCtor,
          publicUnnamedCtor,
          privateUnnamedCtor,
        ],
      );

      expect(getPublicCtorElements(classElement), unorderedEquals([publicUnnamedCtor, publicNamedCtor]));
    });
  });
}
