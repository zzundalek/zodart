// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'z_path.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ZPath {
  List<ZPathItem> get path;

  /// Create a copy of ZPath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ZPathCopyWith<ZPath> get copyWith => _$ZPathCopyWithImpl<ZPath>(this as ZPath, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ZPath && const DeepCollectionEquality().equals(other.path, path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(path));

  @override
  String toString() {
    return 'ZPath(path: $path)';
  }
}

/// @nodoc
abstract mixin class $ZPathCopyWith<$Res> {
  factory $ZPathCopyWith(ZPath value, $Res Function(ZPath) _then) = _$ZPathCopyWithImpl;
  @useResult
  $Res call({List<ZPathItem> path});
}

/// @nodoc
class _$ZPathCopyWithImpl<$Res> implements $ZPathCopyWith<$Res> {
  _$ZPathCopyWithImpl(this._self, this._then);

  final ZPath _self;
  final $Res Function(ZPath) _then;

  /// Create a copy of ZPath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_self.copyWith(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as List<ZPathItem>,
    ));
  }
}

/// @nodoc

class _Path extends ZPath {
  const _Path(final List<ZPathItem> path)
      : _path = path,
        super._();

  final List<ZPathItem> _path;
  @override
  List<ZPathItem> get path {
    if (_path is EqualUnmodifiableListView) return _path;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_path);
  }

  /// Create a copy of ZPath
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PathCopyWith<_Path> get copyWith => __$PathCopyWithImpl<_Path>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Path &&
            const DeepCollectionEquality().equals(other._path, _path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_path));

  @override
  String toString() {
    return 'ZPath(path: $path)';
  }
}

/// @nodoc
abstract mixin class _$PathCopyWith<$Res> implements $ZPathCopyWith<$Res> {
  factory _$PathCopyWith(_Path value, $Res Function(_Path) _then) = __$PathCopyWithImpl;
  @override
  @useResult
  $Res call({List<ZPathItem> path});
}

/// @nodoc
class __$PathCopyWithImpl<$Res> implements _$PathCopyWith<$Res> {
  __$PathCopyWithImpl(this._self, this._then);

  final _Path _self;
  final $Res Function(_Path) _then;

  /// Create a copy of ZPath
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = null,
  }) {
    return _then(_Path(
      null == path
          ? _self._path
          : path // ignore: cast_nullable_to_non_nullable
              as List<ZPathItem>,
    ));
  }
}

/// @nodoc
mixin _$ZPathItem {
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is ZPathItem);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ZPathItem()';
  }
}

/// @nodoc
class $ZPathItemCopyWith<$Res> {
  $ZPathItemCopyWith(ZPathItem _, $Res Function(ZPathItem) __);
}

/// @nodoc

class ZIndex implements ZPathItem {
  const ZIndex(this.index);

  final int index;

  /// Create a copy of ZPathItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ZIndexCopyWith<ZIndex> get copyWith => _$ZIndexCopyWithImpl<ZIndex>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZIndex &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @override
  String toString() {
    return 'ZPathItem.index(index: $index)';
  }
}

/// @nodoc
abstract mixin class $ZIndexCopyWith<$Res> implements $ZPathItemCopyWith<$Res> {
  factory $ZIndexCopyWith(ZIndex value, $Res Function(ZIndex) _then) = _$ZIndexCopyWithImpl;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$ZIndexCopyWithImpl<$Res> implements $ZIndexCopyWith<$Res> {
  _$ZIndexCopyWithImpl(this._self, this._then);

  final ZIndex _self;
  final $Res Function(ZIndex) _then;

  /// Create a copy of ZPathItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
  }) {
    return _then(ZIndex(
      null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ZProperty implements ZPathItem {
  const ZProperty(this.property);

  final String property;

  /// Create a copy of ZPathItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ZPropertyCopyWith<ZProperty> get copyWith => _$ZPropertyCopyWithImpl<ZProperty>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZProperty &&
            (identical(other.property, property) || other.property == property));
  }

  @override
  int get hashCode => Object.hash(runtimeType, property);

  @override
  String toString() {
    return 'ZPathItem.property(property: $property)';
  }
}

/// @nodoc
abstract mixin class $ZPropertyCopyWith<$Res> implements $ZPathItemCopyWith<$Res> {
  factory $ZPropertyCopyWith(ZProperty value, $Res Function(ZProperty) _then) = _$ZPropertyCopyWithImpl;
  @useResult
  $Res call({String property});
}

/// @nodoc
class _$ZPropertyCopyWithImpl<$Res> implements $ZPropertyCopyWith<$Res> {
  _$ZPropertyCopyWithImpl(this._self, this._then);

  final ZProperty _self;
  final $Res Function(ZProperty) _then;

  /// Create a copy of ZPathItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? property = null,
  }) {
    return _then(ZProperty(
      null == property
          ? _self.property
          : property // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
