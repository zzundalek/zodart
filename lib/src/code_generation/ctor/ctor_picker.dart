// Will be migrated in new version automatically https://github.com/dart-lang/source_gen/issues/743
// ignore_for_file: deprecated_member_use
import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';
import 'package:fpdart/fpdart.dart';

import 'ctor.dart';
import 'ctor_analysis.dart';
import 'ctor_analysis_ext.dart';
import 'ctor_scorer.dart';

/// A function that extracts constructor elements from a given [ClassElement].
typedef CtorElemsExtractor = List<ConstructorElement> Function(ClassElement);

/// Represents the result of picking the best constructor:
/// - [Right] if a valid [Ctor] is found.
/// - [Left] with a tuple of the failing [Ctor] and an error summary otherwise.
typedef BestCtor = Either<({Ctor ctor, String errorsSummary}), Ctor>;

/// Picks the best constructor given available [ConstructorElement]s and a [schema] definition.
typedef BestCtorPicker =
    BestCtor Function({
      required List<ConstructorElement> ctorElements,
      required Map<String, Reference> schema,
    });

/// Picks the best constructor from a list of [ConstructorElement]s based on compatibility with [schema].
///
/// This function:
/// - Converts each constructor elemet to a [Ctor],
/// - Analyzes it against the schema using [CtorAnalysis],
/// - Scores it using [CtorScorer],
/// - Selects the constructor with the highest score,
/// - Returns it as [Right] if it's valid,
/// - Otherwise, returns [Left] with the best candidate and an error summary.
///
/// Throws [ArgumentError] if [schema] or [ctorElements] is empty.
BestCtor pickBestCtor({
  required List<ConstructorElement> ctorElements,
  required Map<String, Reference> schema,
}) {
  if (ctorElements.isEmpty) {
    throw ArgumentError('Must provide at least one constructor');
  }
  if (schema.isEmpty) {
    throw ArgumentError('Schema cannot be empty');
  }

  final highestScoreCtorAnalysis = ctorElements
      .map(Ctor.fromCtorElement)
      .map((ctor) => CtorAnalysis.from(ctor: ctor, schema: schema))
      .map((ctorAnalysis) => (ctorAnalysis: ctorAnalysis, ctorScore: CtorScorer(ctorAnalysis).getScore()))
      .reduce((best, curr) => curr.ctorScore > best.ctorScore ? curr : best)
      .ctorAnalysis;

  return Either.fromPredicate(
    highestScoreCtorAnalysis,
    (a) => a.isValid,
    (a) => (ctor: a.ctor, errorsSummary: a.errorSummary),
  ).map((a) => a.ctor);
}

/// Returns all public constructors from a given [ClassElement].
List<ConstructorElement> getPublicCtorElements(ClassElement classElement) =>
    classElement.constructors.where((c) => c.isPublic).toList();
