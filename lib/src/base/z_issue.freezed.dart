// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'z_issue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ZIssue {

 ZPath get rawPath;
/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZIssueCopyWith<ZIssue> get copyWith => _$ZIssueCopyWithImpl<ZIssue>(this as ZIssue, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZIssue&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath));
}


@override
int get hashCode => Object.hash(runtimeType,rawPath);

@override
String toString() {
  return 'ZIssue(rawPath: $rawPath)';
}


}

/// @nodoc
abstract mixin class $ZIssueCopyWith<$Res>  {
  factory $ZIssueCopyWith(ZIssue value, $Res Function(ZIssue) _then) = _$ZIssueCopyWithImpl;
@useResult
$Res call({
 ZPath rawPath
});


$ZPathCopyWith<$Res> get rawPath;

}
/// @nodoc
class _$ZIssueCopyWithImpl<$Res>
    implements $ZIssueCopyWith<$Res> {
  _$ZIssueCopyWithImpl(this._self, this._then);

  final ZIssue _self;
  final $Res Function(ZIssue) _then;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rawPath = null,}) {
  return _then(_self.copyWith(
rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as ZPath,
  ));
}
/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZPathCopyWith<$Res> get rawPath {
  
  return $ZPathCopyWith<$Res>(_self.rawPath, (value) {
    return _then(_self.copyWith(rawPath: value));
  });
}
}


