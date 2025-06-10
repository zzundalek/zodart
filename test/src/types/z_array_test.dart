import 'package:test/test.dart';
import 'package:zodart/zodart.dart';

import '../../test_helper.dart';

void main() {
  group('parse', () {
    group('strict', () {
      final baseValidInputs = <ValidInput>[
        (
          input: ['String value'],
          expected: ['String value'],
        ),
      ];
      final baseInvalidInputs = <InvalidInput>[
        (
          input: [1, 'String value', -1.0, emptyObject],
          expected: [
            ZIssueParseFail(
              from: int,
              to: String,
              val: 1,
              rawPath: ZPath.index(0),
            ),
            ZIssueParseFail(
              from: double,
              to: String,
              val: -1.0,
              rawPath: ZPath.index(2),
            ),
            ZIssueParseFail(
              from: Object,
              to: String,
              val: emptyObject,
              rawPath: ZPath.index(3),
            ),
          ],
        ),
        (
          input: emptyObject,
          expected: const [
            ZIssueParseFail(
              from: Object,
              to: List<String>,
              val: emptyObject,
            ),
          ],
        ),
        (
          input: ['String value', 'String value2', null, 'String value 4'],
          expected: [
            const ZIssueParseFail(
              from: Null,
              to: String,
              val: null,
            ),
          ],
        ),
      ];

      group('required', () {
        testInputs(
          (
            validInputs: baseValidInputs,
            invalidInputs: [
              ...baseInvalidInputs,
              (
                input: null,
                expected: const [ZIssueParseFail(from: Null, to: List<String>, val: null)],
              ),
            ],
          ),
          ZArray(ZString()),
        );
      });
      group('nullable', () {
        testInputs(
          (
            validInputs: [
              ...baseValidInputs,
              (
                input: null,
                expected: null,
              ),
            ],
            invalidInputs: baseInvalidInputs,
          ),
          ZArray(ZString()).nullable(),
        );
      });
      group('optional', () {
        testInputs(
          (
            validInputs: [
              ...baseValidInputs,
              (
                input: null,
                expected: null,
              ),
            ],
            invalidInputs: baseInvalidInputs,
          ),
          ZArray(ZString()).optional(),
        );
      });
    });
  });
}
