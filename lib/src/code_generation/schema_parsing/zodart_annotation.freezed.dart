// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zodart_annotation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ZodArtAnnotation {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZodArtAnnotation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ZodArtAnnotation()';
}


}

/// @nodoc
class $ZodArtAnnotationCopyWith<$Res>  {
$ZodArtAnnotationCopyWith(ZodArtAnnotation _, $Res Function(ZodArtAnnotation) __);
}


/// Adds pattern-matching-related methods to [ZodArtAnnotation].
extension ZodArtAnnotationPatterns on ZodArtAnnotation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ZodArtGenerateNewClass value)?  generateNewClass,TResult Function( ZodArtUseExistingClass value)?  useExistingClass,TResult Function( ZodArtUseRecord value)?  useRecord,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ZodArtGenerateNewClass() when generateNewClass != null:
return generateNewClass(_that);case ZodArtUseExistingClass() when useExistingClass != null:
return useExistingClass(_that);case ZodArtUseRecord() when useRecord != null:
return useRecord(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ZodArtGenerateNewClass value)  generateNewClass,required TResult Function( ZodArtUseExistingClass value)  useExistingClass,required TResult Function( ZodArtUseRecord value)  useRecord,}){
final _that = this;
switch (_that) {
case ZodArtGenerateNewClass():
return generateNewClass(_that);case ZodArtUseExistingClass():
return useExistingClass(_that);case ZodArtUseRecord():
return useRecord(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ZodArtGenerateNewClass value)?  generateNewClass,TResult? Function( ZodArtUseExistingClass value)?  useExistingClass,TResult? Function( ZodArtUseRecord value)?  useRecord,}){
final _that = this;
switch (_that) {
case ZodArtGenerateNewClass() when generateNewClass != null:
return generateNewClass(_that);case ZodArtUseExistingClass() when useExistingClass != null:
return useExistingClass(_that);case ZodArtUseRecord() when useRecord != null:
return useRecord(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String outputClassName)?  generateNewClass,TResult Function( DartType outputClassType)?  useExistingClass,TResult Function( DartType outputRecordType)?  useRecord,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ZodArtGenerateNewClass() when generateNewClass != null:
return generateNewClass(_that.outputClassName);case ZodArtUseExistingClass() when useExistingClass != null:
return useExistingClass(_that.outputClassType);case ZodArtUseRecord() when useRecord != null:
return useRecord(_that.outputRecordType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String outputClassName)  generateNewClass,required TResult Function( DartType outputClassType)  useExistingClass,required TResult Function( DartType outputRecordType)  useRecord,}) {final _that = this;
switch (_that) {
case ZodArtGenerateNewClass():
return generateNewClass(_that.outputClassName);case ZodArtUseExistingClass():
return useExistingClass(_that.outputClassType);case ZodArtUseRecord():
return useRecord(_that.outputRecordType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String outputClassName)?  generateNewClass,TResult? Function( DartType outputClassType)?  useExistingClass,TResult? Function( DartType outputRecordType)?  useRecord,}) {final _that = this;
switch (_that) {
case ZodArtGenerateNewClass() when generateNewClass != null:
return generateNewClass(_that.outputClassName);case ZodArtUseExistingClass() when useExistingClass != null:
return useExistingClass(_that.outputClassType);case ZodArtUseRecord() when useRecord != null:
return useRecord(_that.outputRecordType);case _:
  return null;

}
}

}

/// @nodoc


class ZodArtGenerateNewClass extends ZodArtAnnotation {
  const ZodArtGenerateNewClass({required this.outputClassName}): super._();
  

 final  String outputClassName;

/// Create a copy of ZodArtAnnotation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZodArtGenerateNewClassCopyWith<ZodArtGenerateNewClass> get copyWith => _$ZodArtGenerateNewClassCopyWithImpl<ZodArtGenerateNewClass>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZodArtGenerateNewClass&&(identical(other.outputClassName, outputClassName) || other.outputClassName == outputClassName));
}


@override
int get hashCode => Object.hash(runtimeType,outputClassName);

@override
String toString() {
  return 'ZodArtAnnotation.generateNewClass(outputClassName: $outputClassName)';
}


}

