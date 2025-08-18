// Not needed
// ignore_for_file: specify_nonobvious_property_types

import 'package:source_gen_test/annotations.dart';
import 'package:zodart/zodart.dart';

import '_shared_annotations.dart';

// **************************************************************************
// Test cases
// **************************************************************************

@elementIsNotClass
@ZodArt.generateNewClass(outputClassName: 'OutputClass')
final notClass = (name: ZString());

@elementIsNotAbstractClass
@ZodArt.generateNewClass(outputClassName: 'OutputClass')
class NotAbstractClass {}

@missingStaticSchemaField
@ZodArt.generateNewClass(outputClassName: 'TestClass')
abstract class NoSchemaProp {
  final schema = '';
}

@schemaFieldIsNotRecord
@ZodArt.generateNewClass(outputClassName: 'TestClass')
abstract class InvalidSchemaType {
  static final schema = <String, dynamic>{};
}

@schemaIsEmpty
@ZodArt.generateNewClass(outputClassName: 'TestClass')
abstract class EmptySchema {
  static const () schema = ();
}

@schemaContainsPositionalFields
@ZodArt.generateNewClass(outputClassName: 'TestClass')
abstract class PositionalArgs {
  static final (ZInt, {ZString name}) schema = (ZInt(), name: ZString());
}

@schemaContainsNotZodArtType
@ZodArt.generateNewClass(outputClassName: 'TestClass')
abstract class UnsupportedType {
  static final schema = (name: DateTime.now());
}

@ShouldThrow(
  '''
@ZodArt - inserted class name '' is not a valid Dart class name.

See Dart documentation for more info.''',
  element: null,
)
@ZodArt.generateNewClass(outputClassName: '')
abstract class InvalidClassName {
  static final schema = (name: ZString());
}
