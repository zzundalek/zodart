import 'package:test/test.dart';
import 'package:zodart/src/base/base.dart';
import 'package:zodart/src/modifiers/modifiers.dart';
import 'package:zodart/src/types/types.dart';
import 'package:zodart/src/z_base_config/z_base_config.dart';

void main() {
  group('ZBase internal exception test', () {
    test('throws ZodArtInternalException when parsed value type does not match the expected type', () {
      final zStringWithParseIntTransformer = createZStringWithConfigForTesting(ZBaseConfig(fns: [ParseInt(parseInt)]));
      expect(
        () => zStringWithParseIntTransformer.parse(1),
        throwsA(
          isA<ZodArtInternalException>().having(
            (exception) => exception.message,
            'message',
            'Error occurred at fixing type after parsing. Value "1" of type "int" Expected to have type "String".',
          ),
        ),
      );
    });
    test('throws ZodArtInternalException when parser throws an unexpected error', () {
      final zStringWithParserThrowing =
          createZStringWithConfigForTesting(ZBaseConfig(fns: [ParseString((_) => throw Error())]));
      expect(
        () => zStringWithParserThrowing.parse('1'),
        throwsA(
          isA<ZodArtInternalException>().having(
            (exception) => exception.message,
            'message',
            'Unknown exception: "Instance of \'Error\'"',
          ),
        ),
      );
    });
    test('get isNullable', () {
      final schema = ZString();
      expect(schema.isNullable, isFalse);
      final newSchema = schema.nullable();
      expect(newSchema.isNullable, isTrue);
    });
    test('get isOptional', () {
      final schema = ZString();
      expect(schema.isOptional, isFalse);
      final newSchema = schema.optional();
      expect(newSchema.isOptional, isTrue);
    });
  });
}
