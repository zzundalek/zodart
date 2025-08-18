import 'ctor_analysis.dart';

/// Extension on [CtorAnalysis] for providing validation errors summary.
extension CtorAnalysisExt on CtorAnalysis {
  /// Returns error summary string
  String get errorSummary {
    final summaryBuffer = StringBuffer();

    if (hasReqPositionalParams) {
      summaryBuffer.writeln('- requires unnamed (positional) parameters.');
    }

    if (hasOptPositionalParams) {
      summaryBuffer.writeln('- allows unnamed (positional) parameters.');
    }

    if (missingInCtor.isNotEmpty) {
      summaryBuffer.writeln(
        '- missing required schema parameters: $missingInCtor',
      );
    }

    if (missingInSchema.isNotEmpty) {
      summaryBuffer.writeln('- unexpected parameters not defined in the schema: $missingInSchema');
    }

    if (typeMismatches.isNotEmpty) {
      final mismatchesDetail = typeMismatches.entries.map(
        (entry) =>
            "    - '${entry.key}' expected type is '${entry.value.expectedType}', "
            "but received '${entry.value.actualType}'",
      );
      summaryBuffer
        ..writeln('- parameters type mismatch(es):')
        ..writeln(mismatchesDetail.join('\n'));
    }

    return summaryBuffer.toString();
  }
}