/// Adds pattern-matching-related methods to [ZIssue].
extension ZIssuePatterns on ZIssue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ZIssueLengthNotMet value)?  lengthNotMet,TResult Function( ZIssueMinLengthNotMet value)?  minLengthNotMet,TResult Function( ZIssueMaxLengthExceeded value)?  maxLengthExceeded,TResult Function( ZIssueMinNotMet value)?  minNotMet,TResult Function( ZIssueMaxExceeded value)?  maxExceeded,TResult Function( ZIssueParseFail value)?  parseFail,TResult Function( ZIssueMissingValue value)?  missingValue,TResult Function( ZIssueMinDateTimeNotMet value)?  minDateNotMet,TResult Function( ZIssueMaxDateTimeExceeded value)?  maxDateExceeded,TResult Function( ZIssueCustom value)?  custom,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ZIssueLengthNotMet() when lengthNotMet != null:
return lengthNotMet(_that);case ZIssueMinLengthNotMet() when minLengthNotMet != null:
return minLengthNotMet(_that);case ZIssueMaxLengthExceeded() when maxLengthExceeded != null:
return maxLengthExceeded(_that);case ZIssueMinNotMet() when minNotMet != null:
return minNotMet(_that);case ZIssueMaxExceeded() when maxExceeded != null:
return maxExceeded(_that);case ZIssueParseFail() when parseFail != null:
return parseFail(_that);case ZIssueMissingValue() when missingValue != null:
return missingValue(_that);case ZIssueMinDateTimeNotMet() when minDateNotMet != null:
return minDateNotMet(_that);case ZIssueMaxDateTimeExceeded() when maxDateExceeded != null:
return maxDateExceeded(_that);case ZIssueCustom() when custom != null:
return custom(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ZIssueLengthNotMet value)  lengthNotMet,required TResult Function( ZIssueMinLengthNotMet value)  minLengthNotMet,required TResult Function( ZIssueMaxLengthExceeded value)  maxLengthExceeded,required TResult Function( ZIssueMinNotMet value)  minNotMet,required TResult Function( ZIssueMaxExceeded value)  maxExceeded,required TResult Function( ZIssueParseFail value)  parseFail,required TResult Function( ZIssueMissingValue value)  missingValue,required TResult Function( ZIssueMinDateTimeNotMet value)  minDateNotMet,required TResult Function( ZIssueMaxDateTimeExceeded value)  maxDateExceeded,required TResult Function( ZIssueCustom value)  custom,}){
final _that = this;
switch (_that) {
case ZIssueLengthNotMet():
return lengthNotMet(_that);case ZIssueMinLengthNotMet():
return minLengthNotMet(_that);case ZIssueMaxLengthExceeded():
return maxLengthExceeded(_that);case ZIssueMinNotMet():
return minNotMet(_that);case ZIssueMaxExceeded():
return maxExceeded(_that);case ZIssueParseFail():
return parseFail(_that);case ZIssueMissingValue():
return missingValue(_that);case ZIssueMinDateTimeNotMet():
return minDateNotMet(_that);case ZIssueMaxDateTimeExceeded():
return maxDateExceeded(_that);case ZIssueCustom():
return custom(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ZIssueLengthNotMet value)?  lengthNotMet,TResult? Function( ZIssueMinLengthNotMet value)?  minLengthNotMet,TResult? Function( ZIssueMaxLengthExceeded value)?  maxLengthExceeded,TResult? Function( ZIssueMinNotMet value)?  minNotMet,TResult? Function( ZIssueMaxExceeded value)?  maxExceeded,TResult? Function( ZIssueParseFail value)?  parseFail,TResult? Function( ZIssueMissingValue value)?  missingValue,TResult? Function( ZIssueMinDateTimeNotMet value)?  minDateNotMet,TResult? Function( ZIssueMaxDateTimeExceeded value)?  maxDateExceeded,TResult? Function( ZIssueCustom value)?  custom,}){
final _that = this;
switch (_that) {
case ZIssueLengthNotMet() when lengthNotMet != null:
return lengthNotMet(_that);case ZIssueMinLengthNotMet() when minLengthNotMet != null:
return minLengthNotMet(_that);case ZIssueMaxLengthExceeded() when maxLengthExceeded != null:
return maxLengthExceeded(_that);case ZIssueMinNotMet() when minNotMet != null:
return minNotMet(_that);case ZIssueMaxExceeded() when maxExceeded != null:
return maxExceeded(_that);case ZIssueParseFail() when parseFail != null:
return parseFail(_that);case ZIssueMissingValue() when missingValue != null:
return missingValue(_that);case ZIssueMinDateTimeNotMet() when minDateNotMet != null:
return minDateNotMet(_that);case ZIssueMaxDateTimeExceeded() when maxDateExceeded != null:
return maxDateExceeded(_that);case ZIssueCustom() when custom != null:
return custom(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int expectedLength,  int actualLength,  ZPath rawPath)?  lengthNotMet,TResult Function( int minLength,  int actualLength,  ZPath rawPath)?  minLengthNotMet,TResult Function( int maxLength,  int actualLength,  ZPath rawPath)?  maxLengthExceeded,TResult Function( num min,  num val,  ZPath rawPath)?  minNotMet,TResult Function( num max,  num val,  ZPath rawPath)?  maxExceeded,TResult Function( Type from,  Type to,  dynamic val,  Object? throwable,  ZPath rawPath)?  parseFail,TResult Function( ZPath rawPath,  Object? throwable)?  missingValue,TResult Function( DateTime min,  DateTime val,  ZPath rawPath)?  minDateNotMet,TResult Function( DateTime max,  DateTime val,  ZPath rawPath)?  maxDateExceeded,TResult Function( String? code,  String? message,  Object? throwable,  ZPath rawPath)?  custom,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ZIssueLengthNotMet() when lengthNotMet != null:
return lengthNotMet(_that.expectedLength,_that.actualLength,_that.rawPath);case ZIssueMinLengthNotMet() when minLengthNotMet != null:
return minLengthNotMet(_that.minLength,_that.actualLength,_that.rawPath);case ZIssueMaxLengthExceeded() when maxLengthExceeded != null:
return maxLengthExceeded(_that.maxLength,_that.actualLength,_that.rawPath);case ZIssueMinNotMet() when minNotMet != null:
return minNotMet(_that.min,_that.val,_that.rawPath);case ZIssueMaxExceeded() when maxExceeded != null:
return maxExceeded(_that.max,_that.val,_that.rawPath);case ZIssueParseFail() when parseFail != null:
return parseFail(_that.from,_that.to,_that.val,_that.throwable,_that.rawPath);case ZIssueMissingValue() when missingValue != null:
return missingValue(_that.rawPath,_that.throwable);case ZIssueMinDateTimeNotMet() when minDateNotMet != null:
return minDateNotMet(_that.min,_that.val,_that.rawPath);case ZIssueMaxDateTimeExceeded() when maxDateExceeded != null:
return maxDateExceeded(_that.max,_that.val,_that.rawPath);case ZIssueCustom() when custom != null:
return custom(_that.code,_that.message,_that.throwable,_that.rawPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int expectedLength,  int actualLength,  ZPath rawPath)  lengthNotMet,required TResult Function( int minLength,  int actualLength,  ZPath rawPath)  minLengthNotMet,required TResult Function( int maxLength,  int actualLength,  ZPath rawPath)  maxLengthExceeded,required TResult Function( num min,  num val,  ZPath rawPath)  minNotMet,required TResult Function( num max,  num val,  ZPath rawPath)  maxExceeded,required TResult Function( Type from,  Type to,  dynamic val,  Object? throwable,  ZPath rawPath)  parseFail,required TResult Function( ZPath rawPath,  Object? throwable)  missingValue,required TResult Function( DateTime min,  DateTime val,  ZPath rawPath)  minDateNotMet,required TResult Function( DateTime max,  DateTime val,  ZPath rawPath)  maxDateExceeded,required TResult Function( String? code,  String? message,  Object? throwable,  ZPath rawPath)  custom,}) {final _that = this;
switch (_that) {
case ZIssueLengthNotMet():
return lengthNotMet(_that.expectedLength,_that.actualLength,_that.rawPath);case ZIssueMinLengthNotMet():
return minLengthNotMet(_that.minLength,_that.actualLength,_that.rawPath);case ZIssueMaxLengthExceeded():
return maxLengthExceeded(_that.maxLength,_that.actualLength,_that.rawPath);case ZIssueMinNotMet():
return minNotMet(_that.min,_that.val,_that.rawPath);case ZIssueMaxExceeded():
return maxExceeded(_that.max,_that.val,_that.rawPath);case ZIssueParseFail():
return parseFail(_that.from,_that.to,_that.val,_that.throwable,_that.rawPath);case ZIssueMissingValue():
return missingValue(_that.rawPath,_that.throwable);case ZIssueMinDateTimeNotMet():
return minDateNotMet(_that.min,_that.val,_that.rawPath);case ZIssueMaxDateTimeExceeded():
return maxDateExceeded(_that.max,_that.val,_that.rawPath);case ZIssueCustom():
return custom(_that.code,_that.message,_that.throwable,_that.rawPath);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int expectedLength,  int actualLength,  ZPath rawPath)?  lengthNotMet,TResult? Function( int minLength,  int actualLength,  ZPath rawPath)?  minLengthNotMet,TResult? Function( int maxLength,  int actualLength,  ZPath rawPath)?  maxLengthExceeded,TResult? Function( num min,  num val,  ZPath rawPath)?  minNotMet,TResult? Function( num max,  num val,  ZPath rawPath)?  maxExceeded,TResult? Function( Type from,  Type to,  dynamic val,  Object? throwable,  ZPath rawPath)?  parseFail,TResult? Function( ZPath rawPath,  Object? throwable)?  missingValue,TResult? Function( DateTime min,  DateTime val,  ZPath rawPath)?  minDateNotMet,TResult? Function( DateTime max,  DateTime val,  ZPath rawPath)?  maxDateExceeded,TResult? Function( String? code,  String? message,  Object? throwable,  ZPath rawPath)?  custom,}) {final _that = this;
switch (_that) {
case ZIssueLengthNotMet() when lengthNotMet != null:
return lengthNotMet(_that.expectedLength,_that.actualLength,_that.rawPath);case ZIssueMinLengthNotMet() when minLengthNotMet != null:
return minLengthNotMet(_that.minLength,_that.actualLength,_that.rawPath);case ZIssueMaxLengthExceeded() when maxLengthExceeded != null:
return maxLengthExceeded(_that.maxLength,_that.actualLength,_that.rawPath);case ZIssueMinNotMet() when minNotMet != null:
return minNotMet(_that.min,_that.val,_that.rawPath);case ZIssueMaxExceeded() when maxExceeded != null:
return maxExceeded(_that.max,_that.val,_that.rawPath);case ZIssueParseFail() when parseFail != null:
return parseFail(_that.from,_that.to,_that.val,_that.throwable,_that.rawPath);case ZIssueMissingValue() when missingValue != null:
return missingValue(_that.rawPath,_that.throwable);case ZIssueMinDateTimeNotMet() when minDateNotMet != null:
return minDateNotMet(_that.min,_that.val,_that.rawPath);case ZIssueMaxDateTimeExceeded() when maxDateExceeded != null:
return maxDateExceeded(_that.max,_that.val,_that.rawPath);case ZIssueCustom() when custom != null:
return custom(_that.code,_that.message,_that.throwable,_that.rawPath);case _:
  return null;

}
}

}

