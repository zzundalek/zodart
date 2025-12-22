// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// coverage:ignore-file
// ignore_for_file: type=lint

part of 'cross_field_validation.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [UserSchema].
///
/// This corresponds to the structure described by [UserSchema.schema].
typedef _UserSchemaDef = ({
  ZString name,
  ZDateTime validFrom,
  ZNullableDateTime validTo,
});

/// Enum for fields declared in [UserSchema].
///
/// Values mirror the keys of [UserSchema.schema].
enum UserSchemaProps { name, validFrom, validTo }

/// Helper class for [UserSchema].
///
/// Wrapper used to access [UserSchemaProps] values as getters.
final class _UserSchemaPropsWrapper {
  const _UserSchemaPropsWrapper();

  UserSchemaProps get name => UserSchemaProps.name;

  UserSchemaProps get validFrom => UserSchemaProps.validFrom;

  UserSchemaProps get validTo => UserSchemaProps.validTo;
}

/// Mixin used as interface for [User].
///
/// Providing getters and overriding methods.
mixin _UserSchema {
  String get name;
  DateTime get validFrom;
  DateTime? get validTo;
  @override
  int get hashCode => Object.hash(runtimeType, name, validFrom, validTo);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            other is User &&
            (identical(name, other.name) || name == other.name) &&
            (identical(validFrom, other.validFrom) ||
                validFrom == other.validFrom) &&
            (identical(validTo, other.validTo) || validTo == other.validTo));
  }

  @override
  String toString() {
    return 'User(name: $name, validFrom: $validFrom, validTo: $validTo)';
  }
}

/// Class used as implementation for [User] and [_UserSchema].
///
/// Providing fields and a default constructor.
final class _UserSchemaImpl with _UserSchema implements User {
  const _UserSchemaImpl({
    required this.name,
    required this.validFrom,
    required this.validTo,
  });

  @override
  final String name;

  @override
  final DateTime validFrom;

  @override
  final DateTime? validTo;
}

/// Instantiates the output class [User] using [_UserSchemaImpl].
User _instantiateUserSchema({
  required String name,
  required DateTime validFrom,
  required DateTime? validTo,
}) => _UserSchemaImpl(name: name, validFrom: validFrom, validTo: validTo);

/// Generated utility class for working with the schema defined in [UserSchema].
///
/// Provides:
/// - The `ZObject` instance for parsing/validating the schema.
/// - Enum-style access to the schema properties.
/// - Strongly-typed field access
/// - Runtime `Type` of the schema record
final class _UserSchemaUtils
    implements ZGenSchemaUtils<_UserSchemaPropsWrapper, User> {
  const _UserSchemaUtils();

  static const _props = _UserSchemaPropsWrapper();

  static const _keys = ['name', 'validFrom', 'validTo'];

  static final Map<String, ZBase<dynamic>> _schemaMap = {
    'name': UserSchema.schema.name,
    'validFrom': UserSchema.schema.validFrom,
    'validTo': UserSchema.schema.validTo,
  };

  @override
  _UserSchemaPropsWrapper get props => _props;

  @override
  List<String> get keys => _keys;

  @override
  ZObject<User> get zObject {
    return ZObject.withTypedCrossFieldValidation(
      _schemaMap,
      fromJson: _toResult,
      crossValidators: <CrossFieldValidator<UserSchemaFieldAccessor>>[
        validateFromTo,
      ],
      parsedFieldAccessorFactory: UserSchemaFieldAccessor.new,
    );
  }

  @override
  Type get schema => _UserSchemaDef;

  User _toResult(Map<String, dynamic> val) => _instantiateUserSchema(
    name: val['name'] as String,
    validFrom: val['validFrom'] as DateTime,
    validTo: val['validTo'] as DateTime?,
  );
}

/// Type-safe parsed fields accessor for [UserSchema].
class UserSchemaFieldAccessor extends ParsedFieldAccessor {
  UserSchemaFieldAccessor(super.schema, super.parsedValues);

  String get name => (this['name'] as String);

  DateTime get validFrom => (this['validFrom'] as DateTime);

  DateTime? get validTo => (this['validTo'] as DateTime?);
}
