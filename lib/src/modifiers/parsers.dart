import 'package:collection/collection.dart';
import 'package:fpdart/fpdart.dart';

import '../base/base.dart';
import '../base/cross_field_validation.dart';
import '../types/types.dart';
import 'modifiers.dart';

/// Strictly parses [val] as type [T].
///
/// Returns a successful [ZRes] containing [val] if it is of type [T].
/// If the value is null, returns a [ZRes] with a single parse failure [ZIssueRequired].
/// Otherwise, returns a [ZRes] with a single parse failure [ZIssueParseFail].
///
/// This function performs a runtime type check and does not perform any type coercion.
///
/// Example:
/// ```dart
/// parseStrict<int>(42); // Success with value 42
/// parseStrict<int>('42'); // Error with parse failure
/// ```
ZRes<T> parseStrict<T>(Object? val) {
  if (val == null) {
    return ZRes.errorSingleIssue(const ZIssue.required());
  }
  return val is T
      ? ZRes.success(val as T)
      : ZRes.errorSingleIssue(ZIssueParseFail(from: val.runtimeType, to: T, val: val));
}

/// Parses [val] as an [int], allowing lossless coercion from supported types.
///
/// If [val] is already an [int], it is returned unchanged.
/// If [val] is a [String], it is parsed as an integer.
/// Otherwise, the value is passed to [parseStrict], which requires it to
/// already be an [int].
///
/// This function performs only supported, non-lossy coercions.
///
/// Examples:
/// ```dart
/// parseIntCoerce(42);      // Success with value 42
/// parseIntCoerce('42');    // Success with value 42
/// parseIntCoerce(42.5);    // Error with parse failure
/// ```
ZRes<int> parseIntCoerce(Object? val) {
  return val is String ? stringToInt(val) : parseStrict(val);
}

/// Parses [val] as a [double], allowing lossless coercion from supported types.
///
/// If [val] is already a [double], it is returned unchanged.
/// If [val] is an [int], it is converted to a [double].
/// If [val] is a [String], it is parsed as a double.
/// Otherwise, the value is passed to [parseStrict], which requires it to
/// already be a [double].
///
/// This function does not perform potentially lossy narrowing conversions,
/// such as converting a [double] to an [int].
///
/// Examples:
/// ```dart
/// parseDoubleCoerce(42.0); // Success with value 42.0
/// parseDoubleCoerce(42);   // Success with value 42.0
/// parseDoubleCoerce('42'); // Success with value 42.0
/// parseDoubleCoerce({}); / /Error with parse failure
/// ```
ZRes<double> parseDoubleCoerce(Object? val) {
  if (val is int) {
    return intToDouble(val);
  } else if (val is String) {
    return stringToDouble(val);
  } else {
    return parseStrict(val);
  }
}

/// Parses [val] as a [DateTime], allowing coercion from supported types.
///
/// If [val] is already a [DateTime], it is returned unchanged.
/// If [val] is a [String], it is parsed as a [DateTime].
/// Otherwise, the value is passed to [parseStrict], which requires it to
/// already be a [DateTime].
///
/// Examples:
/// ```dart
/// parseDateTimeCoerce(DateTime(2026)); // Success with the same DateTime
/// parseDateTimeCoerce('2026-01-01');  // Success with parsed DateTime
/// parseDateTimeCoerce(42);             // Error with parse failure
/// ```
ZRes<DateTime> parseDateTimeCoerce(Object? val) {
  return val is String ? stringToDateTime(val) : parseStrict(val);
}

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

