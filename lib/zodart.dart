/// ZodArt — Type-safe schema validation and parsing for Dart.
///
/// Inspired by [Zod](https://zod.dev), ZodArt allows you to:
/// - Define runtime validation schemas for your data structures
/// - Parse and transform unknown data into statically typed Dart values
/// - Infer types at compile time based on the schema
/// - Apply flexible validation rules and transformations
/// - Build complex nested schemas (objects, arrays, nullable, etc.)
///
/// Typical use cases:
/// - Parsing API responses into strongly-typed models
/// - Validating form data
/// - Cleaning and transforming untyped user input
/// - Ensuring correctness of configuration or external data
///
/// The library is designed with:
/// - **Parse-first philosophy** — schemas parse unknown data and produce validated values
/// - **Type inference** — you get back strongly typed Dart values
/// - **Composable building blocks** — validators, rules, transformations, error handling
///
///
/// # Available types:
/// - `ZString`
/// - `ZInt`
/// - `ZDateTime`
/// - `ZDouble`
/// - `ZBool`
/// - `ZArray`
/// - `ZObject`
/// - `ZNullable<Type>`
///
/// # Contributions
/// Contributions, ideas, and issues are welcome!
///
/// See more on: https://github.com/zzundalek/zodart
library;

// Note: Needed for collection equality/hash in the code generation.
export 'package:collection/collection.dart' show DeepCollectionEquality;
export 'src/zodart_base.dart';