/// @nodoc


class ZIssueLengthNotMet extends ZIssue {
  const ZIssueLengthNotMet({required this.expectedLength, required this.actualLength, this.rawPath = const ZPath([])}): super._();
  

 final  int expectedLength;
 final  int actualLength;
@override@JsonKey() final  ZPath rawPath;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZIssueLengthNotMetCopyWith<ZIssueLengthNotMet> get copyWith => _$ZIssueLengthNotMetCopyWithImpl<ZIssueLengthNotMet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZIssueLengthNotMet&&(identical(other.expectedLength, expectedLength) || other.expectedLength == expectedLength)&&(identical(other.actualLength, actualLength) || other.actualLength == actualLength)&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath));
}


@override
int get hashCode => Object.hash(runtimeType,expectedLength,actualLength,rawPath);

@override
String toString() {
  return 'ZIssue.lengthNotMet(expectedLength: $expectedLength, actualLength: $actualLength, rawPath: $rawPath)';
}


}

/// @nodoc
abstract mixin class $ZIssueLengthNotMetCopyWith<$Res> implements $ZIssueCopyWith<$Res> {
  factory $ZIssueLengthNotMetCopyWith(ZIssueLengthNotMet value, $Res Function(ZIssueLengthNotMet) _then) = _$ZIssueLengthNotMetCopyWithImpl;
@override @useResult
$Res call({
 int expectedLength, int actualLength, ZPath rawPath
});


@override $ZPathCopyWith<$Res> get rawPath;

}
/// @nodoc
class _$ZIssueLengthNotMetCopyWithImpl<$Res>
    implements $ZIssueLengthNotMetCopyWith<$Res> {
  _$ZIssueLengthNotMetCopyWithImpl(this._self, this._then);

  final ZIssueLengthNotMet _self;
  final $Res Function(ZIssueLengthNotMet) _then;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expectedLength = null,Object? actualLength = null,Object? rawPath = null,}) {
  return _then(ZIssueLengthNotMet(
expectedLength: null == expectedLength ? _self.expectedLength : expectedLength // ignore: cast_nullable_to_non_nullable
as int,actualLength: null == actualLength ? _self.actualLength : actualLength // ignore: cast_nullable_to_non_nullable
as int,rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as ZPath,
  ));
}

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZPathCopyWith<$Res> get rawPath {
  
  return $ZPathCopyWith<$Res>(_self.rawPath, (value) {
    return _then(_self.copyWith(rawPath: value));
  });
}
}

