/// A map of schema property names to their ZodArt type string (input) and output type string.
typedef SchemaMap = Map<String, ({String zType, String outType})>;

/// Represents a parsed schema with ZodArt (input) and output type information.
///
/// Provides convenient accessors for schema property names and
/// separate maps for ZodArt types(input) and output types.
class Schema {
  /// Creates a [Schema] from the underlying [schemaMap].
  const Schema(SchemaMap schemaMap) : _schemaMap = schemaMap;

  /// Returns all property names in the schema.
  Set<String> get propertyNames => _schemaMap.keys.toSet();

  /// Returns a map of property names to their ZodArt type(input) strings.
  Map<String, String> get zSchema => _schemaMap.map((key, type) => MapEntry(key, type.zType));

  /// Returns a map of property names to their output type strings.
  ///
  /// Output type is equal to the result type after calling `.parse()` assuming parse success.
  Map<String, String> get outSchema => _schemaMap.map((key, type) => MapEntry(key, type.outType));

  final SchemaMap _schemaMap;
}
