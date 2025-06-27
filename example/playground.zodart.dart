// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playground.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [DerivedSchema].
///
/// This corresponds to the structure described by [DerivedSchema.schema].
typedef _$ZDerivedSchemaDef = ({ZString myTextik});

/// Inferred Dart type representing the successful result (value).
/// returned by `ZObject.parse()` for [DerivedSchema].
///
/// Derived from the schema defined in [DerivedSchema.schema].
typedef _$ZDerivedSchemaRes = ({String myTextik});

/// Enum for fields declared in [DerivedSchema].
///
/// Values mirror the keys of [DerivedSchema.schema].
enum DerivedSchemaProps { myTextik }

/// Helper class for [DerivedSchema].
///
/// Wrapper used to access [DerivedSchemaProps] values as getters.
final class _$ZDerivedSchemaPropsWrapper {
  const _$ZDerivedSchemaPropsWrapper();

  DerivedSchemaProps get myTextik => DerivedSchemaProps.myTextik;
}

/// Generated utility class for working with the schema defined in [DerivedSchema].
///
/// Provides access to:
/// - The `ZObject` instance for parsing/validating the schema.
/// - A `withMapper` function for mapping parsed record to custom objects.
/// - A `shape` descriptor containing field mappings and runtime type info.
/// - Enum-style access to the schema properties.
final class _$ZDerivedSchemaUtils
    implements
        ZGenSchemaUtils<_$ZDerivedSchemaPropsWrapper, _$ZDerivedSchemaRes> {
  const _$ZDerivedSchemaUtils();

  @override
  _$ZDerivedSchemaPropsWrapper get props =>
      const _$ZDerivedSchemaPropsWrapper();

  @override
  ZObject<_$ZDerivedSchemaRes> get zObject =>
      ZObject.withMapper(shape.toMap(), fromJson: shape.toRecord);

  @override
  ZObject<T> withMapper<T>(T Function(_$ZDerivedSchemaRes) mapper) {
    return ZObject.withMapper(
      shape.toMap(),
      fromJson: (val) {
        final rec = (myTextik: val['myTextik']) as _$ZDerivedSchemaRes;
        return mapper(rec);
      },
    );
  }

  @override
  ZGenSchemaShape<_$ZDerivedSchemaRes> get shape => (
    toMap: () => {'myTextik': DerivedSchema.schema.myTextik},
    toRecord: (Map<String, dynamic> val) => (myTextik: val['myTextik']),
    result: _$ZDerivedSchemaRes,
    schema: _$ZDerivedSchemaDef,
    keys: const ['myTextik'],
  );
}

/// Inferred Dart type returned from the schema defined in [MyEmbeddedSchema].
///
/// This corresponds to the structure described by [MyEmbeddedSchema.schema].
typedef _$ZMyEmbeddedSchemaDef = ({ZInt myInt, ZString myText});

/// Inferred Dart type representing the successful result (value).
/// returned by `ZObject.parse()` for [MyEmbeddedSchema].
///
/// Derived from the schema defined in [MyEmbeddedSchema.schema].
typedef _$ZMyEmbeddedSchemaRes = ({int myInt, String myText});

/// Enum for fields declared in [MyEmbeddedSchema].
///
/// Values mirror the keys of [MyEmbeddedSchema.schema].
enum MyEmbeddedSchemaProps { myInt, myText }

/// Helper class for [MyEmbeddedSchema].
///
/// Wrapper used to access [MyEmbeddedSchemaProps] values as getters.
final class _$ZMyEmbeddedSchemaPropsWrapper {
  const _$ZMyEmbeddedSchemaPropsWrapper();

  MyEmbeddedSchemaProps get myInt => MyEmbeddedSchemaProps.myInt;

  MyEmbeddedSchemaProps get myText => MyEmbeddedSchemaProps.myText;
}

