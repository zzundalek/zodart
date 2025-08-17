// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [PersonSchema].
///
/// This corresponds to the structure described by [PersonSchema.schema].
typedef _PersonSchemaDef = ({
  ZNullableInt age,
  ZString firstName,
  ZString lastName,
});

/// Enum for fields declared in [PersonSchema].
///
/// Values mirror the keys of [PersonSchema.schema].
enum PersonSchemaProps { age, firstName, lastName }

/// Helper class for [PersonSchema].
///
/// Wrapper used to access [PersonSchemaProps] values as getters.
final class _PersonSchemaPropsWrapper {
  const _PersonSchemaPropsWrapper();

  PersonSchemaProps get age => PersonSchemaProps.age;

  PersonSchemaProps get firstName => PersonSchemaProps.firstName;

  PersonSchemaProps get lastName => PersonSchemaProps.lastName;
}

/// Mixin used as interface for [Person].
///
/// Providing getters and overriding methods.
mixin _PersonSchema {
  int? get age;
  String get firstName;
  String get lastName;
  @override
  int get hashCode => Object.hash(runtimeType, age, firstName, lastName);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            other is Person &&
            (identical(age, other.age) || age == other.age) &&
            (identical(firstName, other.firstName) ||
                firstName == other.firstName) &&
            (identical(lastName, other.lastName) ||
                lastName == other.lastName));
  }

  @override
  String toString() {
    return 'Person(age: $age, firstName: $firstName, lastName: $lastName)';
  }
}

/// Class used as implementation for [Person] and [_PersonSchema].
///
/// Providing fields and a default constructor.
final class _PersonSchemaImpl with _PersonSchema implements Person {
  const _PersonSchemaImpl({
    required this.age,
    required this.firstName,
    required this.lastName,
  });

  @override
  final int? age;

  @override
  final String firstName;

  @override
  final String lastName;
}

/// Instantiates the output class [Person] using [_PersonSchemaImpl].
Person _instantiatePersonSchema({
  required int? age,
  required String firstName,
  required String lastName,
}) => _PersonSchemaImpl(age: age, firstName: firstName, lastName: lastName);

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

  static const _keys = ['age', 'firstName', 'lastName'];

  static final Map<String, ZBase<dynamic>> _schemaMap = {
    'age': PersonSchema.schema.age,
    'firstName': PersonSchema.schema.firstName,
    'lastName': PersonSchema.schema.lastName,
  };

  @override
  _PersonSchemaPropsWrapper get props => _props;

  @override
  List<String> get keys => _keys;

  @override
  ZObject<Person> get zObject =>
      ZObject.withMapper(_schemaMap, fromJson: _toResult);

  @override
  Type get schema => _PersonSchemaDef;

  Person _toResult(Map<String, dynamic> val) => _instantiatePersonSchema(
    age: val['age'] as int?,
    firstName: val['firstName'] as String,
    lastName: val['lastName'] as String,
  );
}
