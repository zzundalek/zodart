// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Record {

 Map<String, Reference> get namedFields; List<Reference> get positionalFields;
/// Create a copy of Record
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecordCopyWith<Record> get copyWith => _$RecordCopyWithImpl<Record>(this as Record, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Record&&const DeepCollectionEquality().equals(other.namedFields, namedFields)&&const DeepCollectionEquality().equals(other.positionalFields, positionalFields));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(namedFields),const DeepCollectionEquality().hash(positionalFields));

@override
String toString() {
  return 'Record(namedFields: $namedFields, positionalFields: $positionalFields)';
}


}

/// @nodoc
abstract mixin class $RecordCopyWith<$Res>  {
  factory $RecordCopyWith(Record value, $Res Function(Record) _then) = _$RecordCopyWithImpl;
@useResult
$Res call({
 Map<String, Reference> namedFields, List<Reference> positionalFields
});




}
/// @nodoc
class _$RecordCopyWithImpl<$Res>
    implements $RecordCopyWith<$Res> {
  _$RecordCopyWithImpl(this._self, this._then);

  final Record _self;
  final $Res Function(Record) _then;

/// Create a copy of Record
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? namedFields = null,Object? positionalFields = null,}) {
  return _then(_self.copyWith(
namedFields: null == namedFields ? _self.namedFields : namedFields // ignore: cast_nullable_to_non_nullable
as Map<String, Reference>,positionalFields: null == positionalFields ? _self.positionalFields : positionalFields // ignore: cast_nullable_to_non_nullable
as List<Reference>,
  ));
}

}


/// Adds pattern-matching-related methods to [Record].
extension RecordPatterns on Record {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Record value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Record() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Record value)  $default,){
final _that = this;
switch (_that) {
case _Record():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Record value)?  $default,){
final _that = this;
switch (_that) {
case _Record() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, Reference> namedFields,  List<Reference> positionalFields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Record() when $default != null:
return $default(_that.namedFields,_that.positionalFields);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, Reference> namedFields,  List<Reference> positionalFields)  $default,) {final _that = this;
switch (_that) {
case _Record():
return $default(_that.namedFields,_that.positionalFields);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, Reference> namedFields,  List<Reference> positionalFields)?  $default,) {final _that = this;
switch (_that) {
case _Record() when $default != null:
return $default(_that.namedFields,_that.positionalFields);case _:
  return null;

}
}

}

/// @nodoc


class _Record implements Record {
  const _Record({required final  Map<String, Reference> namedFields, required final  List<Reference> positionalFields}): _namedFields = namedFields,_positionalFields = positionalFields;
  

 final  Map<String, Reference> _namedFields;
@override Map<String, Reference> get namedFields {
  if (_namedFields is EqualUnmodifiableMapView) return _namedFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_namedFields);
}

 final  List<Reference> _positionalFields;
@override List<Reference> get positionalFields {
  if (_positionalFields is EqualUnmodifiableListView) return _positionalFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_positionalFields);
}


/// Create a copy of Record
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecordCopyWith<_Record> get copyWith => __$RecordCopyWithImpl<_Record>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Record&&const DeepCollectionEquality().equals(other._namedFields, _namedFields)&&const DeepCollectionEquality().equals(other._positionalFields, _positionalFields));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_namedFields),const DeepCollectionEquality().hash(_positionalFields));

@override
String toString() {
  return 'Record(namedFields: $namedFields, positionalFields: $positionalFields)';
}


}

/// @nodoc
abstract mixin class _$RecordCopyWith<$Res> implements $RecordCopyWith<$Res> {
  factory _$RecordCopyWith(_Record value, $Res Function(_Record) _then) = __$RecordCopyWithImpl;
@override @useResult
$Res call({
 Map<String, Reference> namedFields, List<Reference> positionalFields
});




}
/// @nodoc
class __$RecordCopyWithImpl<$Res>
    implements _$RecordCopyWith<$Res> {
  __$RecordCopyWithImpl(this._self, this._then);

  final _Record _self;
  final $Res Function(_Record) _then;

/// Create a copy of Record
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? namedFields = null,Object? positionalFields = null,}) {
  return _then(_Record(
namedFields: null == namedFields ? _self._namedFields : namedFields // ignore: cast_nullable_to_non_nullable
as Map<String, Reference>,positionalFields: null == positionalFields ? _self._positionalFields : positionalFields // ignore: cast_nullable_to_non_nullable
as List<Reference>,
  ));
}


}

// dart format on
