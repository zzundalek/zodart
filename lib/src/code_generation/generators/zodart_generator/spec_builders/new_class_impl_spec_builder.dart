import 'package:code_builder/code_builder.dart';
import 'package:fpdart/fpdart.dart';

import '../../../schema_parsing/schema_parsing.dart';
import '../../../utils/class_utils.dart';

// TODO(zzundalek): handle names with dollar sign
/// Builds implementations for new classes (i.e., the stubs created in the first step).
class NewClassImplSpecBuilder implements SpecBuilderInputVisitor {
  /// Create a new [NewClassImplSpecBuilder].
  const NewClassImplSpecBuilder(this.classBuilderUtils);

  /// Class utils used to build class methods (i.e. `toString()`)
  final ClassBuilderUtils classBuilderUtils;

  /// Returns a Mixin containing getters and overriden methods for the newly build class.
  Mixin buildMixin(Map<String, Reference> fields, List<Method> methods, {required Refs refs}) {
    final fieldEntries = fields.entries;

    final fieldMethods = fieldEntries.map(
      (field) => Method(
        (m) => m
          ..name = field.key
          ..returns = field.value
          ..type = MethodType.getter,
      ),
    );

    final mixin = Mixin(
      (c) => c
        ..name = refs.outputClassMixin
        ..docs.addAll([
          '/// Mixin used as interface for [${refs.outputType}].',
          '///',
          '/// Providing getters and overriding methods.',
        ])
        ..methods.addAll([
          ...fieldMethods,
          ...methods,
        ]),
    );

    return mixin;
  }

  /// Builds function to instantiate existing class.
  Class buildClassImpl(Map<String, Reference> fields, {required Refs refs}) {
    final fieldEntries = fields.entries;

    final classImpl = Class(
      (c) => c
        ..name = refs.outputClassImpl
        ..docs.addAll([
          '/// Class used as implementation for [${refs.outputType}] and [${refs.outputClassMixin}].',
          '///',
          '/// Providing fields and a default constructor.',
        ])
        ..modifier = ClassModifier.final$
        ..constructors.add(
          Constructor(
            (c) => c
              ..constant = true
              ..optionalParameters.addAll(
                fieldEntries.map(
                  (field) => Parameter(
                    (p) => p
                      ..name = field.key
                      ..required = true
                      ..toThis = true
                      ..named = true,
                  ),
                ),
              ),
          ),
        )
        ..implements.add(refer(refs.outputType))
        ..mixins.add(refer(refs.outputClassMixin))
        ..fields.addAll(
          fieldEntries.map(
            (field) => Field(
              (f) => f
                ..modifier = FieldModifier.final$
                ..name = field.key
                ..type = field.value
                ..annotations.add(refer('override')),
            ),
          ),
        ),
    );

    return classImpl;
  }

  /// Builds function to instantiate the newly generated class.
  Method buildInstatiateFn(Map<String, Reference> fields, {required Refs refs}) {
    final fieldToField = fields.map((name, reference) => MapEntry(name, refer(name)));

    final func = Method(
      (m) => m
        ..returns = refer(refs.outputType)
        ..name = refs.instantiateSchemaFn
        ..docs.addAll([
          '/// Instantiates the output class [${refs.outputType}] using [${refs.outputClassImpl}].',
        ])
        ..lambda = true
        ..optionalParameters.addAll(
          fields.entries.map(
            (field) => Parameter(
              (p) => p
                ..name = field.key
                ..type = field.value
                ..required = true
                ..named = true,
            ),
          ),
        )
        ..body = refer(refs.outputClassImpl).call([], fieldToField).statement,
    );

    return func;
  }

  @override
  List<Spec> visitGenerateNewClassSpecInput(GenerateNewClassSpec specInput) {
    final schema = specInput.schema;
    final refs = specInput.refs;

    final parsedValueFields = schema.outSchema.mapValue(refer);

    final propertyNames = schema.propertyNames;

    final zSchema = schema.zSchema;

    final classMixin = buildMixin(parsedValueFields, [
      classBuilderUtils.buildHashCodeMethod(zSchema),
      classBuilderUtils.buildEqualityMethod(refs.outputType, zSchema),
      classBuilderUtils.buildToStringMethod(refs.outputType, propertyNames),
    ], refs: refs);

    final classImpl = buildClassImpl(parsedValueFields, refs: refs);

    final instatiateFn = buildInstatiateFn(parsedValueFields, refs: refs);

    return [
      classMixin,
      classImpl,
      instatiateFn,
    ];
  }

  @override
  List<Spec> visitUseExistingClassSpecInput(UseExistingClassSpec specInput) => [];

  @override
  List<Spec> visiCreateRecordSpecInput(UseRecordSpec specInput) => [];
}
