// Will be migrated in new version automatically https://github.com/dart-lang/source_gen/issues/743
// ignore_for_file: deprecated_member_use

import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ctor.freezed.dart';

/// A base class representation of a constructor.
///
/// Use [Ctor.fromCtorElement] to create a [NamedCtor] or [UnnamedCtor] from a [ConstructorElement].
@freezed
sealed class Ctor with _$Ctor {
  const Ctor._();

  const factory Ctor.namedCtor({
    required String name,
    required bool isConst,
    required bool isFactory,
    required Map<String, Reference> reqNamedParams,
    required Map<String, Reference> optNamedParams,
    required List<Reference> reqPositionalParams,
    required List<Reference> optPositionalParams,
  }) = NamedCtor;

  const factory Ctor.unnamedCtor({
    required bool isConst,
    required bool isFactory,
    required Map<String, Reference> reqNamedParams,
    required Map<String, Reference> optNamedParams,
    required List<Reference> reqPositionalParams,
    required List<Reference> optPositionalParams,
  }) = UnnamedCtor;

  factory Ctor.fromCtorElement(ConstructorElement ctorElement) {
    final params = ctorElement.parameters;

    final reqNamedParams = Map.fromEntries(params.where((p) => p.isRequiredNamed).map(toNamedParam));
    final optNamedParams = Map.fromEntries(params.where((p) => p.isOptionalNamed).map(toNamedParam));

    final reqPositionalParams = params.where((p) => p.isRequiredPositional).map(toUnnamedParam).toList();
    final optPositionalParams = params.where((p) => p.isOptionalPositional).map(toUnnamedParam).toList();

    final ctorName = ctorElement.name;
    final isConst = ctorElement.isConst;
    final isFactory = ctorElement.isFactory;

    return ctorName.isNotEmpty
        ? NamedCtor(
            name: ctorName,
            isConst: isConst,
            isFactory: isFactory,
            reqNamedParams: reqNamedParams,
            optNamedParams: optNamedParams,
            reqPositionalParams: reqPositionalParams,
            optPositionalParams: optPositionalParams,
          )
        : UnnamedCtor(
            isConst: isConst,
            isFactory: isFactory,
            reqNamedParams: reqNamedParams,
            optNamedParams: optNamedParams,
            reqPositionalParams: reqPositionalParams,
            optPositionalParams: optPositionalParams,
          );
  }

  /// Whether the constructor has a name (i.e., is a named constructor).
  bool get isNamed => switch (this) {
    NamedCtor() => true,
    UnnamedCtor() => false,
  };

  /// All named parameters (required + optional).
  Map<String, Reference> get namedParams => {...optNamedParams, ...reqNamedParams};

  /// Returns a display-friendly name for the constructor.
  String getDisplayName() => switch (this) {
    NamedCtor(:final name) => name,
    UnnamedCtor() => '<unnamed>',
  };

  /// Returns a reference for an unnamed parameter
  @visibleForTesting
  static Reference toUnnamedParam(ParameterElement p) => refer(p.type.getDisplayString());

  /// Returns a name, reference for a named parameter
  @visibleForTesting
  static MapEntry<String, Reference> toNamedParam(ParameterElement p) =>
      MapEntry(p.name, refer(p.type.getDisplayString()));
}
