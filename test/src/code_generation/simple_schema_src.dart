import 'package:source_gen_test/annotations.dart';
import 'package:zodart/zodart.dart';

part 'goldens/test_simple_schema.dart';

// NOTE: Keep the class name to one char to avoid pana code format issue
@ShouldGenerateFile(
  'goldens/test_simple_schema.dart',
  partOfCurrent: true,
)
@zodart
abstract class S {
  static final ({ZString id}) schema = (id: ZString());

  static const z = _$ZSUtils();

  static final ZObject<({String id})> zObj = z.zObject;
}
