import 'package:test/test.dart';
import 'package:zodart/src/code_generation/record/_record.dart';

import 'record_test_helper.dart';

void main() {
  group('from', () {
    test('retuns a valid analysis for only required params', () {
      final record = defaultRecord.copyWith(
        namedFields: {'reqStr': refs.str},
      );
      final schema = {
        'reqStr': refs.str,
      };

      testAnalysisResult(
        defaultExpectedResult,
        RecordAnalysis.from(record: record, schema: schema),
      );
    });

    test('retuns an invalid analysis if record contains a positional args', () {
      final record = defaultRecord.copyWith(
        namedFields: {'reqStr': refs.str},
        positionalFields: [refs.str],
      );
      final schema = {
        'reqStr': refs.str,
      };

      testAnalysisResult(
        defaultExpectedResult.copyWith(hasPositionalParams: true, isValid: false),
        RecordAnalysis.from(record: record, schema: schema),
      );
    });

    test('retuns an invalid analysis if record is missing params contained in the schema', () {
      final record = defaultRecord.copyWith();
      final schema = {
        'reqStr': refs.str,
      };

      testAnalysisResult(
        defaultExpectedResult.copyWith(isValid: false, missingInRecord: {'reqStr'}),
        RecordAnalysis.from(record: record, schema: schema),
      );
    });
    test('retuns an invalid analysis if record contains params not contained in the schema', () {
      final record = defaultRecord.copyWith(
        namedFields: {'reqStr': refs.str, 'reqInt': refs.int},
      );
      final schema = {
        'reqStr': refs.str,
      };

      testAnalysisResult(
        defaultExpectedResult.copyWith(isValid: false, missingInSchema: {'reqInt'}),
        RecordAnalysis.from(record: record, schema: schema),
      );
    });
    test('retuns an invalid analysis if there is a type mismatch', () {
      final record = defaultRecord.copyWith(
        namedFields: {'reqStr': refs.double},
      );
      final schema = {
        'reqStr': refs.str,
      };

      testAnalysisResult(
        defaultExpectedResult.copyWith(
          isValid: false,
          typeMismatches: {'reqStr': (expectedType: 'String', actualType: 'double')},
        ),
        RecordAnalysis.from(record: record, schema: schema),
      );
    });

    test('analysis contains the original schema and record', () {
      final record = defaultRecord.copyWith(
        namedFields: {'reqStr': refs.double},
      );
      final schema = {
        'reqStr': refs.str,
      };

      final analysis = RecordAnalysis.from(record: record, schema: schema);

      expect(analysis.record, equals(record));
      expect(analysis.schema, equals(schema));
    });
  });
}
