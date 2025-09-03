import 'entity_analysis.dart';

/// Extension on [EntityAnalysis] for providing validation errors summary.
extension EntityAnalysisErrorSummary on EntityAnalysis {
  /// Returns error summary string
  String get errorSummary {
    final summaryBuffer = StringBuffer();

    if (hasReqPositionalParams) {
      summaryBuffer.writeln('- requires unnamed (positional) parameters');
    }

    if (hasOptPositionalParams) {
      summaryBuffer.writeln('- allows unnamed (positional) parameters');
    }

    if (missingInEntity.isNotEmpty) {
      summaryBuffer.writeln(
        '- missing required schema parameters: $missingInEntity',
      );
    }

    if (missingInSchema.isNotEmpty) {
      summaryBuffer.writeln('- unexpected parameters not defined in the schema: $missingInSchema');
    }

    if (typeMismatches.isNotEmpty) {
      final mismatchesDetail = typeMismatches.entries.map(
        (entry) =>
            "  - '${entry.key}' expected type is '${entry.value.expectedType}', "
            "but received '${entry.value.actualType}'",
      );
      summaryBuffer
        ..writeln('- parameters type mismatch(es):')
        ..writeln(mismatchesDetail.join('\n'));
    }

    return summaryBuffer.toString();
  }
}