/// @nodoc


class ZIssueMinLengthNotMet extends ZIssue {
  const ZIssueMinLengthNotMet({required this.minLength, required this.actualLength, this.rawPath = const ZPath([])}): super._();
  

 final  int minLength;
 final  int actualLength;
@override@JsonKey() final  ZPath rawPath;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZIssueMinLengthNotMetCopyWith<ZIssueMinLengthNotMet> get copyWith => _$ZIssueMinLengthNotMetCopyWithImpl<ZIssueMinLengthNotMet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZIssueMinLengthNotMet&&(identical(other.minLength, minLength) || other.minLength == minLength)&&(identical(other.actualLength, actualLength) || other.actualLength == actualLength)&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath));
}


@override
int get hashCode => Object.hash(runtimeType,minLength,actualLength,rawPath);

@override
String toString() {
  return 'ZIssue.minLengthNotMet(minLength: $minLength, actualLength: $actualLength, rawPath: $rawPath)';
}


}

/// @nodoc
abstract mixin class $ZIssueMinLengthNotMetCopyWith<$Res> implements $ZIssueCopyWith<$Res> {
  factory $ZIssueMinLengthNotMetCopyWith(ZIssueMinLengthNotMet value, $Res Function(ZIssueMinLengthNotMet) _then) = _$ZIssueMinLengthNotMetCopyWithImpl;
@override @useResult
$Res call({
 int minLength, int actualLength, ZPath rawPath
});


@override $ZPathCopyWith<$Res> get rawPath;

}
/// @nodoc
class _$ZIssueMinLengthNotMetCopyWithImpl<$Res>
    implements $ZIssueMinLengthNotMetCopyWith<$Res> {
  _$ZIssueMinLengthNotMetCopyWithImpl(this._self, this._then);

  final ZIssueMinLengthNotMet _self;
  final $Res Function(ZIssueMinLengthNotMet) _then;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minLength = null,Object? actualLength = null,Object? rawPath = null,}) {
  return _then(ZIssueMinLengthNotMet(
minLength: null == minLength ? _self.minLength : minLength // ignore: cast_nullable_to_non_nullable
as int,actualLength: null == actualLength ? _self.actualLength : actualLength // ignore: cast_nullable_to_non_nullable
as int,rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as ZPath,
  ));
}

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZPathCopyWith<$Res> get rawPath {
  
  return $ZPathCopyWith<$Res>(_self.rawPath, (value) {
    return _then(_self.copyWith(rawPath: value));
  });
}
}

