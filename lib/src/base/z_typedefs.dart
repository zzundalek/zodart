import '../types/types.dart';
import 'base.dart';

/// A list of issues that occurred during parsing, validation, or transformation.
typedef ZIssues = List<ZIssue>;

/// Transforms a value of type [From] into type [To].
/// Returns a [ZRes<To>] indicating success or error.
/// This is the general form of a transformation.
typedef Transformer<From, To> = ZRes<To> Function(From);

/// Validates a value of type [T].
/// Returns a [ZRes<T>] that contains either a list of issues or the value.
/// A rule is a special case of a transformer where input and output types are the same.
typedef Rule<T> = ZRes<T> Function(T);

/// Processes a value of type [T].
/// Returns a [ZRes<T>] that contains either a list of issues or the processed value.
/// A processor is a special case of a transformer where input and output types are the same.
typedef Processor<T> = T Function(T val);

/// Parses untyped input (usually dynamic or JSON-like data) into a typed value [T].
/// Returns a [ZRes<T>] to capture parsing success or error.
typedef Parser<T> = ZRes<T> Function(Object? input);

/// A helper type for rules to ensure type safety.
/// Equivalent to a [Transformer] with input and output both of type [T].
typedef RuleAny<T> = TransformAny<T, T>;

/// A helper type for parsing to ensure type safety.
/// Equivalent to a [Transformer] from untyped input [Object?] to [T].
typedef ParseAny<T> = TransformAny<Object?, T>;

/// A schema defining the shape of a [ZObject], mapping keys to [ZBase] validators or transformers.
typedef ObjectSchema = Map<String, ZBase<dynamic>>;

/// The raw JSON-like data input to be parsed according to an [ObjectSchema].
typedef ObjectJson = Map<String, dynamic>;

/// Maps parsed JSON data into an object of type [T].
/// Takes the successfully parsed [ObjectJson] and returns an instance of [T].
typedef ObjectMapper<T> = T Function(ObjectJson);

/// A schema to define [ZObject] shape.
///
/// Takes [String] as the key and [ZBase] as the value.
///
/// Example:
/// ```dart
///  final ZSchema zSchema = {
///    'firstName': ZString().min(1),
///    'lastName': ZString().min(1),
///    'age': ZInt().nullable().min(0),
///  };
/// ```
typedef ZSchema = Map<String, ZBase<dynamic>>;

/// Function used to validate a value using a custom function.
typedef Refiner<T> = bool Function(T val);

/// Return type for [SuperRefiner] when validation fails.
///
/// At least one [ZIssue] must be returned.
/// Additional [ZIssues] can be provided using `others`.
typedef SuperRefinerErrorRes = (ZIssue, {ZIssues others});

/// Function used to validate a value using a custom function.
///
/// This is a more flexible and verbose alternative to [Refiner].
typedef SuperRefiner<T> = SuperRefinerErrorRes? Function(T val);
