import 'package:code_builder/code_builder.dart';

import '../analysis/entity_analysis.dart';
import 'record.dart';

/// Analyzes a record against a schema to detect missing fields and type mismatches.
class RecordAnalysis extends EntityAnalysis {
  /// Creates a [RecordAnalysis] with detailed field and type mismatch info.
  const RecordAnalysis({
    required this.record,
    required this.schema,
    required this.missingInEntity,
    required this.missingInSchema,
    required this.typeMismatches,
  });

  /// Creates a [RecordAnalysis] by comparing [record] fields to the [schema].
  ///
  /// - Detects fields missing in the record or schema.
  /// - Detects type mismatches between record fields and schema definitions.
  factory RecordAnalysis.from({
    required Record record,
    required Map<String, Reference> schema,
  }) {
    final namedFields = record.namedFields;

    final schemaParamNames = schema.keys.toSet();
    final fieldNames = namedFields.keys.toSet();

    final missingInRecord = schemaParamNames.difference(fieldNames);
    final missingInSchema = fieldNames.difference(schemaParamNames);

    final typeMismatches = EntityAnalysis.getTypeMismatches(expected: schema, actual: namedFields);

    return RecordAnalysis(
      record: record,
      schema: schema,
      missingInSchema: missingInSchema,
      missingInEntity: missingInRecord,
      typeMismatches: typeMismatches,
    );
  }

  /// The record being analyzed.
  final Record record;

  @override
  final Map<String, Reference> schema;

  @override
  final Set<String> missingInEntity;

  @override
  final Set<String> missingInSchema;

  @override
  final Map<String, TypeMismatch> typeMismatches;

  @override
  bool get hasOptPositionalParams => false;

  @override
  bool get hasReqPositionalParams => record.positionalFields.isNotEmpty;
}
