// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'z_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ZResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T val) value,
    required TResult Function(List<ZIssue> rawIssues) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T val)? value,
    TResult? Function(List<ZIssue> rawIssues)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T val)? value,
    TResult Function(List<ZIssue> rawIssues)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZValue<T> value) value,
    required TResult Function(ZError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZValue<T> value)? value,
    TResult? Function(ZError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZValue<T> value)? value,
    TResult Function(ZError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZResultCopyWith<T, $Res> {
  factory $ZResultCopyWith(ZResult<T> value, $Res Function(ZResult<T>) then) =
      _$ZResultCopyWithImpl<T, $Res, ZResult<T>>;
}

/// @nodoc
class _$ZResultCopyWithImpl<T, $Res, $Val extends ZResult<T>>
    implements $ZResultCopyWith<T, $Res> {
  _$ZResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ZValueImplCopyWith<T, $Res> {
  factory _$$ZValueImplCopyWith(
          _$ZValueImpl<T> value, $Res Function(_$ZValueImpl<T>) then) =
      __$$ZValueImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T val});
}

/// @nodoc
class __$$ZValueImplCopyWithImpl<T, $Res>
    extends _$ZResultCopyWithImpl<T, $Res, _$ZValueImpl<T>>
    implements _$$ZValueImplCopyWith<T, $Res> {
  __$$ZValueImplCopyWithImpl(
      _$ZValueImpl<T> _value, $Res Function(_$ZValueImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? val = freezed,
  }) {
    return _then(_$ZValueImpl<T>(
      freezed == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ZValueImpl<T> extends ZValue<T> {
  const _$ZValueImpl(this.val) : super._();

  @override
  final T val;

  @override
  String toString() {
    return 'ZResult<$T>.value(val: $val)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZValueImpl<T> &&
            const DeepCollectionEquality().equals(other.val, val));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(val));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZValueImplCopyWith<T, _$ZValueImpl<T>> get copyWith =>
      __$$ZValueImplCopyWithImpl<T, _$ZValueImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T val) value,
    required TResult Function(List<ZIssue> rawIssues) error,
  }) {
    return value(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T val)? value,
    TResult? Function(List<ZIssue> rawIssues)? error,
  }) {
    return value?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T val)? value,
    TResult Function(List<ZIssue> rawIssues)? error,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(val);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZValue<T> value) value,
    required TResult Function(ZError<T> value) error,
  }) {
    return value(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZValue<T> value)? value,
    TResult? Function(ZError<T> value)? error,
  }) {
    return value?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZValue<T> value)? value,
    TResult Function(ZError<T> value)? error,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(this);
    }
    return orElse();
  }
}

abstract class ZValue<T> extends ZResult<T> {
  const factory ZValue(final T val) = _$ZValueImpl<T>;
  const ZValue._() : super._();

  T get val;
  @JsonKey(ignore: true)
  _$$ZValueImplCopyWith<T, _$ZValueImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZErrorImplCopyWith<T, $Res> {
  factory _$$ZErrorImplCopyWith(
          _$ZErrorImpl<T> value, $Res Function(_$ZErrorImpl<T>) then) =
      __$$ZErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<ZIssue> rawIssues});
}

/// @nodoc
class __$$ZErrorImplCopyWithImpl<T, $Res>
    extends _$ZResultCopyWithImpl<T, $Res, _$ZErrorImpl<T>>
    implements _$$ZErrorImplCopyWith<T, $Res> {
  __$$ZErrorImplCopyWithImpl(
      _$ZErrorImpl<T> _value, $Res Function(_$ZErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawIssues = null,
  }) {
    return _then(_$ZErrorImpl<T>(
      null == rawIssues
          ? _value._rawIssues
          : rawIssues // ignore: cast_nullable_to_non_nullable
              as List<ZIssue>,
    ));
  }
}

/// @nodoc

class _$ZErrorImpl<T> extends ZError<T> {
  const _$ZErrorImpl(final List<ZIssue> rawIssues)
      : _rawIssues = rawIssues,
        super._();

  final List<ZIssue> _rawIssues;
  @override
  List<ZIssue> get rawIssues {
    if (_rawIssues is EqualUnmodifiableListView) return _rawIssues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawIssues);
  }

  @override
  String toString() {
    return 'ZResult<$T>.error(rawIssues: $rawIssues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZErrorImpl<T> &&
            const DeepCollectionEquality()
                .equals(other._rawIssues, _rawIssues));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawIssues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZErrorImplCopyWith<T, _$ZErrorImpl<T>> get copyWith =>
      __$$ZErrorImplCopyWithImpl<T, _$ZErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T val) value,
    required TResult Function(List<ZIssue> rawIssues) error,
  }) {
    return error(rawIssues);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T val)? value,
    TResult? Function(List<ZIssue> rawIssues)? error,
  }) {
    return error?.call(rawIssues);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T val)? value,
    TResult Function(List<ZIssue> rawIssues)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(rawIssues);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZValue<T> value) value,
    required TResult Function(ZError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZValue<T> value)? value,
    TResult? Function(ZError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZValue<T> value)? value,
    TResult Function(ZError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ZError<T> extends ZResult<T> {
  const factory ZError(final List<ZIssue> rawIssues) = _$ZErrorImpl<T>;
  const ZError._() : super._();

  List<ZIssue> get rawIssues;
  @JsonKey(ignore: true)
  _$$ZErrorImplCopyWith<T, _$ZErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