/// Generated utility class for working with the schema defined in [MyEmbeddedSchema].
///
/// Provides access to:
/// - The `ZObject` instance for parsing/validating the schema.
/// - A `withMapper` function for mapping parsed record to custom objects.
/// - A `shape` descriptor containing field mappings and runtime type info.
/// - Enum-style access to the schema properties.
final class _$ZMyEmbeddedSchemaUtils
    implements
        ZGenSchemaUtils<
          _$ZMyEmbeddedSchemaPropsWrapper,
          _$ZMyEmbeddedSchemaRes
        > {
  const _$ZMyEmbeddedSchemaUtils();

  @override
  _$ZMyEmbeddedSchemaPropsWrapper get props =>
      const _$ZMyEmbeddedSchemaPropsWrapper();

  @override
  ZObject<_$ZMyEmbeddedSchemaRes> get zObject =>
      ZObject.withMapper(shape.toMap(), fromJson: shape.toRecord);

  @override
  ZObject<T> withMapper<T>(T Function(_$ZMyEmbeddedSchemaRes) mapper) {
    return ZObject.withMapper(
      shape.toMap(),
      fromJson: (val) {
        final rec =
            (myInt: val['myInt'], myText: val['myText'])
                as _$ZMyEmbeddedSchemaRes;
        return mapper(rec);
      },
    );
  }

  @override
  ZGenSchemaShape<_$ZMyEmbeddedSchemaRes> get shape => (
    toMap: () => {
      'myInt': MyEmbeddedSchema.schema.myInt,
      'myText': MyEmbeddedSchema.schema.myText,
    },
    toRecord: (Map<String, dynamic> val) =>
        (myInt: val['myInt'], myText: val['myText']),
    result: _$ZMyEmbeddedSchemaRes,
    schema: _$ZMyEmbeddedSchemaDef,
    keys: const ['myInt', 'myText'],
  );
}

/// Inferred Dart type returned from the schema defined in [MySchema].
///
/// This corresponds to the structure described by [MySchema.schema].
typedef _$ZMySchemaDef = ({
  ZNullableInt age,
  ZString name,
  ZObject<MyClass> obj,
});

/// Inferred Dart type representing the successful result (value).
/// returned by `ZObject.parse()` for [MySchema].
///
/// Derived from the schema defined in [MySchema.schema].
typedef _$ZMySchemaRes = ({int? age, String name, MyClass obj});

/// Enum for fields declared in [MySchema].
///
/// Values mirror the keys of [MySchema.schema].
enum MySchemaProps { age, name, obj }

/// Helper class for [MySchema].
///
/// Wrapper used to access [MySchemaProps] values as getters.
final class _$ZMySchemaPropsWrapper {
  const _$ZMySchemaPropsWrapper();

  MySchemaProps get age => MySchemaProps.age;

  MySchemaProps get name => MySchemaProps.name;

  MySchemaProps get obj => MySchemaProps.obj;
}

/// Generated utility class for working with the schema defined in [MySchema].
///
/// Provides access to:
/// - The `ZObject` instance for parsing/validating the schema.
/// - A `withMapper` function for mapping parsed record to custom objects.
/// - A `shape` descriptor containing field mappings and runtime type info.
/// - Enum-style access to the schema properties.
final class _$ZMySchemaUtils
    implements ZGenSchemaUtils<_$ZMySchemaPropsWrapper, _$ZMySchemaRes> {
  const _$ZMySchemaUtils();

  @override
  _$ZMySchemaPropsWrapper get props => const _$ZMySchemaPropsWrapper();

  @override
  ZObject<_$ZMySchemaRes> get zObject =>
      ZObject.withMapper(shape.toMap(), fromJson: shape.toRecord);

  @override
  ZObject<T> withMapper<T>(T Function(_$ZMySchemaRes) mapper) {
    return ZObject.withMapper(
      shape.toMap(),
      fromJson: (val) {
        final rec =
            (age: val['age'], name: val['name'], obj: val['obj'])
                as _$ZMySchemaRes;
        return mapper(rec);
      },
    );
  }

  @override
  ZGenSchemaShape<_$ZMySchemaRes> get shape => (
    toMap: () => {
      'age': MySchema.schema.age,
      'name': MySchema.schema.name,
      'obj': MySchema.schema.obj,
    },
    toRecord: (Map<String, dynamic> val) =>
        (age: val['age'], name: val['name'], obj: val['obj']),
    result: _$ZMySchemaRes,
    schema: _$ZMySchemaDef,
    keys: const ['age', 'name', 'obj'],
  );
}
