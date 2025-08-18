import 'package:test/test.dart';
import 'package:zodart/src/code_generation/schema_parsing/schema_parsing.dart';

final SchemaMap oneItemMap = {
  'strVal': (zType: 'ZString', outType: 'String'),
};
final SchemaMap twoItemsMap = {
  'strVal': (zType: 'ZString', outType: 'String'),
  'intVal': (zType: 'ZInt', outType: 'int'),
};

void main() {
  group('Schema', () {
    group('propertyNames', () {
      test('returns empty set for empty input map', () {
        expect(const Schema({}).propertyNames, unorderedEquals({}));
      });

      test('returns right property name for one property', () {
        expect(Schema(oneItemMap).propertyNames, unorderedEquals({'strVal'}));
      });

      test('returns right property name for two properties', () {
        expect(Schema(twoItemsMap).propertyNames, unorderedEquals({'strVal', 'intVal'}));
      });
    });
    group('zSchema', () {
      test('returns empty map for empty input map', () {
        expect(const Schema({}).zSchema, equals({}));
      });

      test('returns right property map for one property', () {
        expect(Schema(oneItemMap).zSchema, equals({'strVal': 'ZString'}));
      });

      test('returns right property map for two properties', () {
        expect(Schema(twoItemsMap).zSchema, equals({'strVal': 'ZString', 'intVal': 'ZInt'}));
      });
    });
    group('outSchema', () {
      test('returns empty map for empty input map', () {
        expect(const Schema({}).outSchema, equals({}));
      });

      test('returns right property map for one property', () {
        expect(Schema(oneItemMap).outSchema, equals({'strVal': 'String'}));
      });

      test('returns right property map for two properties', () {
        expect(Schema(twoItemsMap).outSchema, equals({'strVal': 'String', 'intVal': 'int'}));
      });
    });
  });
}
