import 'package:meta/meta.dart';

import 'z_issue.dart';
import 'z_typedefs.dart';
import 'zodart_exceptions.dart';

// ! To ensure type-safety while avoid poluting ZObject with generics needed for the cross-field validation
// ! proper types are ensured on all public apis, but kept unsafe(dynamic) in the internal representation.

/// Cross-field validator function type.
///
/// Returns `null` on validation success,
/// or a [SuperRefinerErrorRes] on validation failure.
typedef CrossFieldValidator<G extends ParsedFieldAccessor> = SuperRefinerErrorRes? Function(G fieldValues);

/// Factory function type for creating [ParsedFieldAccessor] instances.
///
/// Used to construct concrete (child) implementations of
/// [ParsedFieldAccessor] from a schema and parsed field values.
typedef ParsedFieldAccessorFactory<G extends ParsedFieldAccessor> =
    G Function(ObjectSchema schema, Map<String, dynamic> parsedValues);

/// Exception thrown when the field value is not ready
///
/// This exception is used to skip an execution of [CrossFieldValidator],
/// when a field value used in the validation is not ready (i.e. parse result is not success)
@internal
class ParsedFieldValueNotReadyException implements Exception {}

/// Exception thrown at [ParsedFieldAccessor] when consumer is trying to access a field,
/// which is not defined in the schema.
class FieldNotInSchemaAccessorException implements ZConsumerCausedException {
  /// Default constructor to create the instance.
  const FieldNotInSchemaAccessorException({required this.fieldName, required this.schemaFieldNames});

  /// Name of the field which is not in the schema.
  final String fieldName;

  /// List of all field names in the schema.
  final List<String> schemaFieldNames;

  @override
  String toString() =>
      'FieldNotInSchemaAccessorException: Field "$fieldName" is not defined in the schema. '
      'Available fields are: $schemaFieldNames.';
}

/// Internal unsafe representation of `ParsedFieldAccessorFactory`.
@internal
typedef UnsafeParsedFieldAccessorFactory = dynamic Function(ObjectSchema schema, Map<String, dynamic> parsedValues);

/// Internal unsafe representation of `CrossFieldValidator`'s list.
@internal
typedef UnsafeCrossFieldValidators = List<dynamic>;

/// Internal unsafe record type that groups the dependencies required for
/// cross-field validation.
@internal
typedef UnsafeCrossFieldValidation = ({
  UnsafeCrossFieldValidators crossValidators,
  UnsafeParsedFieldAccessorFactory parsedFieldAccessorFactory,
});

/// Class used to access parse result of fields during `ZObject` parsing before the object is created.
class ParsedFieldAccessor {
  /// Default ctor to construct the instance.
  ParsedFieldAccessor(ObjectSchema schema, Map<String, dynamic> parsedValues)
    : _parsedValues = Map.unmodifiable(parsedValues),
      _schema = Map.unmodifiable(schema);

  final Map<String, dynamic> _parsedValues;
  final ObjectSchema _schema;

  /// Operator to access a parsed field value in dev-friendly manner, `e.g. values['firstName']`
  ///
  /// - Throws [FieldNotInSchemaAccessorException] if the field is NOT defined in the schema.
  /// - Throws [ParsedFieldValueNotReadyException] if the field is NOT included in `parsedValues`.
  /// - Returns the parsed field value otherwise.
  dynamic operator [](String fieldName) {
    if (!_schema.containsKey(fieldName)) {
      throw FieldNotInSchemaAccessorException(fieldName: fieldName, schemaFieldNames: List.unmodifiable(_schema.keys));
    }

    if (!_parsedValues.containsKey(fieldName)) {
      throw ParsedFieldValueNotReadyException();
    }

    return _parsedValues[fieldName];
  }
}

/// A factory to construct an instace of [CrossFieldValidationExecutor].
typedef CrossFieldValidationExecutorFactory =
    CrossFieldValidationExecutor Function(UnsafeCrossFieldValidation crossFieldValidation);

/// A helper class to execute the [UnsafeCrossFieldValidation] and collect results.
class CrossFieldValidationExecutor {
  /// Default constructor to create the instance.
  const CrossFieldValidationExecutor(UnsafeCrossFieldValidation crossValidation) : _crossValidation = crossValidation;

  final UnsafeCrossFieldValidation _crossValidation;

  /// Execute all validators defined at [_crossValidation] and returns a list of [ZIssue]s for validation failures.
  ///
  /// Validators which try to access a field which doesn't have a parsed value ready
  /// (i.e. parse result is not success), are skipped.
  List<ZIssue> execute({
    required Map<String, dynamic> succesfullyParsedValues,
    required ObjectSchema schema,
  }) {
    final (:crossValidators, :parsedFieldAccessorFactory) = _crossValidation;
    final parsedValueAccessor = parsedFieldAccessorFactory(schema, succesfullyParsedValues);

    final zIssues = <ZIssue>[];
    for (final crossValidator in crossValidators) {
      try {
        // Needed as the internal representation is kept unsafe on purpose.
        // ignore: avoid_dynamic_calls
        final validatorResult = crossValidator(parsedValueAccessor) as SuperRefinerErrorRes?;
        if (validatorResult != null) {
          zIssues.addAll([validatorResult.$1, ...validatorResult.others]);
        }
      } on ParsedFieldValueNotReadyException catch (_) {
        continue;
      }
    }

    return zIssues;
  }
}
