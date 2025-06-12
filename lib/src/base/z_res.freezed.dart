// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'z_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ZResult<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is ZResult<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ZResult<$T>()';
  }
}

/// @nodoc
class $ZResultCopyWith<T, $Res> {
  $ZResultCopyWith(ZResult<T> _, $Res Function(ZResult<T>) __);
}

/// @nodoc

class ZValue<T> extends ZResult<T> {
  const ZValue(this.val) : super._();

  final T val;

  /// Create a copy of ZResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ZValueCopyWith<T, ZValue<T>> get copyWith => _$ZValueCopyWithImpl<T, ZValue<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZValue<T> &&
            const DeepCollectionEquality().equals(other.val, val));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(val));

  @override
  String toString() {
    return 'ZResult<$T>.value(val: $val)';
  }
}

/// @nodoc
abstract mixin class $ZValueCopyWith<T, $Res> implements $ZResultCopyWith<T, $Res> {
  factory $ZValueCopyWith(ZValue<T> value, $Res Function(ZValue<T>) _then) = _$ZValueCopyWithImpl;
  @useResult
  $Res call({T val});
}

/// @nodoc
class _$ZValueCopyWithImpl<T, $Res> implements $ZValueCopyWith<T, $Res> {
  _$ZValueCopyWithImpl(this._self, this._then);

  final ZValue<T> _self;
  final $Res Function(ZValue<T>) _then;

  /// Create a copy of ZResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? val = freezed,
  }) {
    return _then(ZValue<T>(
      freezed == val
          ? _self.val
          : val // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class ZError<T> extends ZResult<T> {
  const ZError(final ZIssues rawIssues)
      : _rawIssues = rawIssues,
        super._();

  final ZIssues _rawIssues;
  ZIssues get rawIssues {
    if (_rawIssues is EqualUnmodifiableListView) return _rawIssues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawIssues);
  }

  /// Create a copy of ZResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ZErrorCopyWith<T, ZError<T>> get copyWith => _$ZErrorCopyWithImpl<T, ZError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZError<T> &&
            const DeepCollectionEquality().equals(other._rawIssues, _rawIssues));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawIssues));

  @override
  String toString() {
    return 'ZResult<$T>.error(rawIssues: $rawIssues)';
  }
}

/// @nodoc
abstract mixin class $ZErrorCopyWith<T, $Res> implements $ZResultCopyWith<T, $Res> {
  factory $ZErrorCopyWith(ZError<T> value, $Res Function(ZError<T>) _then) = _$ZErrorCopyWithImpl;
  @useResult
  $Res call({ZIssues rawIssues});
}

/// @nodoc
class _$ZErrorCopyWithImpl<T, $Res> implements $ZErrorCopyWith<T, $Res> {
  _$ZErrorCopyWithImpl(this._self, this._then);

  final ZError<T> _self;
  final $Res Function(ZError<T>) _then;

  /// Create a copy of ZResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rawIssues = null,
  }) {
    return _then(ZError<T>(
      null == rawIssues
          ? _self._rawIssues
          : rawIssues // ignore: cast_nullable_to_non_nullable
              as ZIssues,
    ));
  }
}

// dart format on
