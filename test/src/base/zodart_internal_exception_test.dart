import 'package:test/test.dart';
import 'package:zodart/src/base/zodart_internal_exception.dart';
import 'package:zodart/src/z_base_config/z_base_config.dart';

void main() {
  group('toString', () {
    test('no value', () {
      expect(
        ZodArtInternalException('Test message').toString(),
        equals(
          'ZodArt internal exception: "Test message"\n'
          'Value to be parsed: "null"',
        ),
      );
    });
    test('only value', () {
      expect(
        ZodArtInternalException('Test message', value: 1).toString(),
        equals(
          'ZodArt internal exception: "Test message"\n'
          'Value to be parsed: "1"',
        ),
      );
    });
    test('with config', () {
      expect(
        ZodArtInternalException(
          'Test message',
          value: 1,
          config: const ZBaseConfig(fns: [], nullable: true, optional: true),
        ).toString(),
        equals(
          'ZodArt internal exception: "Test message"\n'
          'Value to be parsed: "1"\n'
          'ZBaseConfig(fns: [], nullable: true, optional: true)',
        ),
      );
    });
    test('with stack trace', () {
      expect(
        ZodArtInternalException(
          'Test message',
          value: 1,
          config: const ZBaseConfig(fns: [], nullable: true, optional: true),
          stackTrace: StackTrace.fromString('test stack trace'),
        ).toString(),
        equals(
          'ZodArt internal exception: "Test message"\n'
          'Value to be parsed: "1"\n'
          'ZBaseConfig(fns: [], nullable: true, optional: true)\n'
          'test stack trace',
        ),
      );
    });
  });
}