/// @nodoc
abstract mixin class $ZodArtGenerateNewClassCopyWith<$Res> implements $ZodArtAnnotationCopyWith<$Res> {
  factory $ZodArtGenerateNewClassCopyWith(ZodArtGenerateNewClass value, $Res Function(ZodArtGenerateNewClass) _then) = _$ZodArtGenerateNewClassCopyWithImpl;
@useResult
$Res call({
 String outputClassName
});




}
/// @nodoc
class _$ZodArtGenerateNewClassCopyWithImpl<$Res>
    implements $ZodArtGenerateNewClassCopyWith<$Res> {
  _$ZodArtGenerateNewClassCopyWithImpl(this._self, this._then);

  final ZodArtGenerateNewClass _self;
  final $Res Function(ZodArtGenerateNewClass) _then;

/// Create a copy of ZodArtAnnotation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? outputClassName = null,}) {
  return _then(ZodArtGenerateNewClass(
outputClassName: null == outputClassName ? _self.outputClassName : outputClassName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ZodArtUseExistingClass extends ZodArtAnnotation {
  const ZodArtUseExistingClass({required this.outputClassType}): super._();
  

 final  DartType outputClassType;

/// Create a copy of ZodArtAnnotation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZodArtUseExistingClassCopyWith<ZodArtUseExistingClass> get copyWith => _$ZodArtUseExistingClassCopyWithImpl<ZodArtUseExistingClass>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZodArtUseExistingClass&&(identical(other.outputClassType, outputClassType) || other.outputClassType == outputClassType));
}


@override
int get hashCode => Object.hash(runtimeType,outputClassType);

@override
String toString() {
  return 'ZodArtAnnotation.useExistingClass(outputClassType: $outputClassType)';
}


}

/// @nodoc
abstract mixin class $ZodArtUseExistingClassCopyWith<$Res> implements $ZodArtAnnotationCopyWith<$Res> {
  factory $ZodArtUseExistingClassCopyWith(ZodArtUseExistingClass value, $Res Function(ZodArtUseExistingClass) _then) = _$ZodArtUseExistingClassCopyWithImpl;
@useResult
$Res call({
 DartType outputClassType
});




}
/// @nodoc
class _$ZodArtUseExistingClassCopyWithImpl<$Res>
    implements $ZodArtUseExistingClassCopyWith<$Res> {
  _$ZodArtUseExistingClassCopyWithImpl(this._self, this._then);

  final ZodArtUseExistingClass _self;
  final $Res Function(ZodArtUseExistingClass) _then;

/// Create a copy of ZodArtAnnotation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? outputClassType = null,}) {
  return _then(ZodArtUseExistingClass(
outputClassType: null == outputClassType ? _self.outputClassType : outputClassType // ignore: cast_nullable_to_non_nullable
as DartType,
  ));
}


}

/// @nodoc


class ZodArtUseRecord extends ZodArtAnnotation {
  const ZodArtUseRecord({required this.outputRecordType}): super._();
  

 final  DartType outputRecordType;

/// Create a copy of ZodArtAnnotation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZodArtUseRecordCopyWith<ZodArtUseRecord> get copyWith => _$ZodArtUseRecordCopyWithImpl<ZodArtUseRecord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZodArtUseRecord&&(identical(other.outputRecordType, outputRecordType) || other.outputRecordType == outputRecordType));
}


@override
int get hashCode => Object.hash(runtimeType,outputRecordType);

@override
String toString() {
  return 'ZodArtAnnotation.useRecord(outputRecordType: $outputRecordType)';
}


}

/// @nodoc
abstract mixin class $ZodArtUseRecordCopyWith<$Res> implements $ZodArtAnnotationCopyWith<$Res> {
  factory $ZodArtUseRecordCopyWith(ZodArtUseRecord value, $Res Function(ZodArtUseRecord) _then) = _$ZodArtUseRecordCopyWithImpl;
@useResult
$Res call({
 DartType outputRecordType
});




}
/// @nodoc
class _$ZodArtUseRecordCopyWithImpl<$Res>
    implements $ZodArtUseRecordCopyWith<$Res> {
  _$ZodArtUseRecordCopyWithImpl(this._self, this._then);

  final ZodArtUseRecord _self;
  final $Res Function(ZodArtUseRecord) _then;

/// Create a copy of ZodArtAnnotation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? outputRecordType = null,}) {
  return _then(ZodArtUseRecord(
outputRecordType: null == outputRecordType ? _self.outputRecordType : outputRecordType // ignore: cast_nullable_to_non_nullable
as DartType,
  ));
}


}

// dart format on
