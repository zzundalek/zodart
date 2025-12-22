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

 List<DartObject> get crossFieldValidators;
/// Create a copy of ZodArtAnnotation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZodArtAnnotationCopyWith<ZodArtAnnotation> get copyWith => _$ZodArtAnnotationCopyWithImpl<ZodArtAnnotation>(this as ZodArtAnnotation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZodArtAnnotation&&const DeepCollectionEquality().equals(other.crossFieldValidators, crossFieldValidators));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(crossFieldValidators));

@override
String toString() {
  return 'ZodArtAnnotation(crossFieldValidators: $crossFieldValidators)';
}


}

/// @nodoc
abstract mixin class $ZodArtAnnotationCopyWith<$Res>  {
  factory $ZodArtAnnotationCopyWith(ZodArtAnnotation value, $Res Function(ZodArtAnnotation) _then) = _$ZodArtAnnotationCopyWithImpl;
@useResult
$Res call({
 List<DartObject> crossFieldValidators
});




}
/// @nodoc
class _$ZodArtAnnotationCopyWithImpl<$Res>
    implements $ZodArtAnnotationCopyWith<$Res> {
  _$ZodArtAnnotationCopyWithImpl(this._self, this._then);

  final ZodArtAnnotation _self;
  final $Res Function(ZodArtAnnotation) _then;

/// Create a copy of ZodArtAnnotation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? crossFieldValidators = null,}) {
  return _then(_self.copyWith(
crossFieldValidators: null == crossFieldValidators ? _self.crossFieldValidators : crossFieldValidators // ignore: cast_nullable_to_non_nullable
as List<DartObject>,
  ));
}

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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String outputClassName,  List<DartObject> crossFieldValidators)?  generateNewClass,TResult Function( DartType outputClassType,  List<DartObject> crossFieldValidators)?  useExistingClass,TResult Function( DartType outputRecordType,  List<DartObject> crossFieldValidators)?  useRecord,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ZodArtGenerateNewClass() when generateNewClass != null:
return generateNewClass(_that.outputClassName,_that.crossFieldValidators);case ZodArtUseExistingClass() when useExistingClass != null:
return useExistingClass(_that.outputClassType,_that.crossFieldValidators);case ZodArtUseRecord() when useRecord != null:
return useRecord(_that.outputRecordType,_that.crossFieldValidators);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String outputClassName,  List<DartObject> crossFieldValidators)  generateNewClass,required TResult Function( DartType outputClassType,  List<DartObject> crossFieldValidators)  useExistingClass,required TResult Function( DartType outputRecordType,  List<DartObject> crossFieldValidators)  useRecord,}) {final _that = this;
switch (_that) {
case ZodArtGenerateNewClass():
return generateNewClass(_that.outputClassName,_that.crossFieldValidators);case ZodArtUseExistingClass():
return useExistingClass(_that.outputClassType,_that.crossFieldValidators);case ZodArtUseRecord():
return useRecord(_that.outputRecordType,_that.crossFieldValidators);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String outputClassName,  List<DartObject> crossFieldValidators)?  generateNewClass,TResult? Function( DartType outputClassType,  List<DartObject> crossFieldValidators)?  useExistingClass,TResult? Function( DartType outputRecordType,  List<DartObject> crossFieldValidators)?  useRecord,}) {final _that = this;
switch (_that) {
case ZodArtGenerateNewClass() when generateNewClass != null:
return generateNewClass(_that.outputClassName,_that.crossFieldValidators);case ZodArtUseExistingClass() when useExistingClass != null:
return useExistingClass(_that.outputClassType,_that.crossFieldValidators);case ZodArtUseRecord() when useRecord != null:
return useRecord(_that.outputRecordType,_that.crossFieldValidators);case _:
  return null;

}
}

}

/// @nodoc


class ZodArtGenerateNewClass extends ZodArtAnnotation {
  const ZodArtGenerateNewClass({required this.outputClassName, required final  List<DartObject> crossFieldValidators}): _crossFieldValidators = crossFieldValidators,super._();
  

 final  String outputClassName;
 final  List<DartObject> _crossFieldValidators;
@override List<DartObject> get crossFieldValidators {
  if (_crossFieldValidators is EqualUnmodifiableListView) return _crossFieldValidators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_crossFieldValidators);
}


/// Create a copy of ZodArtAnnotation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZodArtGenerateNewClassCopyWith<ZodArtGenerateNewClass> get copyWith => _$ZodArtGenerateNewClassCopyWithImpl<ZodArtGenerateNewClass>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZodArtGenerateNewClass&&(identical(other.outputClassName, outputClassName) || other.outputClassName == outputClassName)&&const DeepCollectionEquality().equals(other._crossFieldValidators, _crossFieldValidators));
}


@override
int get hashCode => Object.hash(runtimeType,outputClassName,const DeepCollectionEquality().hash(_crossFieldValidators));

@override
String toString() {
  return 'ZodArtAnnotation.generateNewClass(outputClassName: $outputClassName, crossFieldValidators: $crossFieldValidators)';
}


}

