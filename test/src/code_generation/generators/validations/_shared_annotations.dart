import 'package:source_gen_test/annotations.dart';

const elementIsNotClass = ShouldThrow(
  '@ZodArt - annotation can be used only on a class.',
  element: null,
);

const elementIsNotAbstractClass = ShouldThrow(
  '@ZodArt - make the annotated class `abstract`.',
  element: null,
);

const missingStaticSchemaField = ShouldThrow(
  '@ZodArt - missing static field `schema` in `NoSchemaProp`.',
  element: null,
);

const schemaFieldIsNotRecord = ShouldThrow(
  '@ZodArt - `InvalidSchemaType.schema` should be defined using Record.',
  element: null,
);

const schemaIsEmpty = ShouldThrow(
  '@ZodArt - `EmptySchema.schema` cannot be empty.',
  element: null,
);

const schemaContainsPositionalFields = ShouldThrow(
  '@ZodArt - `PositionalArgs.schema` should contain ONLY named fields.',
  element: null,
);

const schemaContainsNotZodArtType = ShouldThrow(
  '''
@ZodArt - expected a valid ZodArt type in 'UnsupportedType.schema.name', got 'DateTime'.

Make sure it is a valid ZodArt type and can be inferred correctly at build time.''',
  element: null,
);
