import '../zodart_base.dart';

/// Utility interface for schema-generated classes providing type-safe mapping to `ZObject`.
///
/// Implemented by generated utility classes to:
/// - Expose strongly-typed field access via `props`
/// - Allow access to the wrapped `ZObject` instance via `zObject`
/// - Expose list of all top-level field keys defined in the schema via `keys`
/// - Expose the runtime `Type` of the schema record via `schema`
///
/// This abstraction helps ensure type safety and adds syntactic sugar for working with
/// ZObject-based schemas in a more declarative and ergonomic way.
abstract class ZGenSchemaUtils<Props, ParseRes extends Object> {
  /// Enum-like access to field keys (e.g., for serialization or obtaining parse issues for a field).
  Props get props;

  /// Internal `ZObject` with default mapping to a [Record].
  ZObject<ParseRes> get zObject;

  /// List of top level field keys defined in the schema.
  List<String> get keys;

  /// The inferred type of the schema record.
  Type get schema;
}
