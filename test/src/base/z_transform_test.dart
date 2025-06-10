import 'package:test/test.dart';
import 'package:zodart/src/base/base.dart';
import 'package:zodart/src/z_base_config/z_base_config.dart';

void main() {
  group('TransformAny internal exception test', () {
    test('throws ZodArtInternalException when Transformer receives a value of incorrect type', () {
      const notNullableConfig = ZBaseConfig(fns: []);
      final transformerStrToInt = TransformStringToInt((String val) => ZRes.success(1));
      final configuredTransformer = transformerStrToInt.fn(notNullableConfig);

      expect(
        () => configuredTransformer(null),
        throwsA(
          isA<ZodArtInternalException>().having(
            (exception) => exception.message,
            'message',
            'Unexpected transformation error occurred. Value "null" of type "Null" should have been converted from type "String" to type "int".',
          ),
        ),
      );
    });
  });
}
