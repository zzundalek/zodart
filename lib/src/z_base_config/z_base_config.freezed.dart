// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'z_base_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ZBaseConfig {
  List<TransformAny<dynamic, dynamic>> get fns =>
      throw _privateConstructorUsedError;
  bool get nullable => throw _privateConstructorUsedError;
  bool get optional => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ZBaseConfigCopyWith<ZBaseConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZBaseConfigCopyWith<$Res> {
  factory $ZBaseConfigCopyWith(
          ZBaseConfig value, $Res Function(ZBaseConfig) then) =
      _$ZBaseConfigCopyWithImpl<$Res, ZBaseConfig>;
  @useResult
  $Res call(
      {List<TransformAny<dynamic, dynamic>> fns, bool nullable, bool optional});
}

/// @nodoc
class _$ZBaseConfigCopyWithImpl<$Res, $Val extends ZBaseConfig>
    implements $ZBaseConfigCopyWith<$Res> {
  _$ZBaseConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fns = null,
    Object? nullable = null,
    Object? optional = null,
  }) {
    return _then(_value.copyWith(
      fns: null == fns
          ? _value.fns
          : fns // ignore: cast_nullable_to_non_nullable
              as List<TransformAny<dynamic, dynamic>>,
      nullable: null == nullable
          ? _value.nullable
          : nullable // ignore: cast_nullable_to_non_nullable
              as bool,
      optional: null == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ZBaseConfigImplCopyWith<$Res>
    implements $ZBaseConfigCopyWith<$Res> {
  factory _$$ZBaseConfigImplCopyWith(
          _$ZBaseConfigImpl value, $Res Function(_$ZBaseConfigImpl) then) =
      __$$ZBaseConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransformAny<dynamic, dynamic>> fns, bool nullable, bool optional});
}

/// @nodoc
class __$$ZBaseConfigImplCopyWithImpl<$Res>
    extends _$ZBaseConfigCopyWithImpl<$Res, _$ZBaseConfigImpl>
    implements _$$ZBaseConfigImplCopyWith<$Res> {
  __$$ZBaseConfigImplCopyWithImpl(
      _$ZBaseConfigImpl _value, $Res Function(_$ZBaseConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fns = null,
    Object? nullable = null,
    Object? optional = null,
  }) {
    return _then(_$ZBaseConfigImpl(
      fns: null == fns
          ? _value._fns
          : fns // ignore: cast_nullable_to_non_nullable
              as List<TransformAny<dynamic, dynamic>>,
      nullable: null == nullable
          ? _value.nullable
          : nullable // ignore: cast_nullable_to_non_nullable
              as bool,
      optional: null == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ZBaseConfigImpl extends _ZBaseConfig {
  const _$ZBaseConfigImpl(
      {required final List<TransformAny<dynamic, dynamic>> fns,
      this.nullable = false,
      this.optional = false})
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

  @override
  String toString() {
    return 'ZBaseConfig(fns: $fns, nullable: $nullable, optional: $optional)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZBaseConfigImpl &&
            const DeepCollectionEquality().equals(other._fns, _fns) &&
            (identical(other.nullable, nullable) ||
                other.nullable == nullable) &&
            (identical(other.optional, optional) ||
                other.optional == optional));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_fns), nullable, optional);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZBaseConfigImplCopyWith<_$ZBaseConfigImpl> get copyWith =>
      __$$ZBaseConfigImplCopyWithImpl<_$ZBaseConfigImpl>(this, _$identity);
}

abstract class _ZBaseConfig extends ZBaseConfig {
  const factory _ZBaseConfig(
      {required final List<TransformAny<dynamic, dynamic>> fns,
      final bool nullable,
      final bool optional}) = _$ZBaseConfigImpl;
  const _ZBaseConfig._() : super._();

  @override
  List<TransformAny<dynamic, dynamic>> get fns;
  @override
  bool get nullable;
  @override
  bool get optional;
  @override
  @JsonKey(ignore: true)
  _$$ZBaseConfigImplCopyWith<_$ZBaseConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
