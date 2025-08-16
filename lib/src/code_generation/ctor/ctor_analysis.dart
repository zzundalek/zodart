import 'package:code_builder/code_builder.dart';

import '../../utils/utils.dart';
import 'ctor.dart';

/// Record holding optional string representations of expected and actual types.
typedef TypeMismatch = ({String? expectedType, String? actualType});

/// Analyzes a constructor against a schema to detect missing parameters and type mismatches.
class CtorAnalysis {
  /// Creates a [CtorAnalysis] with detailed parameter and type mismatch info.
  const CtorAnalysis({
    required this.ctor,
    required this.schema,
    required this.missingInCtor,
    required this.missingInSchema,
    required this.typeMismatches,
  });

  /// Creates a [CtorAnalysis] by comparing [ctor] parameters to the [schema].
  ///
  /// - Detects parameters missing in the constructor or schema.
  /// - Detects type mismatches between constructor parameters and schema definitions.
  factory CtorAnalysis.from({
    required Ctor ctor,
    required Map<String, Reference> schema,
  }) {
    final namedParams = ctor.namedParams;

    final schemaParamNames = schema.keys.toSet();
    final paramNames = namedParams.keys.toSet();

    final missingInCtor = schemaParamNames.difference(paramNames);
    final missingInSchema = paramNames.difference(schemaParamNames);

    final typeMismatches = _getTypeMismatches(expected: schema, actual: namedParams);

    return CtorAnalysis(
      ctor: ctor,
      schema: schema,
      missingInSchema: missingInSchema,
      missingInCtor: missingInCtor,
      typeMismatches: typeMismatches,
    );
  }

  /// The constructor being analyzed.
  final Ctor ctor;

  /// The expected schema mapping parameter names to their types.
  final Map<String, Reference> schema;

  /// Parameter names present in the schema but missing in the constructor.
  final Set<String> missingInCtor;

  /// Parameter names present in the constructor but missing in the schema.
  final Set<String> missingInSchema;

  /// Map of parameter names to their expected and actual type mismatches.
  final Map<String, TypeMismatch> typeMismatches;

  /// Whether the constructor has any required positional parameters.
  bool get hasReqPositionalParams => ctor.reqPositionalParams.isNotEmpty;

  /// Whether the constructor has any optional positional parameters.
  bool get hasOptPositionalParams => ctor.optPositionalParams.isNotEmpty;

  /// Whether the constructor is valid with no missing or mismatched parameters.
  ///
  /// Includes a strict check disallowing any optional positional parameters.
  bool get isValid {
    final errorsCount =
        missingInSchema.length + missingInCtor.length + ctor.reqPositionalParams.length + typeMismatches.length;

    final warnningsCount = ctor.optPositionalParams.length;

    // NOTE: strict mode (don't allow any optional positional parameters)
    return errorsCount + warnningsCount == 0;
  }

  /// Returns a map of parameter names to [TypeMismatch]s for keys present in both [expected] and [actual].
  ///
  /// A mismatch is recorded if the type [Reference]s differ for the same key.
  /// Only keys present in both maps are compared. Throws if a shared key is missing from either map.
  static Map<String, TypeMismatch> _getTypeMismatches({
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
