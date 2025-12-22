/// Annotation kind used to distinguish between reusing an existing class and generating a new one.
///
// NOTE: can't use enums easily in annotations.
class AnnotationKinds {
  /// Generates new class code
  static const generateNewClass = 'generateNewClass';

  /// Use an existing class
  static const useExistingClass = 'useExistingClass';

  /// Use record as output
  static const useRecord = 'useRecord';
}

/// {@template zodart_annotation.annotation}
/// Flags a class as schema definition for `ZObject`.
///
/// The annotated classes will be processed by ZodArt code generator to produce:
///
/// - Strongly-typed helper classes and type definitions that ensure consistency between the schema and its mapper.
/// - Utility helpers that add syntactic sugar for schema introspection and manipulation.
/// - Optionally, applies a static list of cross-field validators via [crossFieldValidators].
/// {@endtemplate}
class ZodArt {
  /// {@macro zodart_annotation.annotation}
  ///
  /// Use [outputClassType] as the ZObject T type.
  const ZodArt.withExistingClass({required Type outputClassType, List<dynamic> crossFieldValidators = const []})
    : this._(
        annotationKind: AnnotationKinds.useExistingClass,
        outputType: outputClassType,
        crossFieldValidators: crossFieldValidators,
      );

  /// {@macro zodart_annotation.annotation}
  ///
  /// Generates a new class code named [outputClassName] and use it as the ZObject T type.
  const ZodArt.generateNewClass({required String outputClassName, List<dynamic> crossFieldValidators = const []})
    : this._(
        annotationKind: AnnotationKinds.generateNewClass,
        outputTypeStr: outputClassName,
        crossFieldValidators: crossFieldValidators,
      );

  /// {@macro zodart_annotation.annotation}
  ///
  /// Use [outputRecordType] as the ZObject T type.
  const ZodArt.withRecord({required Type outputRecordType, List<dynamic> crossFieldValidators = const []})
    : this._(
        annotationKind: AnnotationKinds.useRecord,
        outputType: outputRecordType,
        crossFieldValidators: crossFieldValidators,
      );

  const ZodArt._({
    required this.annotationKind,
    required this.crossFieldValidators,
    this.outputType,
    this.outputTypeStr,
  });

  /// Reuse existing / generate new class
  ///
  /// Note: to read fields from the annotation all fields must be in the parent class
  /// so I can't use sealed class well here...
  final String annotationKind;

  /// Output type string - used when generating a new class
  final String? outputTypeStr;

  /// Output type - used when:
  ///   - using an existing class
  ///   - using record
  final Type? outputType;

  /// Crossfield validators list
  final List<dynamic> crossFieldValidators;
}
