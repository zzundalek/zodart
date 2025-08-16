@GenerateNiceMocks([
  MockSpec<CtorAnalysis>(as: #BaseMockCtorAnalysis),
])
import 'package:code_builder/code_builder.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:zodart/src/code_generation/ctor/_ctor.dart';

import 'ctor_analysis.mocks.dart';

class MockCtorAnalysis extends BaseMockCtorAnalysis {
  @override
  String toString() {
    return 'MockCtorAnalysis('
        'ctor: $ctor, '
        'schema: $schema, '
        'missingInCtor: $missingInCtor, '
        'missingInSchema: $missingInSchema, '
        'typeMismatches: $typeMismatches'
        ')';
  }
}

MockCtorAnalysis mockCtorAnalysis({
  required Ctor ctor,
  required Map<String, Reference> schema,
  Set<String> missingInCtor = const {},
  Set<String> missingInSchema = const {},
  Map<String, TypeMismatch> typeMismatches = const {},
}) {
  // Ensure Mockito has a dummy Ctor for non-nullable fields
  provideDummy<Ctor>(ctor);

  final analysis = MockCtorAnalysis();

  when(analysis.ctor).thenReturn(ctor);
  when(analysis.schema).thenReturn(schema);
  when(analysis.missingInCtor).thenReturn(missingInCtor);
  when(analysis.missingInSchema).thenReturn(missingInSchema);
  when(analysis.typeMismatches).thenReturn(typeMismatches);

  return analysis;
}