/// @nodoc
abstract mixin class $ZodArtGenerateNewClassCopyWith<$Res> implements $ZodArtAnnotationCopyWith<$Res> {
  factory $ZodArtGenerateNewClassCopyWith(ZodArtGenerateNewClass value, $Res Function(ZodArtGenerateNewClass) _then) = _$ZodArtGenerateNewClassCopyWithImpl;
@override @useResult
$Res call({
 String outputClassName, List<DartObject> crossFieldValidators
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
@override @pragma('vm:prefer-inline') $Res call({Object? outputClassName = null,Object? crossFieldValidators = null,}) {
  return _then(ZodArtGenerateNewClass(
outputClassName: null == outputClassName ? _self.outputClassName : outputClassName // ignore: cast_nullable_to_non_nullable
as String,crossFieldValidators: null == crossFieldValidators ? _self._crossFieldValidators : crossFieldValidators // ignore: cast_nullable_to_non_nullable
as List<DartObject>,
  ));
}


}

/// @nodoc


class ZodArtUseExistingClass extends ZodArtAnnotation {
  const ZodArtUseExistingClass({required this.outputClassType, required final  List<DartObject> crossFieldValidators}): _crossFieldValidators = crossFieldValidators,super._();
  

 final  DartType outputClassType;
 final  List<DartObject> _crossFieldValidators;
@override List<DartObject> get crossFieldValidators {
  if (_crossFieldValidators is EqualUnmodifiableListView) return _crossFieldValidators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_crossFieldValidators);
}


/// Create a copy of ZodArtAnnotation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZodArtUseExistingClassCopyWith<ZodArtUseExistingClass> get copyWith => _$ZodArtUseExistingClassCopyWithImpl<ZodArtUseExistingClass>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZodArtUseExistingClass&&(identical(other.outputClassType, outputClassType) || other.outputClassType == outputClassType)&&const DeepCollectionEquality().equals(other._crossFieldValidators, _crossFieldValidators));
}


@override
int get hashCode => Object.hash(runtimeType,outputClassType,const DeepCollectionEquality().hash(_crossFieldValidators));

@override
String toString() {
  return 'ZodArtAnnotation.useExistingClass(outputClassType: $outputClassType, crossFieldValidators: $crossFieldValidators)';
}


}

/// @nodoc
abstract mixin class $ZodArtUseExistingClassCopyWith<$Res> implements $ZodArtAnnotationCopyWith<$Res> {
  factory $ZodArtUseExistingClassCopyWith(ZodArtUseExistingClass value, $Res Function(ZodArtUseExistingClass) _then) = _$ZodArtUseExistingClassCopyWithImpl;
@override @useResult
$Res call({
 DartType outputClassType, List<DartObject> crossFieldValidators
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
@override @pragma('vm:prefer-inline') $Res call({Object? outputClassType = null,Object? crossFieldValidators = null,}) {
  return _then(ZodArtUseExistingClass(
outputClassType: null == outputClassType ? _self.outputClassType : outputClassType // ignore: cast_nullable_to_non_nullable
as DartType,crossFieldValidators: null == crossFieldValidators ? _self._crossFieldValidators : crossFieldValidators // ignore: cast_nullable_to_non_nullable
as List<DartObject>,
  ));
}


}

/// @nodoc


class ZodArtUseRecord extends ZodArtAnnotation {
  const ZodArtUseRecord({required this.outputRecordType, required final  List<DartObject> crossFieldValidators}): _crossFieldValidators = crossFieldValidators,super._();
  

 final  DartType outputRecordType;
 final  List<DartObject> _crossFieldValidators;
@override List<DartObject> get crossFieldValidators {
  if (_crossFieldValidators is EqualUnmodifiableListView) return _crossFieldValidators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_crossFieldValidators);
}


/// Create a copy of ZodArtAnnotation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZodArtUseRecordCopyWith<ZodArtUseRecord> get copyWith => _$ZodArtUseRecordCopyWithImpl<ZodArtUseRecord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZodArtUseRecord&&(identical(other.outputRecordType, outputRecordType) || other.outputRecordType == outputRecordType)&&const DeepCollectionEquality().equals(other._crossFieldValidators, _crossFieldValidators));
}


@override
int get hashCode => Object.hash(runtimeType,outputRecordType,const DeepCollectionEquality().hash(_crossFieldValidators));

@override
String toString() {
  return 'ZodArtAnnotation.useRecord(outputRecordType: $outputRecordType, crossFieldValidators: $crossFieldValidators)';
}


}

/// @nodoc
abstract mixin class $ZodArtUseRecordCopyWith<$Res> implements $ZodArtAnnotationCopyWith<$Res> {
  factory $ZodArtUseRecordCopyWith(ZodArtUseRecord value, $Res Function(ZodArtUseRecord) _then) = _$ZodArtUseRecordCopyWithImpl;
@override @useResult
$Res call({
 DartType outputRecordType, List<DartObject> crossFieldValidators
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
@override @pragma('vm:prefer-inline') $Res call({Object? outputRecordType = null,Object? crossFieldValidators = null,}) {
  return _then(ZodArtUseRecord(
outputRecordType: null == outputRecordType ? _self.outputRecordType : outputRecordType // ignore: cast_nullable_to_non_nullable
as DartType,crossFieldValidators: null == crossFieldValidators ? _self._crossFieldValidators : crossFieldValidators // ignore: cast_nullable_to_non_nullable
as List<DartObject>,
  ));
}


}

// dart format on
