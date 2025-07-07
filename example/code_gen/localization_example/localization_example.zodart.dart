// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_example.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [PersonSchema].
///
/// This corresponds to the structure described by [PersonSchema.schema].
typedef _$ZPersonSchemaDef = ({
  ZNullableInt age,
  ZString firstName,
  ZString lastName,
});

/// Inferred Dart type representing the successful result (value).
/// returned by `ZObject.parse()` for [PersonSchema].
///
/// Derived from the schema defined in [PersonSchema.schema].
typedef _$ZPersonSchemaRes = ({int? age, String firstName, String lastName});

/// Enum for fields declared in [PersonSchema].
///
/// Values mirror the keys of [PersonSchema.schema].
enum PersonSchemaProps { age, firstName, lastName }

/// Helper class for [PersonSchema].
///
/// Wrapper used to access [PersonSchemaProps] values as getters.
final class _$ZPersonSchemaPropsWrapper {
  const _$ZPersonSchemaPropsWrapper();

  PersonSchemaProps get age => PersonSchemaProps.age;

  PersonSchemaProps get firstName => PersonSchemaProps.firstName;

  PersonSchemaProps get lastName => PersonSchemaProps.lastName;
}

/// Generated utility class for working with the schema defined in [PersonSchema].
///
/// Provides access to:
/// - The `ZObject` instance for parsing/validating the schema.
/// - A `withMapper` function for mapping parsed record to custom objects.
/// - A `shape` descriptor containing field mappings and runtime type info.
/// - Enum-style access to the schema properties.
final class _$ZPersonSchemaUtils
    implements
        ZGenSchemaUtils<_$ZPersonSchemaPropsWrapper, _$ZPersonSchemaRes> {
  const _$ZPersonSchemaUtils();

  @override
  _$ZPersonSchemaPropsWrapper get props => const _$ZPersonSchemaPropsWrapper();

  @override
  ZObject<_$ZPersonSchemaRes> get zObject {
    return ZObject.withMapper(shape.toMap(), fromJson: shape.toRecord);
  }

  @override
  ZObject<T> withMapper<T>(T Function(_$ZPersonSchemaRes) mapper) {
    return ZObject.withMapper(
      shape.toMap(),
      fromJson: (val) {
        final rec =
            (
                  age: val['age'],
                  firstName: val['firstName'],
                  lastName: val['lastName'],
                )
                as _$ZPersonSchemaRes;
        return mapper(rec);
      },
    );
  }

  @override
  ZGenSchemaShape<_$ZPersonSchemaRes> get shape => (
    toMap: () => {
      'age': PersonSchema.schema.age,
      'firstName': PersonSchema.schema.firstName,
      'lastName': PersonSchema.schema.lastName,
    },
    toRecord: (Map<String, dynamic> val) => (
      age: val['age'],
      firstName: val['firstName'],
      lastName: val['lastName'],
    ),
    result: _$ZPersonSchemaRes,
    schema: _$ZPersonSchemaDef,
    keys: const ['age', 'firstName', 'lastName'],
  );
}
