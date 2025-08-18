// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

// dart format on