/// @nodoc


class ZIssueMaxLengthExceeded extends ZIssue {
  const ZIssueMaxLengthExceeded({required this.maxLength, required this.actualLength, this.rawPath = const ZPath([])}): super._();
  

 final  int maxLength;
 final  int actualLength;
@override@JsonKey() final  ZPath rawPath;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZIssueMaxLengthExceededCopyWith<ZIssueMaxLengthExceeded> get copyWith => _$ZIssueMaxLengthExceededCopyWithImpl<ZIssueMaxLengthExceeded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZIssueMaxLengthExceeded&&(identical(other.maxLength, maxLength) || other.maxLength == maxLength)&&(identical(other.actualLength, actualLength) || other.actualLength == actualLength)&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath));
}


@override
int get hashCode => Object.hash(runtimeType,maxLength,actualLength,rawPath);

@override
String toString() {
  return 'ZIssue.maxLengthExceeded(maxLength: $maxLength, actualLength: $actualLength, rawPath: $rawPath)';
}


}

/// @nodoc
abstract mixin class $ZIssueMaxLengthExceededCopyWith<$Res> implements $ZIssueCopyWith<$Res> {
  factory $ZIssueMaxLengthExceededCopyWith(ZIssueMaxLengthExceeded value, $Res Function(ZIssueMaxLengthExceeded) _then) = _$ZIssueMaxLengthExceededCopyWithImpl;
@override @useResult
$Res call({
 int maxLength, int actualLength, ZPath rawPath
});


@override $ZPathCopyWith<$Res> get rawPath;

}
/// @nodoc
class _$ZIssueMaxLengthExceededCopyWithImpl<$Res>
    implements $ZIssueMaxLengthExceededCopyWith<$Res> {
  _$ZIssueMaxLengthExceededCopyWithImpl(this._self, this._then);

  final ZIssueMaxLengthExceeded _self;
  final $Res Function(ZIssueMaxLengthExceeded) _then;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxLength = null,Object? actualLength = null,Object? rawPath = null,}) {
  return _then(ZIssueMaxLengthExceeded(
maxLength: null == maxLength ? _self.maxLength : maxLength // ignore: cast_nullable_to_non_nullable
as int,actualLength: null == actualLength ? _self.actualLength : actualLength // ignore: cast_nullable_to_non_nullable
as int,rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as ZPath,
  ));
}

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZPathCopyWith<$Res> get rawPath {
  
  return $ZPathCopyWith<$Res>(_self.rawPath, (value) {
    return _then(_self.copyWith(rawPath: value));
  });
}
}

/// @nodoc


class ZIssueMinNotMet extends ZIssue {
  const ZIssueMinNotMet({required this.min, required this.val, this.rawPath = const ZPath([])}): super._();
  

 final  num min;
 final  num val;
@override@JsonKey() final  ZPath rawPath;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZIssueMinNotMetCopyWith<ZIssueMinNotMet> get copyWith => _$ZIssueMinNotMetCopyWithImpl<ZIssueMinNotMet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZIssueMinNotMet&&(identical(other.min, min) || other.min == min)&&(identical(other.val, val) || other.val == val)&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath));
}


@override
int get hashCode => Object.hash(runtimeType,min,val,rawPath);

@override
String toString() {
  return 'ZIssue.minNotMet(min: $min, val: $val, rawPath: $rawPath)';
}


}

/// @nodoc
abstract mixin class $ZIssueMinNotMetCopyWith<$Res> implements $ZIssueCopyWith<$Res> {
  factory $ZIssueMinNotMetCopyWith(ZIssueMinNotMet value, $Res Function(ZIssueMinNotMet) _then) = _$ZIssueMinNotMetCopyWithImpl;
@override @useResult
$Res call({
 num min, num val, ZPath rawPath
});


@override $ZPathCopyWith<$Res> get rawPath;

}
/// @nodoc
class _$ZIssueMinNotMetCopyWithImpl<$Res>
    implements $ZIssueMinNotMetCopyWith<$Res> {
  _$ZIssueMinNotMetCopyWithImpl(this._self, this._then);

  final ZIssueMinNotMet _self;
  final $Res Function(ZIssueMinNotMet) _then;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = null,Object? val = null,Object? rawPath = null,}) {
  return _then(ZIssueMinNotMet(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as num,val: null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as num,rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as ZPath,
  ));
}

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZPathCopyWith<$Res> get rawPath {
  
  return $ZPathCopyWith<$Res>(_self.rawPath, (value) {
    return _then(_self.copyWith(rawPath: value));
  });
}
}

