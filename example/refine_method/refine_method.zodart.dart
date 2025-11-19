// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'refine_method.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [PersonSchema].
///
/// This corresponds to the structure described by [PersonSchema.schema].
typedef _PersonSchemaDef = ({
  ZString firstName,
  ZString lastName,
  ZInt validFrom,
  ZNullableInt validTo,
});

/// Enum for fields declared in [PersonSchema].
///
/// Values mirror the keys of [PersonSchema.schema].
enum PersonSchemaProps { firstName, lastName, validFrom, validTo }

/// Helper class for [PersonSchema].
///
/// Wrapper used to access [PersonSchemaProps] values as getters.
final class _PersonSchemaPropsWrapper {
  const _PersonSchemaPropsWrapper();

  PersonSchemaProps get firstName => PersonSchemaProps.firstName;

  PersonSchemaProps get lastName => PersonSchemaProps.lastName;

  PersonSchemaProps get validFrom => PersonSchemaProps.validFrom;

  PersonSchemaProps get validTo => PersonSchemaProps.validTo;
}

/// Mixin used as interface for [Person].
///
/// Providing getters and overriding methods.
mixin _PersonSchema {
  String get firstName;
  String get lastName;
  int get validFrom;
  int? get validTo;
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, validFrom, validTo);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            other is Person &&
            (identical(firstName, other.firstName) ||
                firstName == other.firstName) &&
            (identical(lastName, other.lastName) ||
                lastName == other.lastName) &&
            (identical(validFrom, other.validFrom) ||
                validFrom == other.validFrom) &&
            (identical(validTo, other.validTo) || validTo == other.validTo));
  }

  @override
  String toString() {
    return 'Person(firstName: $firstName, lastName: $lastName, validFrom: $validFrom, validTo: $validTo)';
  }
}

/// Class used as implementation for [Person] and [_PersonSchema].
///
/// Providing fields and a default constructor.
final class _PersonSchemaImpl with _PersonSchema implements Person {
  const _PersonSchemaImpl({
    required this.firstName,
    required this.lastName,
    required this.validFrom,
    required this.validTo,
  });

  @override
  final String firstName;

  @override
  final String lastName;

  @override
  final int validFrom;

  @override
  final int? validTo;
}

/// Instantiates the output class [Person] using [_PersonSchemaImpl].
Person _instantiatePersonSchema({
  required String firstName,
  required String lastName,
  required int validFrom,
  required int? validTo,
}) => _PersonSchemaImpl(
  firstName: firstName,
  lastName: lastName,
  validFrom: validFrom,
  validTo: validTo,
);

/// Generated utility class for working with the schema defined in [PersonSchema].
///
/// Provides:
/// - The `ZObject` instance for parsing/validating the schema.
/// - Enum-style access to the schema properties.
/// - Strongly-typed field access
/// - Runtime `Type` of the schema record
final class _PersonSchemaUtils
    implements ZGenSchemaUtils<_PersonSchemaPropsWrapper, Person> {
  const _PersonSchemaUtils();

  static const _props = _PersonSchemaPropsWrapper();

  static const _keys = ['firstName', 'lastName', 'validFrom', 'validTo'];

  static final Map<String, ZBase<dynamic>> _schemaMap = {
    'firstName': PersonSchema.schema.firstName,
    'lastName': PersonSchema.schema.lastName,
    'validFrom': PersonSchema.schema.validFrom,
    'validTo': PersonSchema.schema.validTo,
  };

  @override
  _PersonSchemaPropsWrapper get props => _props;

  @override
  List<String> get keys => _keys;

  @override
  ZObject<Person> get zObject {
    return ZObject.withMapper(_schemaMap, fromJson: _toResult);
  }

  @override
  Type get schema => _PersonSchemaDef;

  Person _toResult(Map<String, dynamic> val) => _instantiatePersonSchema(
    firstName: val['firstName'] as String,
    lastName: val['lastName'] as String,
    validFrom: val['validFrom'] as int,
    validTo: val['validTo'] as int?,
  );
}
