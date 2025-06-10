// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_helper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TestObject {
  String get reqStr => throw _privateConstructorUsedError;
  int get reqInt => throw _privateConstructorUsedError;
  String? get nullableStr => throw _privateConstructorUsedError;
  int? get nullableInt => throw _privateConstructorUsedError;
  String? get optionalStr => throw _privateConstructorUsedError;
  int? get optionalInt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TestObjectCopyWith<TestObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestObjectCopyWith<$Res> {
  factory $TestObjectCopyWith(
          TestObject value, $Res Function(TestObject) then) =
      _$TestObjectCopyWithImpl<$Res, TestObject>;
  @useResult
  $Res call(
      {String reqStr,
      int reqInt,
      String? nullableStr,
      int? nullableInt,
      String? optionalStr,
      int? optionalInt});
}

/// @nodoc
class _$TestObjectCopyWithImpl<$Res, $Val extends TestObject>
    implements $TestObjectCopyWith<$Res> {
  _$TestObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reqStr = null,
    Object? reqInt = null,
    Object? nullableStr = freezed,
    Object? nullableInt = freezed,
    Object? optionalStr = freezed,
    Object? optionalInt = freezed,
  }) {
    return _then(_value.copyWith(
      reqStr: null == reqStr
          ? _value.reqStr
          : reqStr // ignore: cast_nullable_to_non_nullable
              as String,
      reqInt: null == reqInt
          ? _value.reqInt
          : reqInt // ignore: cast_nullable_to_non_nullable
              as int,
      nullableStr: freezed == nullableStr
          ? _value.nullableStr
          : nullableStr // ignore: cast_nullable_to_non_nullable
              as String?,
      nullableInt: freezed == nullableInt
          ? _value.nullableInt
          : nullableInt // ignore: cast_nullable_to_non_nullable
              as int?,
      optionalStr: freezed == optionalStr
          ? _value.optionalStr
          : optionalStr // ignore: cast_nullable_to_non_nullable
              as String?,
      optionalInt: freezed == optionalInt
          ? _value.optionalInt
          : optionalInt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestObjectImplCopyWith<$Res>
    implements $TestObjectCopyWith<$Res> {
  factory _$$TestObjectImplCopyWith(
          _$TestObjectImpl value, $Res Function(_$TestObjectImpl) then) =
      __$$TestObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reqStr,
      int reqInt,
      String? nullableStr,
      int? nullableInt,
      String? optionalStr,
      int? optionalInt});
}

/// @nodoc
class __$$TestObjectImplCopyWithImpl<$Res>
    extends _$TestObjectCopyWithImpl<$Res, _$TestObjectImpl>
    implements _$$TestObjectImplCopyWith<$Res> {
  __$$TestObjectImplCopyWithImpl(
      _$TestObjectImpl _value, $Res Function(_$TestObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reqStr = null,
    Object? reqInt = null,
    Object? nullableStr = freezed,
    Object? nullableInt = freezed,
    Object? optionalStr = freezed,
    Object? optionalInt = freezed,
  }) {
    return _then(_$TestObjectImpl(
      reqStr: null == reqStr
          ? _value.reqStr
          : reqStr // ignore: cast_nullable_to_non_nullable
              as String,
      reqInt: null == reqInt
          ? _value.reqInt
          : reqInt // ignore: cast_nullable_to_non_nullable
              as int,
      nullableStr: freezed == nullableStr
          ? _value.nullableStr
          : nullableStr // ignore: cast_nullable_to_non_nullable
              as String?,
      nullableInt: freezed == nullableInt
          ? _value.nullableInt
          : nullableInt // ignore: cast_nullable_to_non_nullable
              as int?,
      optionalStr: freezed == optionalStr
          ? _value.optionalStr
          : optionalStr // ignore: cast_nullable_to_non_nullable
              as String?,
      optionalInt: freezed == optionalInt
          ? _value.optionalInt
          : optionalInt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$TestObjectImpl implements _TestObject {
  const _$TestObjectImpl(
      {required this.reqStr,
      required this.reqInt,
      this.nullableStr,
      this.nullableInt,
      this.optionalStr,
      this.optionalInt});

  @override
  final String reqStr;
  @override
  final int reqInt;
  @override
  final String? nullableStr;
  @override
  final int? nullableInt;
  @override
  final String? optionalStr;
  @override
  final int? optionalInt;

  @override
  String toString() {
    return 'TestObject(reqStr: $reqStr, reqInt: $reqInt, nullableStr: $nullableStr, nullableInt: $nullableInt, optionalStr: $optionalStr, optionalInt: $optionalInt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestObjectImpl &&
            (identical(other.reqStr, reqStr) || other.reqStr == reqStr) &&
            (identical(other.reqInt, reqInt) || other.reqInt == reqInt) &&
            (identical(other.nullableStr, nullableStr) ||
                other.nullableStr == nullableStr) &&
            (identical(other.nullableInt, nullableInt) ||
                other.nullableInt == nullableInt) &&
            (identical(other.optionalStr, optionalStr) ||
                other.optionalStr == optionalStr) &&
            (identical(other.optionalInt, optionalInt) ||
                other.optionalInt == optionalInt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reqStr, reqInt, nullableStr,
      nullableInt, optionalStr, optionalInt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestObjectImplCopyWith<_$TestObjectImpl> get copyWith =>
      __$$TestObjectImplCopyWithImpl<_$TestObjectImpl>(this, _$identity);
}

abstract class _TestObject implements TestObject {
  const factory _TestObject(
      {required final String reqStr,
      required final int reqInt,
      final String? nullableStr,
      final int? nullableInt,
      final String? optionalStr,
      final int? optionalInt}) = _$TestObjectImpl;

  @override
  String get reqStr;
  @override
  int get reqInt;
  @override
  String? get nullableStr;
  @override
  int? get nullableInt;
  @override
  String? get optionalStr;
  @override
  int? get optionalInt;
  @override
  @JsonKey(ignore: true)
  _$$TestObjectImplCopyWith<_$TestObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
