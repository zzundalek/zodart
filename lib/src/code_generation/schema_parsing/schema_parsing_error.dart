/// Base class for all schema parsing errors.
sealed class SchemaParsingError {
  /// Default constructor.
  const SchemaParsingError();
}

/// Annotated target is not a class.
class NotAClass extends SchemaParsingError {
  /// Creates a [NotAClass] error.
  const NotAClass();
}

/// Annotated class must be abstract.
class NotAbstractClass extends SchemaParsingError {
  /// Creates a [NotAbstractClass] error.
  const NotAbstractClass();
}

/// Missing static schema field in the annotated class.
class MissingSchemaField extends SchemaParsingError {
  /// Creates a [MissingSchemaField] error.
  const MissingSchemaField();
}

/// The schema field must be a Record.
class SchemaFieldIsNotRecord extends SchemaParsingError {
  /// Creates a [SchemaFieldIsNotRecord] error.
  const SchemaFieldIsNotRecord();
}

/// The schema field must not contain any positional fields.
class SchemaContainsPositionalFields extends SchemaParsingError {
  /// Creates a [SchemaContainsPositionalFields] error.
  const SchemaContainsPositionalFields();
}

/// The schema record is empty (= doesn't contain any named fields).
class SchemaIsEmpty extends SchemaParsingError {
  /// Creates a [SchemaIsEmpty] error.
  const SchemaIsEmpty();
}

/// Output class is nullable, which is not allowed.
class OutputClassIsNullable extends SchemaParsingError {
  /// Creates an [OutputClassIsNullable] error with the given class name.
  const OutputClassIsNullable({required this.outputClassName});

  /// The name of the nullable output class.
  final String outputClassName;
}

/// Output class type could not be resolved.
///
/// Note: Used when reusing an existing class.
class OutputClassIsUnknownType extends SchemaParsingError {
  /// Creates an [OutputClassIsUnknownType] error.
  const OutputClassIsUnknownType();
}

/// Output type is not a valid class.
///
/// Note: Used when reusing an existing class.
class OutputClassIsWrongType extends SchemaParsingError {
  /// Creates an [OutputClassIsWrongType] error with the given type name.
  const OutputClassIsWrongType({required this.outputTypeName});

  /// The name of the invalid type.
  final String outputTypeName;
}

/// Output class has no public constructor.
///
/// Note: Used when reusing an existing class.
class OutputClassHasNoPublicCtor extends SchemaParsingError {
  /// Creates an [OutputClassHasNoPublicCtor] error with the given class name.
  const OutputClassHasNoPublicCtor({required this.outputClassName});

  /// The name of the class without a public constructor.
  final String outputClassName;
}

/// Selected constructor is unusable.
///
/// Note: Used when reusing an existing class.
class OutputClassHasNoUsableCtor extends SchemaParsingError {
  /// Creates an [OutputClassHasNoUsableCtor] error with details.
  const OutputClassHasNoUsableCtor({
    required this.outputClassName,
    required this.pickedCtorName,
    required this.errorSummary,
  });

  /// The name of the output class.
  final String outputClassName;

  /// The name of the constructor that was selected.
  final String pickedCtorName;

  /// Explanation of why the constructor was unusable.
  final String errorSummary;
}

/// Schema property has an invalid Dart type.
class InvalidSchemaPropertyType extends SchemaParsingError {
  /// Creates an [InvalidSchemaPropertyType] error with details.
  const InvalidSchemaPropertyType({
    required this.dartTypeStr,
    required this.propertyName,
  });

  /// The string representation of the invalid Dart type.
  final String dartTypeStr;

  /// The name of the invalid property.
  final String propertyName;
}

/// Generated class name is invalid.
///
/// Note: Used when generation a new class.
class InvalidNewClassName extends SchemaParsingError {
  /// Creates an [InvalidNewClassName] error with the given name.
  const InvalidNewClassName({required this.newClassName});

  /// The invalid class name.
  final String newClassName;
}
