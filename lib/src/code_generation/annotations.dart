/// Annotation kind used to distinguish between reusing an existing class and generating a new one.
///
// NOTE: can't use enums easily in annotations.
class AnnotationKinds {
  /// Generates new class code
  static const generateNewClass = 'generateNewClass';

  /// Use an existing class
  static const useExistingClass = 'useExistingClass';
}

/// {@macro zodart_annotation.annotation}
const zodart = ZodArt();

/// {@template zodart_annotation.annotation}
/// Flags a class as schema definition for `ZObject`.
///
/// The annotated classes will be processed by ZodArt code generator to produce:
///
/// - Strongly-typed helper classes and type definitions that ensure consistency between the schema and its mapper.
/// - Utility helpers that add syntactic sugar for schema introspection and manipulation.
/// {@endtemplate}
///
/// NOTE: this class should not be exported, as it does not contain any paremeters right now.
class ZodArt {
  /// The default constructor
  const ZodArt();
}
