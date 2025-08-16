import 'package:code_builder/code_builder.dart';

import '../../../ctor/_ctor.dart';
import '../../../schema_parsing/schema_parsing.dart';

/// Builds a function to instantiate existing class.
///
/// Uses the automatically selected constructor.
class ExistingClassSpecBuilder implements SpecBuilderInputVisitor {
  /// Create a new [ExistingClassSpecBuilder].
  const ExistingClassSpecBuilder();

  /// Builds function to instantiate the existing class used as output.
  Method buildInstatiateFn(Ctor ctor, {required Refs refs}) {
    final paramsToParams = ctor.namedParams.map((paramName, _) => MapEntry(paramName, refer(paramName)));

    final methodBody = switch (ctor) {
      NamedCtor(:final name) => refer(refs.outputType).newInstanceNamed(name, [], paramsToParams).statement,
      UnnamedCtor() => refer(refs.outputType).newInstance([], paramsToParams).statement,
    };

    final func = Method(
      (m) => m
        ..returns = refer(refs.outputType)
        ..name = refs.instantiateSchemaFn
        ..docs.addAll([
          '/// Instantiates the output class [${refs.outputType}],',
          '/// using the automatically selected constructor.',
        ])
        ..lambda = true
        ..optionalParameters.addAll(
          ctor.namedParams.entries.map(
            (param) => Parameter(
              (p) => p
                ..name = param.key
                ..type = param.value
                ..required = true
                ..named = true,
            ),
          ),
        )
        ..body = methodBody,
    );

    return func;
  }

  @override
  List<Spec> visitGenerateNewClassSpecInput(GenerateNewClassSpec specInput) => [];

  @override
  List<Spec> visitUseExistingClassSpecInput(UseExistingClassSpec specInput) {
    final instatiateFn = buildInstatiateFn(specInput.ctor, refs: specInput.refs);

    return [instatiateFn];
  }
}
