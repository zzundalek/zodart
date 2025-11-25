// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'simple_compose.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [ObjSchema].
///
/// This corresponds to the structure described by [ObjSchema.schema].
typedef _ObjSchemaDef = ({ZNullableInt intVal, ZString strVal});

/// Enum for fields declared in [ObjSchema].
///
/// Values mirror the keys of [ObjSchema.schema].
enum ObjSchemaProps { intVal, strVal }

/// Helper class for [ObjSchema].
///
/// Wrapper used to access [ObjSchemaProps] values as getters.
final class _ObjSchemaPropsWrapper {
  const _ObjSchemaPropsWrapper();

  ObjSchemaProps get intVal => ObjSchemaProps.intVal;

  ObjSchemaProps get strVal => ObjSchemaProps.strVal;
}

/// Mixin used as interface for [Obj].
///
/// Providing getters and overriding methods.
mixin _ObjSchema {
  int? get intVal;
  String get strVal;
  @override
  int get hashCode => Object.hash(runtimeType, intVal, strVal);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            other is Obj &&
            (identical(intVal, other.intVal) || intVal == other.intVal) &&
            (identical(strVal, other.strVal) || strVal == other.strVal));
  }

  @override
  String toString() {
    return 'Obj(intVal: $intVal, strVal: $strVal)';
  }
}

/// Class used as implementation for [Obj] and [_ObjSchema].
///
/// Providing fields and a default constructor.
final class _ObjSchemaImpl with _ObjSchema implements Obj {
  const _ObjSchemaImpl({required this.intVal, required this.strVal});

  @override
  final int? intVal;

  @override
  final String strVal;
}

/// Instantiates the output class [Obj] using [_ObjSchemaImpl].
Obj _instantiateObjSchema({required int? intVal, required String strVal}) =>
    _ObjSchemaImpl(intVal: intVal, strVal: strVal);

/// Generated utility class for working with the schema defined in [ObjSchema].
///
/// Provides:
/// - The `ZObject` instance for parsing/validating the schema.
/// - Enum-style access to the schema properties.
/// - Strongly-typed field access
/// - Runtime `Type` of the schema record
final class _ObjSchemaUtils
    implements ZGenSchemaUtils<_ObjSchemaPropsWrapper, Obj> {
  const _ObjSchemaUtils();

  static const _props = _ObjSchemaPropsWrapper();

  static const _keys = ['intVal', 'strVal'];

  static final Map<String, ZBase<dynamic>> _schemaMap = {
    'intVal': ObjSchema.schema.intVal,
    'strVal': ObjSchema.schema.strVal,
  };

  @override
  _ObjSchemaPropsWrapper get props => _props;

  @override
  List<String> get keys => _keys;

  @override
  ZObject<Obj> get zObject {
    return ZObject.withMapper(_schemaMap, fromJson: _toResult);
  }

  @override
  Type get schema => _ObjSchemaDef;

  Obj _toResult(Map<String, dynamic> val) => _instantiateObjSchema(
    intVal: val['intVal'] as int?,
    strVal: val['strVal'] as String,
  );
}
