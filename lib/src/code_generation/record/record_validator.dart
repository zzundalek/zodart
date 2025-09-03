import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart' show Reference;
import 'package:fpdart/fpdart.dart';

import '../analysis/entity_analysis_error_summary.dart';
import 'record.dart';
import 'record_analysis.dart';

/// Left type for the invalid Record.
///
/// Contains the analyzed record and errorsSummary
typedef InvalidRecord = ({Record record, String errorsSummary});

/// Either [InvalidRecord] or [Record].
typedef ValidatedRecord = Either<InvalidRecord, Record>;

/// Transforms the [recordType], validates it againts the [schema] and returns
/// either Either [InvalidRecord] or [Record].
ValidatedRecord validateRecord({
  required RecordType recordType,
  required Map<String, Reference> schema,
}) {
  if (schema.isEmpty) {
    throw ArgumentError('Schema cannot be empty');
  }

  return Right<InvalidRecord, RecordType>(recordType)
      .map(Record.fromRecordType)
      .map((record) => RecordAnalysis.from(record: record, schema: schema))
      .flatMap(
        (recordAnalysis) => Either.fromPredicate(
          recordAnalysis,
          (a) => a.isValid,
          (a) => (record: a.record, errorsSummary: a.errorSummary),
        ),
      )
      .map((recordAnalysis) => recordAnalysis.record);
}
