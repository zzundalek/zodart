// Not needed
// ignore_for_file: specify_nonobvious_property_types

import 'package:source_gen_test/annotations.dart';
import 'package:zodart/zodart.dart';

import '_shared_annotations.dart';

// **************************************************************************
// Helper objects
// **************************************************************************

typedef OutputRecord = ({String name});

// **************************************************************************
// Test cases
// **************************************************************************

@elementIsNotClass
@ZodArt.withRecord(outputRecordType: OutputRecord)
final notClass = (name: ZString());

@elementIsNotAbstractClass
@ZodArt.withRecord(outputRecordType: OutputRecord)
class NotAbstractClass {}

@missingStaticSchemaField
@ZodArt.withRecord(outputRecordType: OutputRecord)
abstract class NoSchemaProp {
  final schema = '';
}

@schemaFieldIsNotRecord
@ZodArt.withRecord(outputRecordType: OutputRecord)
abstract class InvalidSchemaType {
  static final schema = <String, dynamic>{};
}

@schemaIsEmpty
@ZodArt.withRecord(outputRecordType: OutputRecord)
abstract class EmptySchema {
  static const () schema = ();
}

@schemaContainsPositionalFields
@ZodArt.withRecord(outputRecordType: OutputRecord)
abstract class PositionalArgs {
  static final (ZInt, {ZString name}) schema = (ZInt(), name: ZString());
}

@schemaContainsNotZodArtType
@ZodArt.withRecord(outputRecordType: OutputRecord)
abstract class UnsupportedType {
  static final schema = (name: DateTime.now());
}

enum SomeEnum { name }

@ShouldThrow(
  "@ZodArt - output type must be a record. Got: 'SomeEnum'.",
  element: null,
)
@ZodArt.withRecord(outputRecordType: SomeEnum)
abstract class WrongExistingTypeEnum {
  static final schema = (name: ZString());
}

typedef NullableRecord = OutputRecord?;

@ShouldThrow(
  "@ZodArt - output type must not be nullable. Got: '({String name})?'.",
  element: null,
)
@ZodArt.withRecord(outputRecordType: NullableRecord)
abstract class NullableClass {
  static final schema = (name: ZString());
}

typedef PositionalFieldRec = (String,);

@ShouldThrow(
  '''
@ZodArt - invalid output record type.

Unable to generate record creation code.
The output record failed validation:

  - requires unnamed (positional) parameters
  - missing required schema parameters: {name}
''',
  element: null,
)
@ZodArt.withRecord(outputRecordType: PositionalFieldRec)
abstract class OutputRecordPositionalParam {
  static final schema = (name: ZString());
}

@ShouldThrow(
  '''
@ZodArt - invalid output record type.

Unable to generate record creation code.
The output record failed validation:

  - missing required schema parameters: {age}
''',
  element: null,
)
@ZodArt.withRecord(outputRecordType: OutputRecord)
abstract class OutputRecordMissingParam {
  static final schema = (name: ZString(), age: ZInt());
}

typedef UnwantedFieldRec = ({String name, int age});

@ShouldThrow(
  '''
@ZodArt - invalid output record type.

Unable to generate record creation code.
The output record failed validation:

  - unexpected parameters not defined in the schema: {age}
''',
  element: null,
)
@ZodArt.withRecord(outputRecordType: UnwantedFieldRec)
abstract class OutputRecordExcessiveParam {
  static final schema = (name: ZString());
}
