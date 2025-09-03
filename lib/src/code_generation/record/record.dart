import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart' show Reference, refer;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'record.freezed.dart';

/// A base class representation of a record type.
///
/// Use [Record.fromRecordType] to create [Record] from a [RecordType].
@freezed
abstract class Record with _$Record {
  /// Returns a new [Record] instance.
  const factory Record({
    required Map<String, Reference> namedFields,
    required List<Reference> positionalFields,
  }) = _Record;

  /// Returns a new [Record] instance from [RecordType].
  factory Record.fromRecordType(RecordType recordType) {
    final namedFields = Map.fromEntries(recordType.namedFields.map(toNamedParam));
    final positionalFields = recordType.positionalFields.map(toUnnamedParam).toList();

    return Record(namedFields: namedFields, positionalFields: positionalFields);
  }

  /// Returns a reference for an unnamed parameter
  @visibleForTesting
  static Reference toUnnamedParam(RecordTypePositionalField p) => refer(p.type.getDisplayString());

  /// Returns a name, reference for a named parameter
  @visibleForTesting
  static MapEntry<String, Reference> toNamedParam(RecordTypeNamedField p) => MapEntry(
    p.name,
    refer(p.type.getDisplayString()),
  );
}
