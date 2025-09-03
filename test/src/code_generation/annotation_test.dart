import 'package:test/test.dart';
import 'package:zodart/src/code_generation/annotations.dart';

class TestOutputClass {}

typedef TestOutputRecord = ({String val});

void main() {
  group('ZodArt', () {
    late ZodArt zodArt;
    group('ZodArt.withExistingClass', () {
      setUp(() {
        // Using const ctor will not trigger this._(...) during the test
        // ignore: prefer_const_constructors
        zodArt = ZodArt.withExistingClass(outputClassType: TestOutputClass);
      });

      test('check right annotation kind', () {
        expect(zodArt.annotationKind, equals('useExistingClass'));
      });
      test('check outputType', () {
        expect(zodArt.outputType, equals(TestOutputClass));
      });
      test('check outputTypeStr', () {
        expect(zodArt.outputTypeStr, isNull);
      });
    });
    group('ZodArt.generateNewClass', () {
      setUp(() {
        // Using const ctor will not trigger this._(...) during the test
        // ignore: prefer_const_constructors
        zodArt = ZodArt.generateNewClass(outputClassName: 'TestOutputClass');
      });
      test('check right annotation kind', () {
        expect(zodArt.annotationKind, equals('generateNewClass'));
      });
      test('check outputType', () {
        expect(zodArt.outputType, isNull);
      });
      test('check outputTypeStr', () {
        expect(zodArt.outputTypeStr, equals('TestOutputClass'));
      });
    });
    group('ZodArt.withRecord', () {
      setUp(() {
        // Using const ctor will not trigger this._(...) during the test
        // ignore: prefer_const_constructors
        zodArt = ZodArt.withRecord(outputRecordType: TestOutputRecord);
      });
      test('check right annotation kind', () {
        expect(zodArt.annotationKind, equals('useRecord'));
      });
      test('check outputType', () {
        expect(zodArt.outputType, equals(TestOutputRecord));
      });
      test('check outputTypeStr', () {
        expect(zodArt.outputTypeStr, isNull);
      });
    });
  });
}
