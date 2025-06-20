import '../base/base.dart';
import '../types/types.dart';

/// Strictly parses [val] as type [T].
///
/// Returns a successful [ZRes] containing [val] if it is of type [T].
/// Otherwise, returns a [ZRes] with a single parse failure [ZIssueParseFail].
///
/// This function performs a runtime type check and does not perform any type coercion.
///
/// Example:
/// ```dart
/// parseStrict<int>(42); // Success with value 42
/// parseStrict<int>('42'); // Error with parse failure
/// ```
ZRes<T> parseStrict<T>(Object? val) =>
    val is T ? ZRes.success(val) : ZRes.errorSingleIssue(ZIssueParseFail(from: val.runtimeType, to: T, val: val));

/// Parses [val] strictly as a [String].
///
/// Equivalent to `parseStrict<String>(val)`.
///
/// Returns success if [val] is a [String], otherwise an error.
ZRes<String> parseString(Object? val) => parseStrict(val);

/// Parses [val] strictly as a [DateTime].
///
/// Equivalent to `parseStrict<DateTime>(val)`.
///
/// Returns success if [val] is a [DateTime], otherwise an error.
ZRes<DateTime> parseDateTime(Object? val) => parseStrict(val);

/// Parses [val] strictly as an [int].
///
/// Equivalent to `parseStrict<int>(val)`.
///
/// Returns success if [val] is an [int], otherwise an error.
ZRes<int> parseInt(Object? val) => parseStrict(val);

/// Parses [val] strictly as a [double].
///
/// Equivalent to `parseStrict<double>(val)`.
///
/// Returns success if [val] is a [double], otherwise an error.
ZRes<double> parseDouble(Object? val) => parseStrict(val);

/// Parses [val] strictly as a [bool].
///
/// Equivalent to `parseStrict<bool>(val)`.
///
/// Returns success if [val] is a [bool], otherwise an error.
ZRes<bool> parseBool(Object? val) => parseStrict(val);

/// Returns a parser function that parses an object of type [T] using the given [schema]
/// and maps the parsed map to [T] using the provided [mapper].
///
/// The returned function expects an [Object?] and attempts to parse it as a [Map<String, dynamic>].
/// If successful, it delegates to [parseObjectFromMap].
/// Otherwise, returns a single parse failure error.
ZRes<T> Function(Object?) parseObject<T>(ObjectSchema schema, ObjectMapper<T> mapper) => (Object? val) {
  return switch (val) {
    final Map<String, dynamic> val => parseObjectFromMap(mapper: mapper, schema: schema, val: val),
    _ => ZRes.errorSingleIssue(ZIssueParseFail(from: val.runtimeType, to: T, val: val)),
  };
};

/// Parses a [Map<String, dynamic>] [val] according to the given [schema]
/// and maps the parsed values to type [T] using [mapper].
///
/// Iterates over each entry in the [schema], parses the corresponding value from [val],
/// and collects parsing issues with prepended paths.
///
/// Returns a success with the mapped object if no issue occurs,
/// otherwise returns an error containing all collected issues.
ZRes<T> parseObjectFromMap<T>({
  required ObjectSchema schema,
  required ObjectMapper<T> mapper,
  required Map<String, dynamic> val,
}) {
  final parsedValuesPerKey = <String, dynamic>{};
  final issuesForAllKeys = <ZIssue>[];

  for (final entry in schema.entries) {
    final key = entry.key;
    final schemaForKey = entry.value;
    if (!val.containsKey(key) && !schemaForKey.isOptional) {
      issuesForAllKeys.add(ZIssueMissingValue(rawPath: ZPath.property(key)));
      continue;
    }
    final valueForKey = val[entry.key];

    schemaForKey
        .parse(valueForKey)
        .match(
          (issues) => issuesForAllKeys.addAll(
            issues.map((issue) => issue.copyWith(rawPath: issue.rawPath.prependProperty(key))),
          ),
          (val) => parsedValuesPerKey[key] = val,
        );
  }

  return issuesForAllKeys.isEmpty ? ZRes.success(mapper(parsedValuesPerKey)) : ZRes.error(issuesForAllKeys);
}

/// Returns a parser function that parses a list of [T] values from an [Object?].
///
/// If the input is a [List<dynamic>], it delegates to [parseArrayFromList].
/// Otherwise, returns a single parse failure error.
ZRes<List<T>> Function(Object?) parseArray<T>(ZBase<T> schema) => (Object? val) {
  return switch (val) {
    final List<dynamic> val => parseArrayFromList(values: val, schema: schema),
    _ => ZRes.errorSingleIssue(ZIssueParseFail(from: val.runtimeType, to: List<T>, val: val)),
  };
};

/// Parses a list of dynamic [values] according to the given [schema].
///
/// Iterates over each item, parses it using [schema],
/// collects parsed values and issues with prepended index paths.
///
/// Returns a success with the list of parsed values if no issues occur,
/// otherwise returns an error containing all collected issues.
ZRes<List<T>> parseArrayFromList<T>({
  required List<dynamic> values,
  required ZBase<T> schema,
}) {
  final parsedValues = <T>[];
  final issuesForAllValues = <ZIssue>[];

  for (final entry in values.asMap().entries) {
    schema
        .parse(entry.value)
        .match(
          (issues) => issuesForAllValues.addAll(
            issues.map((issue) => issue.copyWith(rawPath: issue.rawPath.prependIndex(entry.key))),
          ),
          parsedValues.add,
        );
  }

  return issuesForAllValues.isEmpty ? ZRes.success(parsedValues) : ZRes.error(issuesForAllValues);
}