/// @nodoc


class ZIssueMaxExceeded extends ZIssue {
  const ZIssueMaxExceeded({required this.max, required this.val, this.rawPath = const ZPath([])}): super._();
  

 final  num max;
 final  num val;
@override@JsonKey() final  ZPath rawPath;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZIssueMaxExceededCopyWith<ZIssueMaxExceeded> get copyWith => _$ZIssueMaxExceededCopyWithImpl<ZIssueMaxExceeded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZIssueMaxExceeded&&(identical(other.max, max) || other.max == max)&&(identical(other.val, val) || other.val == val)&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath));
}


@override
int get hashCode => Object.hash(runtimeType,max,val,rawPath);

@override
String toString() {
  return 'ZIssue.maxExceeded(max: $max, val: $val, rawPath: $rawPath)';
}


}

/// @nodoc
abstract mixin class $ZIssueMaxExceededCopyWith<$Res> implements $ZIssueCopyWith<$Res> {
  factory $ZIssueMaxExceededCopyWith(ZIssueMaxExceeded value, $Res Function(ZIssueMaxExceeded) _then) = _$ZIssueMaxExceededCopyWithImpl;
@override @useResult
$Res call({
 num max, num val, ZPath rawPath
});


@override $ZPathCopyWith<$Res> get rawPath;

}
/// @nodoc
class _$ZIssueMaxExceededCopyWithImpl<$Res>
    implements $ZIssueMaxExceededCopyWith<$Res> {
  _$ZIssueMaxExceededCopyWithImpl(this._self, this._then);

  final ZIssueMaxExceeded _self;
  final $Res Function(ZIssueMaxExceeded) _then;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? max = null,Object? val = null,Object? rawPath = null,}) {
  return _then(ZIssueMaxExceeded(
max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as num,val: null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as num,rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as ZPath,
  ));
}

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZPathCopyWith<$Res> get rawPath {
  
  return $ZPathCopyWith<$Res>(_self.rawPath, (value) {
    return _then(_self.copyWith(rawPath: value));
  });
}
}

/// @nodoc


class ZIssueParseFail extends ZIssue {
  const ZIssueParseFail({required this.from, required this.to, required this.val, this.throwable, this.rawPath = const ZPath([])}): super._();
  

 final  Type from;
 final  Type to;
 final  dynamic val;
 final  Object? throwable;
@override@JsonKey() final  ZPath rawPath;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZIssueParseFailCopyWith<ZIssueParseFail> get copyWith => _$ZIssueParseFailCopyWithImpl<ZIssueParseFail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZIssueParseFail&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&const DeepCollectionEquality().equals(other.val, val)&&const DeepCollectionEquality().equals(other.throwable, throwable)&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath));
}


@override
int get hashCode => Object.hash(runtimeType,from,to,const DeepCollectionEquality().hash(val),const DeepCollectionEquality().hash(throwable),rawPath);

@override
String toString() {
  return 'ZIssue.parseFail(from: $from, to: $to, val: $val, throwable: $throwable, rawPath: $rawPath)';
}


}

/// @nodoc
abstract mixin class $ZIssueParseFailCopyWith<$Res> implements $ZIssueCopyWith<$Res> {
  factory $ZIssueParseFailCopyWith(ZIssueParseFail value, $Res Function(ZIssueParseFail) _then) = _$ZIssueParseFailCopyWithImpl;
@override @useResult
$Res call({
 Type from, Type to, dynamic val, Object? throwable, ZPath rawPath
});


@override $ZPathCopyWith<$Res> get rawPath;

}
/// @nodoc
class _$ZIssueParseFailCopyWithImpl<$Res>
    implements $ZIssueParseFailCopyWith<$Res> {
  _$ZIssueParseFailCopyWithImpl(this._self, this._then);

  final ZIssueParseFail _self;
  final $Res Function(ZIssueParseFail) _then;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? val = freezed,Object? throwable = freezed,Object? rawPath = null,}) {
  return _then(ZIssueParseFail(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as Type,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as Type,val: freezed == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as dynamic,throwable: freezed == throwable ? _self.throwable : throwable ,rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as ZPath,
  ));
}

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZPathCopyWith<$Res> get rawPath {
  
  return $ZPathCopyWith<$Res>(_self.rawPath, (value) {
    return _then(_self.copyWith(rawPath: value));
  });
}
}

