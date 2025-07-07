// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refine_example.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [PersonSchema].
///
/// This corresponds to the structure described by [PersonSchema.schema].
typedef _$ZPersonSchemaDef = ({
  ZString firstName,
  ZString lastName,
  ZDateTime validFrom,
  ZNullableDateTime validTo,
});

/// Inferred Dart type representing the successful result (value).
/// returned by `ZObject.parse()` for [PersonSchema].
///
/// Derived from the schema defined in [PersonSchema.schema].
typedef _$ZPersonSchemaRes = ({
  String firstName,
  String lastName,
  DateTime validFrom,
  DateTime? validTo,
});

/// Enum for fields declared in [PersonSchema].
///
/// Values mirror the keys of [PersonSchema.schema].
enum PersonSchemaProps { firstName, lastName, validFrom, validTo }

/// Helper class for [PersonSchema].
///
/// Wrapper used to access [PersonSchemaProps] values as getters.
final class _$ZPersonSchemaPropsWrapper {
  const _$ZPersonSchemaPropsWrapper();

  PersonSchemaProps get firstName => PersonSchemaProps.firstName;

  PersonSchemaProps get lastName => PersonSchemaProps.lastName;

  PersonSchemaProps get validFrom => PersonSchemaProps.validFrom;

  PersonSchemaProps get validTo => PersonSchemaProps.validTo;
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
                  firstName: val['firstName'],
                  lastName: val['lastName'],
                  validFrom: val['validFrom'],
                  validTo: val['validTo'],
                )
                as _$ZPersonSchemaRes;
        return mapper(rec);
      },
    );
  }

  @override
  ZGenSchemaShape<_$ZPersonSchemaRes> get shape => (
    toMap: () => {
      'firstName': PersonSchema.schema.firstName,
      'lastName': PersonSchema.schema.lastName,
      'validFrom': PersonSchema.schema.validFrom,
      'validTo': PersonSchema.schema.validTo,
    },
    toRecord: (Map<String, dynamic> val) => (
      firstName: val['firstName'],
      lastName: val['lastName'],
      validFrom: val['validFrom'],
      validTo: val['validTo'],
    ),
    result: _$ZPersonSchemaRes,
    schema: _$ZPersonSchemaDef,
    keys: const ['firstName', 'lastName', 'validFrom', 'validTo'],
  );
}
