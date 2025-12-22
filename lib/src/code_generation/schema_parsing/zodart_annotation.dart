import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:source_gen/source_gen.dart';

import '../../base/zodart_exceptions.dart';
import '../annotations.dart';

part 'zodart_annotation.freezed.dart';

/// A type-safe version of [ZodArt] annotation
///
/// Note: A fully type-safe annotation is not possible upfront due to limitations in the analyzer.
@freezed
sealed class ZodArtAnnotation with _$ZodArtAnnotation {
  const ZodArtAnnotation._();

  const factory ZodArtAnnotation.generateNewClass({
    required String outputClassName,
    required List<DartObject> crossFieldValidators,
  }) = ZodArtGenerateNewClass;

  const factory ZodArtAnnotation.useExistingClass({
    required DartType outputClassType,
    required List<DartObject> crossFieldValidators,
  }) = ZodArtUseExistingClass;

  const factory ZodArtAnnotation.useRecord({
    required DartType outputRecordType,
    required List<DartObject> crossFieldValidators,
  }) = ZodArtUseRecord;

  /// Parses the raw [ZodArt] annotation and returns the subclass based on its kind.
  ///
  /// Throws a [ZodArtInternalException] or [FormatException] if the parsing fails.
  factory ZodArtAnnotation.fromAnnotatedElement({
    required ConstantReader rawAnnotation,
  }) {
    final annotationKind = rawAnnotation.read(annotationKindFieldName).stringValue;
    final crossFieldValidators = rawAnnotation.read(crossFieldValidatorsFieldName).listValue;

    return switch (annotationKind) {
      AnnotationKinds.generateNewClass => ZodArtGenerateNewClass(
        outputClassName: rawAnnotation.read(outputTypeStrFieldName).stringValue,
        crossFieldValidators: crossFieldValidators,
      ),
      AnnotationKinds.useExistingClass => ZodArtUseExistingClass(
        outputClassType: rawAnnotation.read(outputTypeFieldName).typeValue,
        crossFieldValidators: crossFieldValidators,
      ),
      AnnotationKinds.useRecord => ZodArtUseRecord(
        outputRecordType: rawAnnotation.read(outputTypeFieldName).typeValue,
        crossFieldValidators: crossFieldValidators,
      ),
      _ => throw ZodArtInternalException(
        "Unexpected annotation kind. Got: '$annotationKind'.",
      ),
    };
  }

  /// Name of a field in the raw [ZodArt] annotation,
  /// used to distinguish between [ZodArtGenerateNewClass] and [ZodArtUseExistingClass].
  static const annotationKindFieldName = 'annotationKind';

  /// Name of a field in the raw [ZodArt] annotation,
  /// used to specify name of the new generated class.
  static const outputTypeStrFieldName = 'outputTypeStr';

  /// Name of a field in the raw [ZodArt] annotation,
  /// used to specify the [Type] of the existing class.
  static const outputTypeFieldName = 'outputType';

  /// Name of a field in the raw [ZodArt] annotation,
  /// used pass a list of cross field validators.
  static const crossFieldValidatorsFieldName = 'crossFieldValidators';

  /// Returns the output type name.
  String get outputTypeName => switch (this) {
    ZodArtGenerateNewClass(:final outputClassName) => outputClassName,
    ZodArtUseExistingClass(:final outputClassType) => outputClassType.getDisplayString(),
    ZodArtUseRecord(:final outputRecordType) => outputRecordType.getDisplayString(),
  };

  /// A property name in the annotated class used to define the schema.
  ///
  /// NOTE: can be set by annotation parameter in future.
  String get schemaPropertyName => 'schema';
}
