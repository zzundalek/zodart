// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'freezed_integration.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [PersonSchema].
///
/// This corresponds to the structure described by [PersonSchema.schema].
typedef _PersonSchemaDef = ({
  ZNullableInt age,
  ZNullableBool disabled,
  ZString firstName,
  ZString lastName,
});

/// Enum for fields declared in [PersonSchema].
///
/// Values mirror the keys of [PersonSchema.schema].
enum PersonSchemaProps { age, disabled, firstName, lastName }

/// Helper class for [PersonSchema].
///
/// Wrapper used to access [PersonSchemaProps] values as getters.
final class _PersonSchemaPropsWrapper {
  const _PersonSchemaPropsWrapper();

  PersonSchemaProps get age => PersonSchemaProps.age;

  PersonSchemaProps get disabled => PersonSchemaProps.disabled;

  PersonSchemaProps get firstName => PersonSchemaProps.firstName;

  PersonSchemaProps get lastName => PersonSchemaProps.lastName;
}

/// Instantiates the output class [Person],
/// using the automatically selected constructor.
Person _instantiatePersonSchema({
  required String firstName,
  required String lastName,
  required int? age,
  required bool? disabled,
}) => Person(
  firstName: firstName,
  lastName: lastName,
  age: age,
  disabled: disabled,
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

  static const _keys = ['age', 'disabled', 'firstName', 'lastName'];

  static final Map<String, ZBase<dynamic>> _schemaMap = {
    'age': PersonSchema.schema.age,
    'disabled': PersonSchema.schema.disabled,
    'firstName': PersonSchema.schema.firstName,
    'lastName': PersonSchema.schema.lastName,
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
    age: val['age'] as int?,
    disabled: val['disabled'] as bool?,
    firstName: val['firstName'] as String,
    lastName: val['lastName'] as String,
  );
}
