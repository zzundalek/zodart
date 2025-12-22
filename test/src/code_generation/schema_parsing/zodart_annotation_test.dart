import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:zodart/src/base/base.dart';
import 'package:zodart/src/code_generation/schema_parsing/schema_parsing.dart';

import '../../../mocks/constant_reader/constant_reader.mocks.dart';
import '../../../mocks/dart_type/dart_type.mocks.dart';

void main() {
  group('fromAnnotatedElement', () {
    late MockConstantReader constantReader;
    late MockConstantReader annotationKindReader;
    late MockConstantReader crossFieldValidatorsReader;

    group('annotationKind is generateNewClass', () {
      late MockConstantReader outputClassNameReader;

      setUp(() {
        constantReader = MockConstantReader();
        annotationKindReader = MockConstantReader();
        outputClassNameReader = MockConstantReader();
        crossFieldValidatorsReader = MockConstantReader();

        when(constantReader.read('annotationKind')).thenReturn(annotationKindReader);
        when(constantReader.read('outputTypeStr')).thenReturn(outputClassNameReader);
        when(constantReader.read('crossFieldValidators')).thenReturn(crossFieldValidatorsReader);

        when(annotationKindReader.stringValue).thenReturn('generateNewClass');
        when(outputClassNameReader.stringValue).thenReturn('OutputClass');
      });

      test('for correct parameters returns ZodArtGenerateNewClass with proper output class name', () {
        final res = ZodArtAnnotation.fromAnnotatedElement(rawAnnotation: constantReader);

        expect(res, equals(const ZodArtGenerateNewClass(outputClassName: 'OutputClass', crossFieldValidators: [])));
      });
    });
    group('annotationKind is useExistingClass', () {
      late MockConstantReader outputClassTypeReader;
      late MockDartType outputClassType;

      setUp(() {
        constantReader = MockConstantReader();
        annotationKindReader = MockConstantReader();
        outputClassTypeReader = MockConstantReader();
        outputClassType = MockDartType();
        crossFieldValidatorsReader = MockConstantReader();

        when(constantReader.read('annotationKind')).thenReturn(annotationKindReader);
        when(constantReader.read('outputType')).thenReturn(outputClassTypeReader);
        when(constantReader.read('crossFieldValidators')).thenReturn(crossFieldValidatorsReader);

        when(annotationKindReader.stringValue).thenReturn('useExistingClass');
        when(outputClassTypeReader.typeValue).thenReturn(outputClassType);
      });

      test('for correct parameters returns ZodArtUseExistingClass with proper output class type', () {
        final res = ZodArtAnnotation.fromAnnotatedElement(rawAnnotation: constantReader);

        expect(res, equals(ZodArtUseExistingClass(outputClassType: outputClassType, crossFieldValidators: [])));
      });
      //
    });
    group('annotationKind is unknown', () {
      setUp(() {
        constantReader = MockConstantReader();
        annotationKindReader = MockConstantReader();
        crossFieldValidatorsReader = MockConstantReader();

        when(constantReader.read('annotationKind')).thenReturn(annotationKindReader);
        when(annotationKindReader.stringValue).thenReturn('unknown');
        when(constantReader.read('crossFieldValidators')).thenReturn(crossFieldValidatorsReader);
      });

      test('Throws ZodArtInternalException for an unknown annotation kind', () {
        expect(
          () => ZodArtAnnotation.fromAnnotatedElement(rawAnnotation: constantReader),
          throwsA(
            predicate(
              (e) =>
                  e is ZodArtInternalException && //
                  e.message == "Unexpected annotation kind. Got: 'unknown'.",
            ),
          ),
        );
      });
    });
  });
}