/// @nodoc


class ZIssueMissingValue extends ZIssue {
  const ZIssueMissingValue({required this.rawPath, this.throwable}): super._();
  

@override final  ZPath rawPath;
 final  Object? throwable;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZIssueMissingValueCopyWith<ZIssueMissingValue> get copyWith => _$ZIssueMissingValueCopyWithImpl<ZIssueMissingValue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZIssueMissingValue&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath)&&const DeepCollectionEquality().equals(other.throwable, throwable));
}


@override
int get hashCode => Object.hash(runtimeType,rawPath,const DeepCollectionEquality().hash(throwable));

@override
String toString() {
  return 'ZIssue.missingValue(rawPath: $rawPath, throwable: $throwable)';
}


}

/// @nodoc
abstract mixin class $ZIssueMissingValueCopyWith<$Res> implements $ZIssueCopyWith<$Res> {
  factory $ZIssueMissingValueCopyWith(ZIssueMissingValue value, $Res Function(ZIssueMissingValue) _then) = _$ZIssueMissingValueCopyWithImpl;
@override @useResult
$Res call({
 ZPath rawPath, Object? throwable
});


@override $ZPathCopyWith<$Res> get rawPath;

}
/// @nodoc
class _$ZIssueMissingValueCopyWithImpl<$Res>
    implements $ZIssueMissingValueCopyWith<$Res> {
  _$ZIssueMissingValueCopyWithImpl(this._self, this._then);

  final ZIssueMissingValue _self;
  final $Res Function(ZIssueMissingValue) _then;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rawPath = null,Object? throwable = freezed,}) {
  return _then(ZIssueMissingValue(
rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as ZPath,throwable: freezed == throwable ? _self.throwable : throwable ,
  ));
}

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZPathCopyWith<$Res> get rawPath {
  
  return $ZPathCopyWith<$Res>(_self.rawPath, (value) {
    return _then(_self.copyWith(rawPath: value));
  });
}
}

/// @nodoc


class ZIssueMinDateTimeNotMet extends ZIssue {
  const ZIssueMinDateTimeNotMet({required this.min, required this.val, this.rawPath = const ZPath([])}): super._();
  

 final  DateTime min;
 final  DateTime val;
@override@JsonKey() final  ZPath rawPath;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZIssueMinDateTimeNotMetCopyWith<ZIssueMinDateTimeNotMet> get copyWith => _$ZIssueMinDateTimeNotMetCopyWithImpl<ZIssueMinDateTimeNotMet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZIssueMinDateTimeNotMet&&(identical(other.min, min) || other.min == min)&&(identical(other.val, val) || other.val == val)&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath));
}


@override
int get hashCode => Object.hash(runtimeType,min,val,rawPath);

@override
String toString() {
  return 'ZIssue.minDateNotMet(min: $min, val: $val, rawPath: $rawPath)';
}


}

/// @nodoc
abstract mixin class $ZIssueMinDateTimeNotMetCopyWith<$Res> implements $ZIssueCopyWith<$Res> {
  factory $ZIssueMinDateTimeNotMetCopyWith(ZIssueMinDateTimeNotMet value, $Res Function(ZIssueMinDateTimeNotMet) _then) = _$ZIssueMinDateTimeNotMetCopyWithImpl;
@override @useResult
$Res call({
 DateTime min, DateTime val, ZPath rawPath
});


@override $ZPathCopyWith<$Res> get rawPath;

}
/// @nodoc
class _$ZIssueMinDateTimeNotMetCopyWithImpl<$Res>
    implements $ZIssueMinDateTimeNotMetCopyWith<$Res> {
  _$ZIssueMinDateTimeNotMetCopyWithImpl(this._self, this._then);

  final ZIssueMinDateTimeNotMet _self;
  final $Res Function(ZIssueMinDateTimeNotMet) _then;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = null,Object? val = null,Object? rawPath = null,}) {
  return _then(ZIssueMinDateTimeNotMet(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as DateTime,val: null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as DateTime,rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as ZPath,
  ));
}

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZPathCopyWith<$Res> get rawPath {
  
  return $ZPathCopyWith<$Res>(_self.rawPath, (value) {
    return _then(_self.copyWith(rawPath: value));
  });
}
}

