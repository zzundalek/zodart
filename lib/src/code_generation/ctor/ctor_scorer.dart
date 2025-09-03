import 'ctor_analysis.dart';

/// Scores a constructor based on parameter matches and preferences.
///
/// Prefers constructors that are:
/// - `const`
/// - Non-factory
/// - Unnamed (default)
///
/// Penalizes constructors for missing parameters, type mismatches,
/// and presence of positional parameters.
class CtorScorer {
  /// Creates a scorer for the given [ctorAnalysis].
  const CtorScorer(this.ctorAnalysis);

  /// Constructor analysis
  final CtorAnalysis ctorAnalysis;

  /// Returns an integer representing the constructor score.
  ///
  /// Prefers const, non-factory, unnamed constructors.
  int getScore() {
    final ctor = ctorAnalysis.ctor;

    final missingInSchemaCount = ctorAnalysis.missingInSchema.length;
    final missingInConstructorCount = ctorAnalysis.missingInEntity.length;
    final typeMismatchesCount = ctorAnalysis.typeMismatches.length;

    final reqPositionalParamsCount = ctor.reqPositionalParams.length;
    final optPositionalParamsCount = ctor.optPositionalParams.length;

    var score = 0;

    if (ctor.isConst) score += 5;
    if (!ctor.isFactory) score += 2;
    if (!ctor.isNamed) score += 1;

    return score -=
        (missingInSchemaCount + missingInConstructorCount + reqPositionalParamsCount) * 1000 +
        typeMismatchesCount * 100 +
        optPositionalParamsCount * 10;
  }
}
