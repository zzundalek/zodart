// Not needed
// ignore_for_file: specify_nonobvious_property_types

import 'package:source_gen_test/annotations.dart';
import 'package:zodart/zodart.dart';

import '_shared_annotations.dart';

// **************************************************************************
// Helper objects
// **************************************************************************

class OutputClass {}

// **************************************************************************
// Test cases
// **************************************************************************

@elementIsNotClass
@ZodArt.withExistingClass(outputClassType: OutputClass)
final notClass = (name: ZString());

@elementIsNotAbstractClass
@ZodArt.withExistingClass(outputClassType: OutputClass)
class NotAbstractClass {}

@missingStaticSchemaField
@ZodArt.withExistingClass(outputClassType: OutputClass)
abstract class NoSchemaProp {
  final schema = '';
}

@schemaFieldIsNotRecord
@ZodArt.withExistingClass(outputClassType: OutputClass)
abstract class InvalidSchemaType {
  static final schema = <String, dynamic>{};
}

@schemaIsEmpty
@ZodArt.withExistingClass(outputClassType: OutputClass)
abstract class EmptySchema {
  static const () schema = ();
}

@schemaContainsPositionalFields
@ZodArt.withExistingClass(outputClassType: OutputClass)
abstract class PositionalArgs {
  static final (ZInt, {ZString name}) schema = (ZInt(), name: ZString());
}

@schemaContainsNotZodArtType
@ZodArt.withExistingClass(outputClassType: OutputClass)
abstract class UnsupportedType {
  static final schema = (name: DateTime.now());
}

typedef SomeRecord = ({String name});

@ShouldThrow(
  '@ZodArt - output type must be a class. Got an unknown type.',
  element: null,
)
@ZodArt.withExistingClass(outputClassType: SomeRecord)
abstract class WrongExistingTypeRecord {
  static final schema = (name: ZString());
}

enum SomeEnum { name }

@ShouldThrow(
  "@ZodArt - output type must be a class. Got: 'enum SomeEnum'.",
  element: null,
)
@ZodArt.withExistingClass(outputClassType: SomeEnum)
abstract class WrongExistingTypeEnum {
  static final schema = (name: ZString());
}

typedef NullableOutputClass = OutputClass?;

@ShouldThrow(
  "@ZodArt - output type must not be nullable. Got: 'OutputClass?'.",
  element: null,
)
@ZodArt.withExistingClass(outputClassType: NullableOutputClass)
abstract class NullableClass {
  static final schema = (name: ZString());
}

class NoPublicCtorClass {
  const NoPublicCtorClass._();
}

@ShouldThrow(
  '''
@ZodArt - invalid output class.

Unable to generate class instantiation code for 'NoPublicCtorClass'.
Class must contain a public constructor to be used for class instantiation.''',
  element: null,
)
@ZodArt.withExistingClass(outputClassType: NoPublicCtorClass)
abstract class NoPublicCtor {
  static final schema = (name: ZString());
}

class MissingParamClass {
  const MissingParamClass.first();
}

@ShouldThrow(
  '''
@ZodArt - invalid output class.

Unable to generate class instantiation code for 'MissingParamClass'.
Autoselected constructor 'MissingParamClass.first',
which scored highest but failed validation:

  - missing required schema parameters: {name}
''',
  element: null,
)
@ZodArt.withExistingClass(outputClassType: MissingParamClass)
abstract class InvalidCtor {
  static final schema = (name: ZString());
}
