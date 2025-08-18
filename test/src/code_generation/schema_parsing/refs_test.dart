import 'package:test/test.dart';
import 'package:zodart/src/code_generation/schema_parsing/schema_parsing.dart';

void main() {
  group('Refs', () {
    group('Refs factory ctor', () {
      test('check properly created ref strings', () {
        final refs = Refs(
          annotatedClassName: 'UserSchema',
          outputTypeName: 'User',
          schemaFieldName: 'schema',
        );

        expect(refs.annotatedClass, equals('UserSchema'));
        expect(refs.utilsClass, equals('_UserSchemaUtils'));
        expect(refs.schemaDefType, equals('_UserSchemaDef'));
        expect(refs.schemaResType, equals(r'$UserSchema'));
        expect(refs.outputType, equals('User'));
        expect(refs.propsEnum, equals('UserSchemaProps'));
        expect(refs.schemaFieldPath, equals('UserSchema.schema'));
        expect(refs.propsEnumWrapper, equals('_UserSchemaPropsWrapper'));
        expect(refs.utilsInterface, equals('ZGenSchemaUtils<_UserSchemaPropsWrapper, User>'));
        expect(refs.shapeType, equals('ZGenSchemaShape<User>'));
        expect(refs.outputClassMixin, equals('_UserSchema'));
        expect(refs.outputClassImpl, equals('_UserSchemaImpl'));
        expect(refs.instantiateSchemaFn, equals('_instantiateUserSchema'));
      });
    });
  });
}
