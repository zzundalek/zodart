import '../zodart_base.dart';

/// Utility interface for schema-generated classes providing type-safe mapping to `ZObject`.
///
/// Implemented by generated utility classes to:
/// - Expose strongly-typed field access via `props`
/// - Provide schema metadata and validation helpers via `shape`
/// - Allow access to the wrapped `ZObject` instance via `zObject`
///
/// This abstraction helps ensure type safety and adds syntactic sugar for working with
/// ZObject-based schemas in a more declarative and ergonomic way.
abstract class ZGenSchemaUtils<Props, ParseRes> {
  /// Enum-like access to field keys (e.g., for serialization or obtaining parse issues for a field).
  Props get props;

  /// Schema definition including shape and validation rules.
  ZGenSchemaShape<ParseRes> get shape;

  /// Internal `ZObject` with default mapping to a [Record].
  ZObject<ParseRes> get zObject;
}

/// Internal metadata structure describing the shape of a `ZObject` schema.
///
/// Used by generated utility classes to support type-safe conversion between
/// raw map data and strongly typed types, as well as for introspection.
///
/// - `toSchemaMap`: Returns a lazily evaluated map of schema fields.
/// - `toResult`: Converts a parsed value (in a map structure) into the expected result.
/// - `keys`: List of all top-level field keys defined in the schema.
/// - `schema`: The runtime `Type` of the schema record
/// - `result`: The runtime `Type` of the resulting parsed record (e.g., `({name: String})`).
typedef ZGenSchemaShape<ParseRes> = ({
  /// Returns the schema as a map of field definitions.
  ZSchema Function() toSchemaMap,

  /// Converts a parsed value (`Map<String, dynamic>`) into the expected result.
  ParseRes Function(Map<String, dynamic> parsedVal) toResult,

  /// List of top level field keys defined in the schema.
  List<String> keys,

  /// The inferred type of the schema record.
  Type schema,

  /// The inferred type of the parsed result value (typically a record).
  Type result,
});
