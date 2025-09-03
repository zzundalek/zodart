import 'package:analyzer/dart/element/element2.dart';
import 'package:code_builder/code_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ctor.freezed.dart';

/// A base class representation of a constructor.
///
/// Use [Ctor.fromCtorElement] to create a [NamedCtor] or [UnnamedCtor] from a [ConstructorElement2].
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

  factory Ctor.fromCtorElement(ConstructorElement2 ctorElement) {
    final params = ctorElement.formalParameters;

    final reqNamedParams = Map.fromEntries(params.where((p) => p.isRequiredNamed).map(toNamedParam));
    final optNamedParams = Map.fromEntries(params.where((p) => p.isOptionalNamed).map(toNamedParam));

    final reqPositionalParams = params.where((p) => p.isRequiredPositional).map(toUnnamedParam).toList();
    final optPositionalParams = params.where((p) => p.isOptionalPositional).map(toUnnamedParam).toList();

    final ctorName = _getCtorName(ctorElement);
    final isConst = ctorElement.isConst;
    final isFactory = ctorElement.isFactory;

    _getCtorName(ctorElement);

    return ctorName != null
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

  static String? _getCtorName(ConstructorElement2 ctor) {
    final name = ctor.name3;
    return name != null && name.isNotEmpty && name != 'new' ? name : null;
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
  static Reference toUnnamedParam(FormalParameterElement p) => refer(p.type.getDisplayString());

  /// Returns a name, reference for a named parameter
  @visibleForTesting
  static MapEntry<String, Reference> toNamedParam(FormalParameterElement p) {
    return switch (p) {
      FormalParameterElement(isNamed: true, name3: final String name) => MapEntry(
        name,
        refer(p.type.getDisplayString()),
      ),
      _ => throw ArgumentError('Expected a named parameter: $p'),
    };
  }
}
