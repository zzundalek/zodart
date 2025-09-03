@GenerateNiceMocks([
  MockSpec<EntityAnalysis>(as: #BaseMockEntityAnalysis),
])
import 'package:code_builder/code_builder.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:zodart/src/code_generation/analysis/entity_analysis.dart';

import 'entity_analysis.mocks.dart';

class MockEntityAnalysis extends BaseMockEntityAnalysis {
  @override
  String toString() {
    return 'MockEntityAnalysis('
        'schema: $schema, '
        'missingInCtor: $missingInEntity, '
        'missingInSchema: $missingInSchema, '
        'typeMismatches: $typeMismatches'
        ')';
  }
}

MockEntityAnalysis mockCtorAnalysis({
  required Map<String, Reference> schema,
  Set<String> missingInCtor = const {},
  Set<String> missingInSchema = const {},
  Map<String, TypeMismatch> typeMismatches = const {},
}) {
  final analysis = MockEntityAnalysis();

  when(analysis.schema).thenReturn(schema);
  when(analysis.missingInEntity).thenReturn(missingInCtor);
  when(analysis.missingInSchema).thenReturn(missingInSchema);
  when(analysis.typeMismatches).thenReturn(typeMismatches);

  return analysis;
}