/// Returns a parser function that parses an object of type [T] using the given [schema],
/// applies [crossFieldValidation] using the [crossFieldValidationExecutor]
/// and maps the parsed map to [T] using the provided [mapper].
///
/// The returned function expects an [Object?] and attempts to parse it as a [Map<String, dynamic>].
/// If successful, it delegates to [parseObjectFromMap].
/// Otherwise, returns a single parse failure error.
ZRes<T> Function(Object?) parseObject<T>({
  required ObjectSchema schema,
  required ObjectMapper<T> mapper,
  required UnsafeCrossFieldValidation crossFieldValidation,
  CrossFieldValidationExecutorFactory crossFieldValidationExecutor = CrossFieldValidationExecutor.new,
}) => (val) {
  return switch (val) {
    final Map<String, dynamic> val => parseObjectFromMap(
      mapper: mapper,
      schema: schema,
      val: val,
      crossFieldValidationExecutor: crossFieldValidationExecutor(crossFieldValidation),
    ),
    null => ZRes.errorSingleIssue(const ZIssueRequired()),
    _ => ZRes.errorSingleIssue(ZIssueParseFail(from: val.runtimeType, to: T, val: val)),
  };
};

/// Parses a [Map<String, dynamic>] [val] according to the given [schema]
/// and maps the parsed values to type [T] using [mapper].
///
/// Iterates over each entry in the [schema], parses the corresponding value from [val],
/// and collects parsing issues with prepended paths.
///
/// Then runs the [crossFieldValidationExecutor] and collects all issues.
///
/// Returns a success with the mapped object if no issue occurs,
/// otherwise returns an error containing all collected issues.
ZRes<T> parseObjectFromMap<T>({
  required ObjectSchema schema,
  required ObjectMapper<T> mapper,
  required Map<String, dynamic> val,
  required CrossFieldValidationExecutor crossFieldValidationExecutor,
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

  final crossValidationIssues = crossFieldValidationExecutor.execute(
    succesfullyParsedValues: parsedValuesPerKey,
    schema: schema,
  );

  issuesForAllKeys.addAll(crossValidationIssues);

  return issuesForAllKeys.isEmpty ? ZRes.success(mapper(parsedValuesPerKey)) : ZRes.error(issuesForAllKeys);
}

/// Returns a parser function that parses a list of [T] values from an [Object?].
///
/// If the input is a [List<dynamic>], it delegates to [parseArrayFromList].
/// Otherwise, returns a single parse failure error.
ZRes<List<T>> Function(Object?) parseArray<T>(ZBase<T> schema) => (val) {
  return switch (val) {
    final List<dynamic> val => parseArrayFromList(values: val, schema: schema),
    null => ZRes.errorSingleIssue(const ZIssueRequired()),
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

/// Returns a parser function that parses an enum of type [T] from an [Object?].
///
/// - if the input type is [T], return [ZRes] containing the value.
/// - if the input type is [String] tries to parse the value against `[Enum.values].name`
/// - otherwise returns [ZRes] containing [ZIssue]
ZRes<T> Function(Object? val) parseEnum<T extends Enum>(List<T> enumValues) =>
    (val) => switch (val) {
      final T enumValue => ZRes.success(enumValue),
      final String stringValue => _parseEnumFromString(stringValue, enumValues),
      null => ZRes.errorSingleIssue(const ZIssueRequired()),
      _ => ZRes.errorSingleIssue(ZIssueParseFail(from: val.runtimeType, to: T, val: val)),
    };

ZRes<T> _parseEnumFromString<T extends Enum>(String val, List<T> enumValues) =>
    Option.fromNullable(enumValues.firstWhereOrNull((e) => e.name == val)).match(
      () => ZRes.errorSingleIssue(ZIssueParseFail(from: val.runtimeType, to: T, val: val)),
      ZRes.success,
    );

/// Returns a function that parses an enum of type [T] from an [Object?] using [customParser].
ZRes<T> Function(Object? val) parseEnumCustom<T extends Enum>(EnumParser<T> customParser) =>
    (val) => Option.fromNullable(customParser(val)).match(
      () => ZRes.errorSingleIssue(ZIssueParseFail(from: val.runtimeType, to: T, val: val)),
      ZRes.success,
    );
