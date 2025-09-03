import 'schema_parsing.dart';

/// A context for schema parsing errors, including schema field name and the annotated element name.
typedef ParseCtx = ({String schemaPropertyName, String annotatedElementName});

/// Provides an extension to format error summary
extension WriteErrorSummary on StringBuffer {
  /// Writes a string representation indented by two spaces for non-empty lines
  void writeErrorSummary(String errorSummary) {
    final intendedErrorSummary = errorSummary
        .split('\n')
        .map((line) => line.trim().isNotEmpty ? '  $line' : '')
        .join('\n');

    write(intendedErrorSummary);
  }
}

/// Converts [SchemaParsingError] instances into human-readable messages.
class SchemaParsingErrorFormatter {
  /// Creates a new [SchemaParsingErrorFormatter].
  const SchemaParsingErrorFormatter();

  static const _annotationName = '@ZodArt';

  /// Returns a human-readable error message for [error], based on parsing context [ctx].
  String getErrorText(SchemaParsingError error, ParseCtx ctx) {
    final (:schemaPropertyName, :annotatedElementName) = ctx;
    final schemaPath = '$annotatedElementName.$schemaPropertyName';
    final errorDetail = switch (error) {
      NotAClass() => 'annotation can be used only on a class.',

      NotAbstractClass() => 'make the annotated class `abstract`.',

      MissingSchemaField() => 'missing static field `$schemaPropertyName` in `$annotatedElementName`.',

      SchemaFieldIsNotRecord() => '`$schemaPath` should be defined using Record.',

      SchemaContainsPositionalFields() => '`$schemaPath` should contain ONLY named fields.',

      SchemaIsEmpty() => '`$schemaPath` cannot be empty.',

      OutputTypeIsNullable(outputTypeName: final outputClassName) =>
        "output type must not be nullable. Got: '$outputClassName'.",

      OutputClassIsUnknownType() => 'output type must be a class. Got an unknown type.',

      OutputClassIsWrongType(:final outputTypeName) => "output type must be a class. Got: '$outputTypeName'.",

      OutputRecordIsWrongType(:final outputTypeName) => "output type must be a record. Got: '$outputTypeName'.",

      InvalidNewClassName(:final newClassName) =>
        StringBuffer()
          ..writeln("inserted class name '$newClassName' is not a valid Dart class name.")
          ..writeln()
          ..write('See Dart documentation for more info.')
          ..toString(),

      OutputClassHasNoPublicCtor(:final outputClassName) =>
        StringBuffer()
          ..writeln('invalid output class.')
          ..writeln()
          ..writeln("Unable to generate class instantiation code for '$outputClassName'.")
          ..write('Class must contain a public constructor to be used for class instantiation.')
          ..toString(),

      OutputClassHasNoUsableCtor(:final pickedCtorName, :final outputClassName, :final errorSummary) =>
        StringBuffer()
          ..writeln('invalid output class.')
          ..writeln()
          ..writeln("Unable to generate class instantiation code for '$outputClassName'.")
          ..writeln("Autoselected constructor '$outputClassName.$pickedCtorName',")
          ..writeln('which scored highest but failed validation:')
          ..writeln()
          ..writeErrorSummary(errorSummary)
          ..toString(),

      InvalidOutputRecord(:final errorSummary) =>
        StringBuffer()
          ..writeln('invalid output record type.')
          ..writeln()
          ..writeln('Unable to generate record creation code.')
          ..writeln('The output record failed validation:')
          ..writeln()
          ..writeErrorSummary(errorSummary)
          ..toString(),

      InvalidSchemaPropertyType(:final dartTypeStr, :final propertyName) =>
        StringBuffer()
          ..writeln("expected a valid ZodArt type in '$schemaPath.$propertyName', got '$dartTypeStr'.")
          ..writeln()
          ..write('Make sure it is a valid ZodArt type and can be inferred correctly at build time.')
          ..toString(),
    };

    return '$_annotationName - $errorDetail';
  }
}
