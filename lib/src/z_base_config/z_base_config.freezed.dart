// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'z_base_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ZBaseConfig {
  List<TransformAny<dynamic, dynamic>> get fns;
  bool get nullable;
  bool get optional;

  /// Create a copy of ZBaseConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ZBaseConfigCopyWith<ZBaseConfig> get copyWith =>
      _$ZBaseConfigCopyWithImpl<ZBaseConfig>(this as ZBaseConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZBaseConfig &&
            const DeepCollectionEquality().equals(other.fns, fns) &&
            (identical(other.nullable, nullable) || other.nullable == nullable) &&
            (identical(other.optional, optional) || other.optional == optional));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(fns), nullable, optional);

  @override
  String toString() {
    return 'ZBaseConfig(fns: $fns, nullable: $nullable, optional: $optional)';
  }
}

/// @nodoc
abstract mixin class $ZBaseConfigCopyWith<$Res> {
  factory $ZBaseConfigCopyWith(ZBaseConfig value, $Res Function(ZBaseConfig) _then) = _$ZBaseConfigCopyWithImpl;
  @useResult
  $Res call({List<TransformAny<dynamic, dynamic>> fns, bool nullable, bool optional});
}

/// @nodoc
class _$ZBaseConfigCopyWithImpl<$Res> implements $ZBaseConfigCopyWith<$Res> {
  _$ZBaseConfigCopyWithImpl(this._self, this._then);

  final ZBaseConfig _self;
  final $Res Function(ZBaseConfig) _then;

  /// Create a copy of ZBaseConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fns = null,
    Object? nullable = null,
    Object? optional = null,
  }) {
    return _then(_self.copyWith(
      fns: null == fns
          ? _self.fns
          : fns // ignore: cast_nullable_to_non_nullable
              as List<TransformAny<dynamic, dynamic>>,
      nullable: null == nullable
          ? _self.nullable
          : nullable // ignore: cast_nullable_to_non_nullable
              as bool,
      optional: null == optional
          ? _self.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _ZBaseConfig extends ZBaseConfig {
  const _ZBaseConfig(
      {required final List<TransformAny<dynamic, dynamic>> fns, this.nullable = false, this.optional = false})
      : _fns = fns,
        super._();

  final List<TransformAny<dynamic, dynamic>> _fns;
  @override
  List<TransformAny<dynamic, dynamic>> get fns {
    if (_fns is EqualUnmodifiableListView) return _fns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fns);
  }

  @override
  @JsonKey()
  final bool nullable;
  @override
  @JsonKey()
  final bool optional;

  /// Create a copy of ZBaseConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ZBaseConfigCopyWith<_ZBaseConfig> get copyWith => __$ZBaseConfigCopyWithImpl<_ZBaseConfig>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ZBaseConfig &&
            const DeepCollectionEquality().equals(other._fns, _fns) &&
            (identical(other.nullable, nullable) || other.nullable == nullable) &&
            (identical(other.optional, optional) || other.optional == optional));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_fns), nullable, optional);

  @override
  String toString() {
    return 'ZBaseConfig(fns: $fns, nullable: $nullable, optional: $optional)';
  }
}

/// @nodoc
abstract mixin class _$ZBaseConfigCopyWith<$Res> implements $ZBaseConfigCopyWith<$Res> {
  factory _$ZBaseConfigCopyWith(_ZBaseConfig value, $Res Function(_ZBaseConfig) _then) = __$ZBaseConfigCopyWithImpl;
  @override
  @useResult
  $Res call({List<TransformAny<dynamic, dynamic>> fns, bool nullable, bool optional});
}

/// @nodoc
class __$ZBaseConfigCopyWithImpl<$Res> implements _$ZBaseConfigCopyWith<$Res> {
  __$ZBaseConfigCopyWithImpl(this._self, this._then);

  final _ZBaseConfig _self;
  final $Res Function(_ZBaseConfig) _then;

  /// Create a copy of ZBaseConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fns = null,
    Object? nullable = null,
    Object? optional = null,
  }) {
    return _then(_ZBaseConfig(
      fns: null == fns
          ? _self._fns
          : fns // ignore: cast_nullable_to_non_nullable
              as List<TransformAny<dynamic, dynamic>>,
      nullable: null == nullable
          ? _self.nullable
          : nullable // ignore: cast_nullable_to_non_nullable
              as bool,
      optional: null == optional
          ? _self.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
