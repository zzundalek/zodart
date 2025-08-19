// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZPath&&const DeepCollectionEquality().equals(other.path, path));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(path));

@override
String toString() {
  return 'ZPath(path: $path)';
}


}

/// @nodoc
abstract mixin class $ZPathCopyWith<$Res>  {
  factory $ZPathCopyWith(ZPath value, $Res Function(ZPath) _then) = _$ZPathCopyWithImpl;
@useResult
$Res call({
 List<ZPathItem> path
});




}
/// @nodoc
class _$ZPathCopyWithImpl<$Res>
    implements $ZPathCopyWith<$Res> {
  _$ZPathCopyWithImpl(this._self, this._then);

  final ZPath _self;
  final $Res Function(ZPath) _then;

/// Create a copy of ZPath
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as List<ZPathItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [ZPath].
extension ZPathPatterns on ZPath {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Path value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Path() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Path value)  $default,){
final _that = this;
switch (_that) {
case _Path():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Path value)?  $default,){
final _that = this;
switch (_that) {
case _Path() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ZPathItem> path)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Path() when $default != null:
return $default(_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ZPathItem> path)  $default,) {final _that = this;
switch (_that) {
case _Path():
return $default(_that.path);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ZPathItem> path)?  $default,) {final _that = this;
switch (_that) {
case _Path() when $default != null:
return $default(_that.path);case _:
  return null;

}
}

}

/// @nodoc


class _Path extends ZPath {
  const _Path(final  List<ZPathItem> path): _path = path,super._();
  

 final  List<ZPathItem> _path;
@override List<ZPathItem> get path {
  if (_path is EqualUnmodifiableListView) return _path;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_path);
}


/// Create a copy of ZPath
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PathCopyWith<_Path> get copyWith => __$PathCopyWithImpl<_Path>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Path&&const DeepCollectionEquality().equals(other._path, _path));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_path));

@override
String toString() {
  return 'ZPath(path: $path)';
}


}

/// @nodoc
abstract mixin class _$PathCopyWith<$Res> implements $ZPathCopyWith<$Res> {
  factory _$PathCopyWith(_Path value, $Res Function(_Path) _then) = __$PathCopyWithImpl;
@override @useResult
$Res call({
 List<ZPathItem> path
});




}
/// @nodoc
class __$PathCopyWithImpl<$Res>
    implements _$PathCopyWith<$Res> {
  __$PathCopyWithImpl(this._self, this._then);

  final _Path _self;
  final $Res Function(_Path) _then;

/// Create a copy of ZPath
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(_Path(
null == path ? _self._path : path // ignore: cast_nullable_to_non_nullable
as List<ZPathItem>,
  ));
}


}

/// @nodoc
mixin _$ZPathItem {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZPathItem);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ZPathItem()';
}


}

/// @nodoc
class $ZPathItemCopyWith<$Res>  {
$ZPathItemCopyWith(ZPathItem _, $Res Function(ZPathItem) __);
}


/// Adds pattern-matching-related methods to [ZPathItem].
extension ZPathItemPatterns on ZPathItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ZIndex value)?  index,TResult Function( ZProperty value)?  property,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ZIndex() when index != null:
return index(_that);case ZProperty() when property != null:
return property(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ZIndex value)  index,required TResult Function( ZProperty value)  property,}){
final _that = this;
switch (_that) {
case ZIndex():
return index(_that);case ZProperty():
return property(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ZIndex value)?  index,TResult? Function( ZProperty value)?  property,}){
final _that = this;
switch (_that) {
case ZIndex() when index != null:
return index(_that);case ZProperty() when property != null:
return property(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int index)?  index,TResult Function( String property)?  property,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ZIndex() when index != null:
return index(_that.index);case ZProperty() when property != null:
return property(_that.property);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int index)  index,required TResult Function( String property)  property,}) {final _that = this;
switch (_that) {
case ZIndex():
return index(_that.index);case ZProperty():
return property(_that.property);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int index)?  index,TResult? Function( String property)?  property,}) {final _that = this;
switch (_that) {
case ZIndex() when index != null:
return index(_that.index);case ZProperty() when property != null:
return property(_that.property);case _:
  return null;

}
}

}

/// @nodoc


class ZIndex implements ZPathItem {
  const ZIndex(this.index);
  

 final  int index;

/// Create a copy of ZPathItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZIndexCopyWith<ZIndex> get copyWith => _$ZIndexCopyWithImpl<ZIndex>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZIndex&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'ZPathItem.index(index: $index)';
}


}

/// @nodoc
abstract mixin class $ZIndexCopyWith<$Res> implements $ZPathItemCopyWith<$Res> {
  factory $ZIndexCopyWith(ZIndex value, $Res Function(ZIndex) _then) = _$ZIndexCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$ZIndexCopyWithImpl<$Res>
    implements $ZIndexCopyWith<$Res> {
  _$ZIndexCopyWithImpl(this._self, this._then);

  final ZIndex _self;
  final $Res Function(ZIndex) _then;

/// Create a copy of ZPathItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(ZIndex(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ZProperty implements ZPathItem {
  const ZProperty(this.property);
  

 final  String property;

/// Create a copy of ZPathItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZPropertyCopyWith<ZProperty> get copyWith => _$ZPropertyCopyWithImpl<ZProperty>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZProperty&&(identical(other.property, property) || other.property == property));
}


@override
int get hashCode => Object.hash(runtimeType,property);

@override
String toString() {
  return 'ZPathItem.property(property: $property)';
}


}

/// @nodoc
abstract mixin class $ZPropertyCopyWith<$Res> implements $ZPathItemCopyWith<$Res> {
  factory $ZPropertyCopyWith(ZProperty value, $Res Function(ZProperty) _then) = _$ZPropertyCopyWithImpl;
@useResult
$Res call({
 String property
});




}
/// @nodoc
class _$ZPropertyCopyWithImpl<$Res>
    implements $ZPropertyCopyWith<$Res> {
  _$ZPropertyCopyWithImpl(this._self, this._then);

  final ZProperty _self;
  final $Res Function(ZProperty) _then;

/// Create a copy of ZPathItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? property = null,}) {
  return _then(ZProperty(
null == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
