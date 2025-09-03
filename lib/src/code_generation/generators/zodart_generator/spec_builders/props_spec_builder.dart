import 'package:code_builder/code_builder.dart';

import '../../../schema_parsing/schema_parsing.dart';

/// Builds props helpers.
class PropsSpecBuilder implements SpecBuilderInputVisitor {
  /// Create a new [PropsSpecBuilder].
  const PropsSpecBuilder();

  /// Returns a class wrapper around [buildPropsEnum] enum.
  ///
  /// Allows accesing the enum values as getters.
  Class buildPropsEnumWrapper(Set<String> values, {required Refs refs}) {
    final res = Class(
      (c) => c
        ..name = refs.propsEnumWrapper
        ..modifier = ClassModifier.final$
        ..docs.addAll([
          '/// Helper class for [${refs.annotatedClass}].',
          '///',
          '/// Wrapper used to access [${refs.propsEnum}] values as getters.',
        ])
        ..constructors.add(
          Constructor((c) => c..constant = true),
        )
        ..methods.addAll(
          values.map(
            (val) => Method(
              (m) => m
                ..name = val
                ..returns = refer(refs.propsEnum)
                ..type = MethodType.getter
                ..body = Code('${refs.propsEnum}.$val')
                ..lambda = true,
            ),
          ),
        ),
    );
    return res;
  }

  /// Returns an enum with values equal to the schema keys.
  Enum buildPropsEnum(Set<String> values, {required Refs refs}) {
    final res = Enum(
      (e) => e
        ..name = refs.propsEnum
        ..docs.addAll([
          '/// Enum for fields declared in [${refs.annotatedClass}].',
          '///',
          '/// Values mirror the keys of [${refs.schemaFieldPath}].',
        ])
        ..values.addAll(
          values.map(
            (val) => EnumValue((e) => e..name = val),
          ),
        ),
    );

    return res;
  }

  /// Returns specs of props entities.
  List<Spec> build(SpecBuilderInput specInput) {
    final schema = specInput.schema;
    final refs = specInput.refs;
    final propertyNames = schema.propertyNames;

    final schemaPropsEnum = buildPropsEnum(propertyNames, refs: refs);

    final schemaPropsWrapper = buildPropsEnumWrapper(propertyNames, refs: refs);

    return [schemaPropsEnum, schemaPropsWrapper];
  }

  @override
  List<Spec> visitGenerateNewClassSpecInput(GenerateNewClassSpec specInput) => build(specInput);

  @override
  List<Spec> visitUseExistingClassSpecInput(UseExistingClassSpec specInput) => build(specInput);

  @override
  List<Spec> visiCreateRecordSpecInput(UseRecordSpec specInput) => build(specInput);
}
