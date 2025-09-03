import 'package:code_builder/code_builder.dart';

import '../../utils/utils.dart';

/// Record holding optional string representations of expected and actual types.
typedef TypeMismatch = ({String? expectedType, String? actualType});

/// Analyzes an entity against a schema to detect missing parameters and type mismatches.
abstract class EntityAnalysis {
  /// Return a new instance of [EntityAnalysis].
  const EntityAnalysis();

  /// The expected schema mapping parameter names to their types.
  Map<String, Reference> get schema;

  /// Parameter names present in the schema but missing in the analyzed entity.
  Set<String> get missingInEntity;

  /// Parameter names present in the analyzed entity but missing in the schema.
  Set<String> get missingInSchema;

  /// Map of parameter names to their expected and actual type mismatches.
  Map<String, TypeMismatch> get typeMismatches;

  /// Whether the analyzed entity has any required positional parameters.
  bool get hasReqPositionalParams;

  /// Whether the analyzed entity has any optional positional parameters.
  bool get hasOptPositionalParams;

  /// Whether the entity is valid with no missing or mismatched parameters.
  ///
  /// Includes a strict check disallowing any optional positional parameters.
  bool get isValid {
    final errorsCount =
        missingInSchema.length + missingInEntity.length + typeMismatches.length + (hasReqPositionalParams ? 1 : 0);

    final warnningsCount = (hasOptPositionalParams ? 1 : 0);

    // NOTE: strict mode (don't allow any optional positional parameters)
    return errorsCount + warnningsCount == 0;
  }

  /// Returns a map of parameter names to [TypeMismatch]s for keys present in both [expected] and [actual].
  ///
  /// A mismatch is recorded if the type [Reference]s differ for the same key.
  /// Only keys present in both maps are compared. Throws if a shared key is missing from either map.
  static Map<String, TypeMismatch> getTypeMismatches({
    required Map<String, Reference> expected,
    required Map<String, Reference> actual,
  }) {
    final expectedKeys = expected.keys.toSet();
    final actualKeys = actual.keys.toSet();

    final sharedKeys = expectedKeys.intersection(actualKeys);

    final typeMismatches = <String, TypeMismatch>{};
    for (final key in sharedKeys) {
      final expectedType = expected.getOrThrow(key);
      final actualType = actual.getOrThrow(key);
      if (expectedType != actualType) {
        typeMismatches[key] = (expectedType: expectedType.symbol, actualType: actualType.symbol);
      }
    }

    return typeMismatches;
  }
}
