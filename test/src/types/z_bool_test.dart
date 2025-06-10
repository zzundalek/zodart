import 'package:test/test.dart';
import 'package:zodart/zodart.dart';

import '../../test_helper.dart';

void main() {
  group('parse', () {
    group('strict', () {
      final baseValidInputs = <ValidInput>[
        (input: true, expected: true),
        (input: false, expected: false),
      ];
      final baseInvalidInputs = <InvalidInput>[];

      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: [
              ...baseInvalidInputs,
              (input: null, expected: const [ZIssueParseFail(from: Null, to: bool, val: null)]),
            ],
          ),
          ZBool(),
        );
      });
      group('nullable', () {
        testInputs(
          (
            validInputs: [
              ...baseValidInputs,
              (input: null, expected: null),
            ],
            invalidInputs: baseInvalidInputs,
          ),
          ZBool().nullable(),
        );
      });
      group('optional', () {
        testInputs(
          (
            validInputs: [
              ...baseValidInputs,
              (input: null, expected: null),
            ],
            invalidInputs: baseInvalidInputs,
          ),
          ZBool().optional(),
        );
      });
    });
  });
}