/// @nodoc


class ZIssueMaxDateTimeExceeded extends ZIssue {
  const ZIssueMaxDateTimeExceeded({required this.max, required this.val, this.rawPath = const ZPath([])}): super._();
  

 final  DateTime max;
 final  DateTime val;
@override@JsonKey() final  ZPath rawPath;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZIssueMaxDateTimeExceededCopyWith<ZIssueMaxDateTimeExceeded> get copyWith => _$ZIssueMaxDateTimeExceededCopyWithImpl<ZIssueMaxDateTimeExceeded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZIssueMaxDateTimeExceeded&&(identical(other.max, max) || other.max == max)&&(identical(other.val, val) || other.val == val)&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath));
}


@override
int get hashCode => Object.hash(runtimeType,max,val,rawPath);

@override
String toString() {
  return 'ZIssue.maxDateExceeded(max: $max, val: $val, rawPath: $rawPath)';
}


}

/// @nodoc
abstract mixin class $ZIssueMaxDateTimeExceededCopyWith<$Res> implements $ZIssueCopyWith<$Res> {
  factory $ZIssueMaxDateTimeExceededCopyWith(ZIssueMaxDateTimeExceeded value, $Res Function(ZIssueMaxDateTimeExceeded) _then) = _$ZIssueMaxDateTimeExceededCopyWithImpl;
@override @useResult
$Res call({
 DateTime max, DateTime val, ZPath rawPath
});


@override $ZPathCopyWith<$Res> get rawPath;

}
/// @nodoc
class _$ZIssueMaxDateTimeExceededCopyWithImpl<$Res>
    implements $ZIssueMaxDateTimeExceededCopyWith<$Res> {
  _$ZIssueMaxDateTimeExceededCopyWithImpl(this._self, this._then);

  final ZIssueMaxDateTimeExceeded _self;
  final $Res Function(ZIssueMaxDateTimeExceeded) _then;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? max = null,Object? val = null,Object? rawPath = null,}) {
  return _then(ZIssueMaxDateTimeExceeded(
max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as DateTime,val: null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as DateTime,rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as ZPath,
  ));
}

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZPathCopyWith<$Res> get rawPath {
  
  return $ZPathCopyWith<$Res>(_self.rawPath, (value) {
    return _then(_self.copyWith(rawPath: value));
  });
}
}

/// @nodoc


class ZIssueCustom extends ZIssue {
  const ZIssueCustom({this.code, this.message, this.throwable, this.rawPath = const ZPath([])}): super._();
  

 final  String? code;
 final  String? message;
 final  Object? throwable;
@override@JsonKey() final  ZPath rawPath;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZIssueCustomCopyWith<ZIssueCustom> get copyWith => _$ZIssueCustomCopyWithImpl<ZIssueCustom>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZIssueCustom&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.throwable, throwable)&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath));
}


@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(throwable),rawPath);

@override
String toString() {
  return 'ZIssue.custom(code: $code, message: $message, throwable: $throwable, rawPath: $rawPath)';
}


}

/// @nodoc
abstract mixin class $ZIssueCustomCopyWith<$Res> implements $ZIssueCopyWith<$Res> {
  factory $ZIssueCustomCopyWith(ZIssueCustom value, $Res Function(ZIssueCustom) _then) = _$ZIssueCustomCopyWithImpl;
@override @useResult
$Res call({
 String? code, String? message, Object? throwable, ZPath rawPath
});


@override $ZPathCopyWith<$Res> get rawPath;

}
/// @nodoc
class _$ZIssueCustomCopyWithImpl<$Res>
    implements $ZIssueCustomCopyWith<$Res> {
  _$ZIssueCustomCopyWithImpl(this._self, this._then);

  final ZIssueCustom _self;
  final $Res Function(ZIssueCustom) _then;

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? message = freezed,Object? throwable = freezed,Object? rawPath = null,}) {
  return _then(ZIssueCustom(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,throwable: freezed == throwable ? _self.throwable : throwable ,rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as ZPath,
  ));
}

/// Create a copy of ZIssue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZPathCopyWith<$Res> get rawPath {
  
  return $ZPathCopyWith<$Res>(_self.rawPath, (value) {
    return _then(_self.copyWith(rawPath: value));
  });
}
}

// dart format on
