import 'package:code_builder/code_builder.dart';

import '../analysis/entity_analysis.dart';
import 'ctor.dart';

/// Analyzes a constructor against a schema to detect missing parameters and type mismatches.
class CtorAnalysis extends EntityAnalysis {
  /// Creates a [CtorAnalysis] with detailed parameter and type mismatch info.
  const CtorAnalysis({
    required this.ctor,
    required this.schema,
    required this.missingInEntity,
    required this.missingInSchema,
    required this.typeMismatches,
  });

  /// Creates a [CtorAnalysis] by comparing [ctor] parameters to the [schema].
  ///
  /// - Detects parameters missing in the constructor or schema.
  /// - Detects type mismatches between constructor parameters and schema definitions.
  factory CtorAnalysis.from({
    required Ctor ctor,
    required Map<String, Reference> schema,
  }) {
    final namedParams = ctor.namedParams;

    final schemaParamNames = schema.keys.toSet();
    final paramNames = namedParams.keys.toSet();

    final missingInCtor = schemaParamNames.difference(paramNames);
    final missingInSchema = paramNames.difference(schemaParamNames);

    final typeMismatches = EntityAnalysis.getTypeMismatches(expected: schema, actual: namedParams);

    return CtorAnalysis(
      ctor: ctor,
      schema: schema,
      missingInSchema: missingInSchema,
      missingInEntity: missingInCtor,
      typeMismatches: typeMismatches,
    );
  }

  /// The constructor being analyzed.
  final Ctor ctor;

  @override
  final Map<String, Reference> schema;

  @override
  final Set<String> missingInEntity;

  @override
  final Set<String> missingInSchema;

  @override
  final Map<String, TypeMismatch> typeMismatches;

  @override
  bool get hasReqPositionalParams => ctor.reqPositionalParams.isNotEmpty;

  @override
  bool get hasOptPositionalParams => ctor.optPositionalParams.isNotEmpty;
}
