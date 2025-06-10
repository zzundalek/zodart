// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'z_path.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ZPath {
  List<ZPathItem> get path => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ZPathCopyWith<ZPath> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZPathCopyWith<$Res> {
  factory $ZPathCopyWith(ZPath value, $Res Function(ZPath) then) =
      _$ZPathCopyWithImpl<$Res, ZPath>;
  @useResult
  $Res call({List<ZPathItem> path});
}

/// @nodoc
class _$ZPathCopyWithImpl<$Res, $Val extends ZPath>
    implements $ZPathCopyWith<$Res> {
  _$ZPathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as List<ZPathItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PathImplCopyWith<$Res> implements $ZPathCopyWith<$Res> {
  factory _$$PathImplCopyWith(
          _$PathImpl value, $Res Function(_$PathImpl) then) =
      __$$PathImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ZPathItem> path});
}

/// @nodoc
class __$$PathImplCopyWithImpl<$Res>
    extends _$ZPathCopyWithImpl<$Res, _$PathImpl>
    implements _$$PathImplCopyWith<$Res> {
  __$$PathImplCopyWithImpl(_$PathImpl _value, $Res Function(_$PathImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$PathImpl(
      null == path
          ? _value._path
          : path // ignore: cast_nullable_to_non_nullable
              as List<ZPathItem>,
    ));
  }
}

/// @nodoc

class _$PathImpl extends _Path {
  const _$PathImpl(final List<ZPathItem> path)
      : _path = path,
        super._();

  final List<ZPathItem> _path;
  @override
  List<ZPathItem> get path {
    if (_path is EqualUnmodifiableListView) return _path;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_path);
  }

  @override
  String toString() {
    return 'ZPath(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PathImpl &&
            const DeepCollectionEquality().equals(other._path, _path));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_path));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PathImplCopyWith<_$PathImpl> get copyWith =>
      __$$PathImplCopyWithImpl<_$PathImpl>(this, _$identity);
}

abstract class _Path extends ZPath {
  const factory _Path(final List<ZPathItem> path) = _$PathImpl;
  const _Path._() : super._();

  @override
  List<ZPathItem> get path;
  @override
  @JsonKey(ignore: true)
  _$$PathImplCopyWith<_$PathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ZPathItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) index,
    required TResult Function(String property) property,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? index,
    TResult? Function(String property)? property,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? index,
    TResult Function(String property)? property,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZIndex value) index,
    required TResult Function(ZProperty value) property,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZIndex value)? index,
    TResult? Function(ZProperty value)? property,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZIndex value)? index,
    TResult Function(ZProperty value)? property,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZPathItemCopyWith<$Res> {
  factory $ZPathItemCopyWith(ZPathItem value, $Res Function(ZPathItem) then) =
      _$ZPathItemCopyWithImpl<$Res, ZPathItem>;
}

/// @nodoc
class _$ZPathItemCopyWithImpl<$Res, $Val extends ZPathItem>
    implements $ZPathItemCopyWith<$Res> {
  _$ZPathItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ZIndexImplCopyWith<$Res> {
  factory _$$ZIndexImplCopyWith(
          _$ZIndexImpl value, $Res Function(_$ZIndexImpl) then) =
      __$$ZIndexImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ZIndexImplCopyWithImpl<$Res>
    extends _$ZPathItemCopyWithImpl<$Res, _$ZIndexImpl>
    implements _$$ZIndexImplCopyWith<$Res> {
  __$$ZIndexImplCopyWithImpl(
      _$ZIndexImpl _value, $Res Function(_$ZIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$ZIndexImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ZIndexImpl implements ZIndex {
  const _$ZIndexImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ZPathItem.index(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZIndexImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZIndexImplCopyWith<_$ZIndexImpl> get copyWith =>
      __$$ZIndexImplCopyWithImpl<_$ZIndexImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) index,
    required TResult Function(String property) property,
  }) {
    return index(this.index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? index,
    TResult? Function(String property)? property,
  }) {
    return index?.call(this.index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? index,
    TResult Function(String property)? property,
    required TResult orElse(),
  }) {
    if (index != null) {
      return index(this.index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZIndex value) index,
    required TResult Function(ZProperty value) property,
  }) {
    return index(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZIndex value)? index,
    TResult? Function(ZProperty value)? property,
  }) {
    return index?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZIndex value)? index,
    TResult Function(ZProperty value)? property,
    required TResult orElse(),
  }) {
    if (index != null) {
      return index(this);
    }
    return orElse();
  }
}

abstract class ZIndex implements ZPathItem {
  const factory ZIndex(final int index) = _$ZIndexImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$ZIndexImplCopyWith<_$ZIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZPropertyImplCopyWith<$Res> {
  factory _$$ZPropertyImplCopyWith(
          _$ZPropertyImpl value, $Res Function(_$ZPropertyImpl) then) =
      __$$ZPropertyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String property});
}

/// @nodoc
class __$$ZPropertyImplCopyWithImpl<$Res>
    extends _$ZPathItemCopyWithImpl<$Res, _$ZPropertyImpl>
    implements _$$ZPropertyImplCopyWith<$Res> {
  __$$ZPropertyImplCopyWithImpl(
      _$ZPropertyImpl _value, $Res Function(_$ZPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? property = null,
  }) {
    return _then(_$ZPropertyImpl(
      null == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ZPropertyImpl implements ZProperty {
  const _$ZPropertyImpl(this.property);

  @override
  final String property;

  @override
  String toString() {
    return 'ZPathItem.property(property: $property)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZPropertyImpl &&
            (identical(other.property, property) ||
                other.property == property));
  }

  @override
  int get hashCode => Object.hash(runtimeType, property);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZPropertyImplCopyWith<_$ZPropertyImpl> get copyWith =>
      __$$ZPropertyImplCopyWithImpl<_$ZPropertyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) index,
    required TResult Function(String property) property,
  }) {
    return property(this.property);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? index,
    TResult? Function(String property)? property,
  }) {
    return property?.call(this.property);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? index,
    TResult Function(String property)? property,
    required TResult orElse(),
  }) {
    if (property != null) {
      return property(this.property);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZIndex value) index,
    required TResult Function(ZProperty value) property,
  }) {
    return property(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZIndex value)? index,
    TResult? Function(ZProperty value)? property,
  }) {
    return property?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZIndex value)? index,
    TResult Function(ZProperty value)? property,
    required TResult orElse(),
  }) {
    if (property != null) {
      return property(this);
    }
    return orElse();
  }
}

abstract class ZProperty implements ZPathItem {
  const factory ZProperty(final String property) = _$ZPropertyImpl;

  String get property;
  @JsonKey(ignore: true)
  _$$ZPropertyImplCopyWith<_$ZPropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
