// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_helper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestObject {

 String get reqStr; int get reqInt; String? get nullableStr; int? get nullableInt; String? get optionalStr; int? get optionalInt;
/// Create a copy of TestObject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestObjectCopyWith<TestObject> get copyWith => _$TestObjectCopyWithImpl<TestObject>(this as TestObject, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestObject&&(identical(other.reqStr, reqStr) || other.reqStr == reqStr)&&(identical(other.reqInt, reqInt) || other.reqInt == reqInt)&&(identical(other.nullableStr, nullableStr) || other.nullableStr == nullableStr)&&(identical(other.nullableInt, nullableInt) || other.nullableInt == nullableInt)&&(identical(other.optionalStr, optionalStr) || other.optionalStr == optionalStr)&&(identical(other.optionalInt, optionalInt) || other.optionalInt == optionalInt));
}


@override
int get hashCode => Object.hash(runtimeType,reqStr,reqInt,nullableStr,nullableInt,optionalStr,optionalInt);

@override
String toString() {
  return 'TestObject(reqStr: $reqStr, reqInt: $reqInt, nullableStr: $nullableStr, nullableInt: $nullableInt, optionalStr: $optionalStr, optionalInt: $optionalInt)';
}


}

/// @nodoc
abstract mixin class $TestObjectCopyWith<$Res>  {
  factory $TestObjectCopyWith(TestObject value, $Res Function(TestObject) _then) = _$TestObjectCopyWithImpl;
@useResult
$Res call({
 String reqStr, int reqInt, String? nullableStr, int? nullableInt, String? optionalStr, int? optionalInt
});




}
/// @nodoc
class _$TestObjectCopyWithImpl<$Res>
    implements $TestObjectCopyWith<$Res> {
  _$TestObjectCopyWithImpl(this._self, this._then);

  final TestObject _self;
  final $Res Function(TestObject) _then;

/// Create a copy of TestObject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reqStr = null,Object? reqInt = null,Object? nullableStr = freezed,Object? nullableInt = freezed,Object? optionalStr = freezed,Object? optionalInt = freezed,}) {
  return _then(_self.copyWith(
reqStr: null == reqStr ? _self.reqStr : reqStr // ignore: cast_nullable_to_non_nullable
as String,reqInt: null == reqInt ? _self.reqInt : reqInt // ignore: cast_nullable_to_non_nullable
as int,nullableStr: freezed == nullableStr ? _self.nullableStr : nullableStr // ignore: cast_nullable_to_non_nullable
as String?,nullableInt: freezed == nullableInt ? _self.nullableInt : nullableInt // ignore: cast_nullable_to_non_nullable
as int?,optionalStr: freezed == optionalStr ? _self.optionalStr : optionalStr // ignore: cast_nullable_to_non_nullable
as String?,optionalInt: freezed == optionalInt ? _self.optionalInt : optionalInt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc


class _TestObject implements TestObject {
  const _TestObject({required this.reqStr, required this.reqInt, this.nullableStr, this.nullableInt, this.optionalStr, this.optionalInt});
  

@override final  String reqStr;
@override final  int reqInt;
@override final  String? nullableStr;
@override final  int? nullableInt;
@override final  String? optionalStr;
@override final  int? optionalInt;

/// Create a copy of TestObject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestObjectCopyWith<_TestObject> get copyWith => __$TestObjectCopyWithImpl<_TestObject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestObject&&(identical(other.reqStr, reqStr) || other.reqStr == reqStr)&&(identical(other.reqInt, reqInt) || other.reqInt == reqInt)&&(identical(other.nullableStr, nullableStr) || other.nullableStr == nullableStr)&&(identical(other.nullableInt, nullableInt) || other.nullableInt == nullableInt)&&(identical(other.optionalStr, optionalStr) || other.optionalStr == optionalStr)&&(identical(other.optionalInt, optionalInt) || other.optionalInt == optionalInt));
}


@override
int get hashCode => Object.hash(runtimeType,reqStr,reqInt,nullableStr,nullableInt,optionalStr,optionalInt);

@override
String toString() {
  return 'TestObject(reqStr: $reqStr, reqInt: $reqInt, nullableStr: $nullableStr, nullableInt: $nullableInt, optionalStr: $optionalStr, optionalInt: $optionalInt)';
}


}

/// @nodoc
abstract mixin class _$TestObjectCopyWith<$Res> implements $TestObjectCopyWith<$Res> {
  factory _$TestObjectCopyWith(_TestObject value, $Res Function(_TestObject) _then) = __$TestObjectCopyWithImpl;
@override @useResult
$Res call({
 String reqStr, int reqInt, String? nullableStr, int? nullableInt, String? optionalStr, int? optionalInt
});




}
/// @nodoc
class __$TestObjectCopyWithImpl<$Res>
    implements _$TestObjectCopyWith<$Res> {
  __$TestObjectCopyWithImpl(this._self, this._then);

  final _TestObject _self;
  final $Res Function(_TestObject) _then;

/// Create a copy of TestObject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reqStr = null,Object? reqInt = null,Object? nullableStr = freezed,Object? nullableInt = freezed,Object? optionalStr = freezed,Object? optionalInt = freezed,}) {
  return _then(_TestObject(
reqStr: null == reqStr ? _self.reqStr : reqStr // ignore: cast_nullable_to_non_nullable
as String,reqInt: null == reqInt ? _self.reqInt : reqInt // ignore: cast_nullable_to_non_nullable
as int,nullableStr: freezed == nullableStr ? _self.nullableStr : nullableStr // ignore: cast_nullable_to_non_nullable
as String?,nullableInt: freezed == nullableInt ? _self.nullableInt : nullableInt // ignore: cast_nullable_to_non_nullable
as int?,optionalStr: freezed == optionalStr ? _self.optionalStr : optionalStr // ignore: cast_nullable_to_non_nullable
as String?,optionalInt: freezed == optionalInt ? _self.optionalInt : optionalInt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
