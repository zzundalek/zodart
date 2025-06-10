// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'z_issue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ZIssue {
  ZPath get rawPath => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int expectedLength, int actualLength, ZPath rawPath)
        lengthNotMet,
    required TResult Function(int minLength, int actualLength, ZPath rawPath)
        minLengthNotMet,
    required TResult Function(int maxLength, int actualLength, ZPath rawPath)
        maxLengthExceeded,
    required TResult Function(num min, num val, ZPath rawPath) minNotMet,
    required TResult Function(num max, num val, ZPath rawPath) maxExceeded,
    required TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)
        parseFail,
    required TResult Function(ZPath rawPath, Object? throwable) missingValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult? Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult? Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult? Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult? Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult? Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult? Function(ZPath rawPath, Object? throwable)? missingValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult Function(ZPath rawPath, Object? throwable)? missingValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZIssueLengthNotMet value) lengthNotMet,
    required TResult Function(ZIssueMinLengthNotMet value) minLengthNotMet,
    required TResult Function(ZIssueMaxLengthExceeded value) maxLengthExceeded,
    required TResult Function(ZIssueMinNotMet value) minNotMet,
    required TResult Function(ZIssueMaxExceeded value) maxExceeded,
    required TResult Function(ZIssueParseFail value) parseFail,
    required TResult Function(ZIssueMissingValue value) missingValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult? Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult? Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult? Function(ZIssueMinNotMet value)? minNotMet,
    TResult? Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult? Function(ZIssueParseFail value)? parseFail,
    TResult? Function(ZIssueMissingValue value)? missingValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult Function(ZIssueMinNotMet value)? minNotMet,
    TResult Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult Function(ZIssueParseFail value)? parseFail,
    TResult Function(ZIssueMissingValue value)? missingValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ZIssueCopyWith<ZIssue> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZIssueCopyWith<$Res> {
  factory $ZIssueCopyWith(ZIssue value, $Res Function(ZIssue) then) =
      _$ZIssueCopyWithImpl<$Res, ZIssue>;
  @useResult
  $Res call({ZPath rawPath});

  $ZPathCopyWith<$Res> get rawPath;
}

/// @nodoc
class _$ZIssueCopyWithImpl<$Res, $Val extends ZIssue>
    implements $ZIssueCopyWith<$Res> {
  _$ZIssueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawPath = null,
  }) {
    return _then(_value.copyWith(
      rawPath: null == rawPath
          ? _value.rawPath
          : rawPath // ignore: cast_nullable_to_non_nullable
              as ZPath,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ZPathCopyWith<$Res> get rawPath {
    return $ZPathCopyWith<$Res>(_value.rawPath, (value) {
      return _then(_value.copyWith(rawPath: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ZIssueLengthNotMetImplCopyWith<$Res>
    implements $ZIssueCopyWith<$Res> {
  factory _$$ZIssueLengthNotMetImplCopyWith(_$ZIssueLengthNotMetImpl value,
          $Res Function(_$ZIssueLengthNotMetImpl) then) =
      __$$ZIssueLengthNotMetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int expectedLength, int actualLength, ZPath rawPath});

  @override
  $ZPathCopyWith<$Res> get rawPath;
}

/// @nodoc
class __$$ZIssueLengthNotMetImplCopyWithImpl<$Res>
    extends _$ZIssueCopyWithImpl<$Res, _$ZIssueLengthNotMetImpl>
    implements _$$ZIssueLengthNotMetImplCopyWith<$Res> {
  __$$ZIssueLengthNotMetImplCopyWithImpl(_$ZIssueLengthNotMetImpl _value,
      $Res Function(_$ZIssueLengthNotMetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expectedLength = null,
    Object? actualLength = null,
    Object? rawPath = null,
  }) {
    return _then(_$ZIssueLengthNotMetImpl(
      expectedLength: null == expectedLength
          ? _value.expectedLength
          : expectedLength // ignore: cast_nullable_to_non_nullable
              as int,
      actualLength: null == actualLength
          ? _value.actualLength
          : actualLength // ignore: cast_nullable_to_non_nullable
              as int,
      rawPath: null == rawPath
          ? _value.rawPath
          : rawPath // ignore: cast_nullable_to_non_nullable
              as ZPath,
    ));
  }
}

/// @nodoc

class _$ZIssueLengthNotMetImpl extends ZIssueLengthNotMet {
  const _$ZIssueLengthNotMetImpl(
      {required this.expectedLength,
      required this.actualLength,
      this.rawPath = const ZPath([])})
      : super._();

  @override
  final int expectedLength;
  @override
  final int actualLength;
  @override
  @JsonKey()
  final ZPath rawPath;

  @override
  String toString() {
    return 'ZIssue.lengthNotMet(expectedLength: $expectedLength, actualLength: $actualLength, rawPath: $rawPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZIssueLengthNotMetImpl &&
            (identical(other.expectedLength, expectedLength) ||
                other.expectedLength == expectedLength) &&
            (identical(other.actualLength, actualLength) ||
                other.actualLength == actualLength) &&
            (identical(other.rawPath, rawPath) || other.rawPath == rawPath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, expectedLength, actualLength, rawPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZIssueLengthNotMetImplCopyWith<_$ZIssueLengthNotMetImpl> get copyWith =>
      __$$ZIssueLengthNotMetImplCopyWithImpl<_$ZIssueLengthNotMetImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int expectedLength, int actualLength, ZPath rawPath)
        lengthNotMet,
    required TResult Function(int minLength, int actualLength, ZPath rawPath)
        minLengthNotMet,
    required TResult Function(int maxLength, int actualLength, ZPath rawPath)
        maxLengthExceeded,
    required TResult Function(num min, num val, ZPath rawPath) minNotMet,
    required TResult Function(num max, num val, ZPath rawPath) maxExceeded,
    required TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)
        parseFail,
    required TResult Function(ZPath rawPath, Object? throwable) missingValue,
  }) {
    return lengthNotMet(expectedLength, actualLength, rawPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult? Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult? Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult? Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult? Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult? Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult? Function(ZPath rawPath, Object? throwable)? missingValue,
  }) {
    return lengthNotMet?.call(expectedLength, actualLength, rawPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult Function(ZPath rawPath, Object? throwable)? missingValue,
    required TResult orElse(),
  }) {
    if (lengthNotMet != null) {
      return lengthNotMet(expectedLength, actualLength, rawPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZIssueLengthNotMet value) lengthNotMet,
    required TResult Function(ZIssueMinLengthNotMet value) minLengthNotMet,
    required TResult Function(ZIssueMaxLengthExceeded value) maxLengthExceeded,
    required TResult Function(ZIssueMinNotMet value) minNotMet,
    required TResult Function(ZIssueMaxExceeded value) maxExceeded,
    required TResult Function(ZIssueParseFail value) parseFail,
    required TResult Function(ZIssueMissingValue value) missingValue,
  }) {
    return lengthNotMet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult? Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult? Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult? Function(ZIssueMinNotMet value)? minNotMet,
    TResult? Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult? Function(ZIssueParseFail value)? parseFail,
    TResult? Function(ZIssueMissingValue value)? missingValue,
  }) {
    return lengthNotMet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult Function(ZIssueMinNotMet value)? minNotMet,
    TResult Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult Function(ZIssueParseFail value)? parseFail,
    TResult Function(ZIssueMissingValue value)? missingValue,
    required TResult orElse(),
  }) {
    if (lengthNotMet != null) {
      return lengthNotMet(this);
    }
    return orElse();
  }
}

abstract class ZIssueLengthNotMet extends ZIssue {
  const factory ZIssueLengthNotMet(
      {required final int expectedLength,
      required final int actualLength,
      final ZPath rawPath}) = _$ZIssueLengthNotMetImpl;
  const ZIssueLengthNotMet._() : super._();

  int get expectedLength;
  int get actualLength;
  @override
  ZPath get rawPath;
  @override
  @JsonKey(ignore: true)
  _$$ZIssueLengthNotMetImplCopyWith<_$ZIssueLengthNotMetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZIssueMinLengthNotMetImplCopyWith<$Res>
    implements $ZIssueCopyWith<$Res> {
  factory _$$ZIssueMinLengthNotMetImplCopyWith(
          _$ZIssueMinLengthNotMetImpl value,
          $Res Function(_$ZIssueMinLengthNotMetImpl) then) =
      __$$ZIssueMinLengthNotMetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int minLength, int actualLength, ZPath rawPath});

  @override
  $ZPathCopyWith<$Res> get rawPath;
}

/// @nodoc
class __$$ZIssueMinLengthNotMetImplCopyWithImpl<$Res>
    extends _$ZIssueCopyWithImpl<$Res, _$ZIssueMinLengthNotMetImpl>
    implements _$$ZIssueMinLengthNotMetImplCopyWith<$Res> {
  __$$ZIssueMinLengthNotMetImplCopyWithImpl(_$ZIssueMinLengthNotMetImpl _value,
      $Res Function(_$ZIssueMinLengthNotMetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minLength = null,
    Object? actualLength = null,
    Object? rawPath = null,
  }) {
    return _then(_$ZIssueMinLengthNotMetImpl(
      minLength: null == minLength
          ? _value.minLength
          : minLength // ignore: cast_nullable_to_non_nullable
              as int,
      actualLength: null == actualLength
          ? _value.actualLength
          : actualLength // ignore: cast_nullable_to_non_nullable
              as int,
      rawPath: null == rawPath
          ? _value.rawPath
          : rawPath // ignore: cast_nullable_to_non_nullable
              as ZPath,
    ));
  }
}

/// @nodoc

class _$ZIssueMinLengthNotMetImpl extends ZIssueMinLengthNotMet {
  const _$ZIssueMinLengthNotMetImpl(
      {required this.minLength,
      required this.actualLength,
      this.rawPath = const ZPath([])})
      : super._();

  @override
  final int minLength;
  @override
  final int actualLength;
  @override
  @JsonKey()
  final ZPath rawPath;

  @override
  String toString() {
    return 'ZIssue.minLengthNotMet(minLength: $minLength, actualLength: $actualLength, rawPath: $rawPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZIssueMinLengthNotMetImpl &&
            (identical(other.minLength, minLength) ||
                other.minLength == minLength) &&
            (identical(other.actualLength, actualLength) ||
                other.actualLength == actualLength) &&
            (identical(other.rawPath, rawPath) || other.rawPath == rawPath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, minLength, actualLength, rawPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZIssueMinLengthNotMetImplCopyWith<_$ZIssueMinLengthNotMetImpl>
      get copyWith => __$$ZIssueMinLengthNotMetImplCopyWithImpl<
          _$ZIssueMinLengthNotMetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int expectedLength, int actualLength, ZPath rawPath)
        lengthNotMet,
    required TResult Function(int minLength, int actualLength, ZPath rawPath)
        minLengthNotMet,
    required TResult Function(int maxLength, int actualLength, ZPath rawPath)
        maxLengthExceeded,
    required TResult Function(num min, num val, ZPath rawPath) minNotMet,
    required TResult Function(num max, num val, ZPath rawPath) maxExceeded,
    required TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)
        parseFail,
    required TResult Function(ZPath rawPath, Object? throwable) missingValue,
  }) {
    return minLengthNotMet(minLength, actualLength, rawPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult? Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult? Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult? Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult? Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult? Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult? Function(ZPath rawPath, Object? throwable)? missingValue,
  }) {
    return minLengthNotMet?.call(minLength, actualLength, rawPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult Function(ZPath rawPath, Object? throwable)? missingValue,
    required TResult orElse(),
  }) {
    if (minLengthNotMet != null) {
      return minLengthNotMet(minLength, actualLength, rawPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZIssueLengthNotMet value) lengthNotMet,
    required TResult Function(ZIssueMinLengthNotMet value) minLengthNotMet,
    required TResult Function(ZIssueMaxLengthExceeded value) maxLengthExceeded,
    required TResult Function(ZIssueMinNotMet value) minNotMet,
    required TResult Function(ZIssueMaxExceeded value) maxExceeded,
    required TResult Function(ZIssueParseFail value) parseFail,
    required TResult Function(ZIssueMissingValue value) missingValue,
  }) {
    return minLengthNotMet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult? Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult? Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult? Function(ZIssueMinNotMet value)? minNotMet,
    TResult? Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult? Function(ZIssueParseFail value)? parseFail,
    TResult? Function(ZIssueMissingValue value)? missingValue,
  }) {
    return minLengthNotMet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult Function(ZIssueMinNotMet value)? minNotMet,
    TResult Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult Function(ZIssueParseFail value)? parseFail,
    TResult Function(ZIssueMissingValue value)? missingValue,
    required TResult orElse(),
  }) {
    if (minLengthNotMet != null) {
      return minLengthNotMet(this);
    }
    return orElse();
  }
}

abstract class ZIssueMinLengthNotMet extends ZIssue {
  const factory ZIssueMinLengthNotMet(
      {required final int minLength,
      required final int actualLength,
      final ZPath rawPath}) = _$ZIssueMinLengthNotMetImpl;
  const ZIssueMinLengthNotMet._() : super._();

  int get minLength;
  int get actualLength;
  @override
  ZPath get rawPath;
  @override
  @JsonKey(ignore: true)
  _$$ZIssueMinLengthNotMetImplCopyWith<_$ZIssueMinLengthNotMetImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZIssueMaxLengthExceededImplCopyWith<$Res>
    implements $ZIssueCopyWith<$Res> {
  factory _$$ZIssueMaxLengthExceededImplCopyWith(
          _$ZIssueMaxLengthExceededImpl value,
          $Res Function(_$ZIssueMaxLengthExceededImpl) then) =
      __$$ZIssueMaxLengthExceededImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int maxLength, int actualLength, ZPath rawPath});

  @override
  $ZPathCopyWith<$Res> get rawPath;
}

/// @nodoc
class __$$ZIssueMaxLengthExceededImplCopyWithImpl<$Res>
    extends _$ZIssueCopyWithImpl<$Res, _$ZIssueMaxLengthExceededImpl>
    implements _$$ZIssueMaxLengthExceededImplCopyWith<$Res> {
  __$$ZIssueMaxLengthExceededImplCopyWithImpl(
      _$ZIssueMaxLengthExceededImpl _value,
      $Res Function(_$ZIssueMaxLengthExceededImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxLength = null,
    Object? actualLength = null,
    Object? rawPath = null,
  }) {
    return _then(_$ZIssueMaxLengthExceededImpl(
      maxLength: null == maxLength
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int,
      actualLength: null == actualLength
          ? _value.actualLength
          : actualLength // ignore: cast_nullable_to_non_nullable
              as int,
      rawPath: null == rawPath
          ? _value.rawPath
          : rawPath // ignore: cast_nullable_to_non_nullable
              as ZPath,
    ));
  }
}

/// @nodoc

class _$ZIssueMaxLengthExceededImpl extends ZIssueMaxLengthExceeded {
  const _$ZIssueMaxLengthExceededImpl(
      {required this.maxLength,
      required this.actualLength,
      this.rawPath = const ZPath([])})
      : super._();

  @override
  final int maxLength;
  @override
  final int actualLength;
  @override
  @JsonKey()
  final ZPath rawPath;

  @override
  String toString() {
    return 'ZIssue.maxLengthExceeded(maxLength: $maxLength, actualLength: $actualLength, rawPath: $rawPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZIssueMaxLengthExceededImpl &&
            (identical(other.maxLength, maxLength) ||
                other.maxLength == maxLength) &&
            (identical(other.actualLength, actualLength) ||
                other.actualLength == actualLength) &&
            (identical(other.rawPath, rawPath) || other.rawPath == rawPath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, maxLength, actualLength, rawPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZIssueMaxLengthExceededImplCopyWith<_$ZIssueMaxLengthExceededImpl>
      get copyWith => __$$ZIssueMaxLengthExceededImplCopyWithImpl<
          _$ZIssueMaxLengthExceededImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int expectedLength, int actualLength, ZPath rawPath)
        lengthNotMet,
    required TResult Function(int minLength, int actualLength, ZPath rawPath)
        minLengthNotMet,
    required TResult Function(int maxLength, int actualLength, ZPath rawPath)
        maxLengthExceeded,
    required TResult Function(num min, num val, ZPath rawPath) minNotMet,
    required TResult Function(num max, num val, ZPath rawPath) maxExceeded,
    required TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)
        parseFail,
    required TResult Function(ZPath rawPath, Object? throwable) missingValue,
  }) {
    return maxLengthExceeded(maxLength, actualLength, rawPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult? Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult? Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult? Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult? Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult? Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult? Function(ZPath rawPath, Object? throwable)? missingValue,
  }) {
    return maxLengthExceeded?.call(maxLength, actualLength, rawPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult Function(ZPath rawPath, Object? throwable)? missingValue,
    required TResult orElse(),
  }) {
    if (maxLengthExceeded != null) {
      return maxLengthExceeded(maxLength, actualLength, rawPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZIssueLengthNotMet value) lengthNotMet,
    required TResult Function(ZIssueMinLengthNotMet value) minLengthNotMet,
    required TResult Function(ZIssueMaxLengthExceeded value) maxLengthExceeded,
    required TResult Function(ZIssueMinNotMet value) minNotMet,
    required TResult Function(ZIssueMaxExceeded value) maxExceeded,
    required TResult Function(ZIssueParseFail value) parseFail,
    required TResult Function(ZIssueMissingValue value) missingValue,
  }) {
    return maxLengthExceeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult? Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult? Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult? Function(ZIssueMinNotMet value)? minNotMet,
    TResult? Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult? Function(ZIssueParseFail value)? parseFail,
    TResult? Function(ZIssueMissingValue value)? missingValue,
  }) {
    return maxLengthExceeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult Function(ZIssueMinNotMet value)? minNotMet,
    TResult Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult Function(ZIssueParseFail value)? parseFail,
    TResult Function(ZIssueMissingValue value)? missingValue,
    required TResult orElse(),
  }) {
    if (maxLengthExceeded != null) {
      return maxLengthExceeded(this);
    }
    return orElse();
  }
}

abstract class ZIssueMaxLengthExceeded extends ZIssue {
  const factory ZIssueMaxLengthExceeded(
      {required final int maxLength,
      required final int actualLength,
      final ZPath rawPath}) = _$ZIssueMaxLengthExceededImpl;
  const ZIssueMaxLengthExceeded._() : super._();

  int get maxLength;
  int get actualLength;
  @override
  ZPath get rawPath;
  @override
  @JsonKey(ignore: true)
  _$$ZIssueMaxLengthExceededImplCopyWith<_$ZIssueMaxLengthExceededImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZIssueMinNotMetImplCopyWith<$Res>
    implements $ZIssueCopyWith<$Res> {
  factory _$$ZIssueMinNotMetImplCopyWith(_$ZIssueMinNotMetImpl value,
          $Res Function(_$ZIssueMinNotMetImpl) then) =
      __$$ZIssueMinNotMetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num min, num val, ZPath rawPath});

  @override
  $ZPathCopyWith<$Res> get rawPath;
}

/// @nodoc
class __$$ZIssueMinNotMetImplCopyWithImpl<$Res>
    extends _$ZIssueCopyWithImpl<$Res, _$ZIssueMinNotMetImpl>
    implements _$$ZIssueMinNotMetImplCopyWith<$Res> {
  __$$ZIssueMinNotMetImplCopyWithImpl(
      _$ZIssueMinNotMetImpl _value, $Res Function(_$ZIssueMinNotMetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? val = null,
    Object? rawPath = null,
  }) {
    return _then(_$ZIssueMinNotMetImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as num,
      val: null == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as num,
      rawPath: null == rawPath
          ? _value.rawPath
          : rawPath // ignore: cast_nullable_to_non_nullable
              as ZPath,
    ));
  }
}

/// @nodoc

class _$ZIssueMinNotMetImpl extends ZIssueMinNotMet {
  const _$ZIssueMinNotMetImpl(
      {required this.min, required this.val, this.rawPath = const ZPath([])})
      : super._();

  @override
  final num min;
  @override
  final num val;
  @override
  @JsonKey()
  final ZPath rawPath;

  @override
  String toString() {
    return 'ZIssue.minNotMet(min: $min, val: $val, rawPath: $rawPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZIssueMinNotMetImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.val, val) || other.val == val) &&
            (identical(other.rawPath, rawPath) || other.rawPath == rawPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, min, val, rawPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZIssueMinNotMetImplCopyWith<_$ZIssueMinNotMetImpl> get copyWith =>
      __$$ZIssueMinNotMetImplCopyWithImpl<_$ZIssueMinNotMetImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int expectedLength, int actualLength, ZPath rawPath)
        lengthNotMet,
    required TResult Function(int minLength, int actualLength, ZPath rawPath)
        minLengthNotMet,
    required TResult Function(int maxLength, int actualLength, ZPath rawPath)
        maxLengthExceeded,
    required TResult Function(num min, num val, ZPath rawPath) minNotMet,
    required TResult Function(num max, num val, ZPath rawPath) maxExceeded,
    required TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)
        parseFail,
    required TResult Function(ZPath rawPath, Object? throwable) missingValue,
  }) {
    return minNotMet(min, val, rawPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult? Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult? Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult? Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult? Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult? Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult? Function(ZPath rawPath, Object? throwable)? missingValue,
  }) {
    return minNotMet?.call(min, val, rawPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult Function(ZPath rawPath, Object? throwable)? missingValue,
    required TResult orElse(),
  }) {
    if (minNotMet != null) {
      return minNotMet(min, val, rawPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZIssueLengthNotMet value) lengthNotMet,
    required TResult Function(ZIssueMinLengthNotMet value) minLengthNotMet,
    required TResult Function(ZIssueMaxLengthExceeded value) maxLengthExceeded,
    required TResult Function(ZIssueMinNotMet value) minNotMet,
    required TResult Function(ZIssueMaxExceeded value) maxExceeded,
    required TResult Function(ZIssueParseFail value) parseFail,
    required TResult Function(ZIssueMissingValue value) missingValue,
  }) {
    return minNotMet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult? Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult? Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult? Function(ZIssueMinNotMet value)? minNotMet,
    TResult? Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult? Function(ZIssueParseFail value)? parseFail,
    TResult? Function(ZIssueMissingValue value)? missingValue,
  }) {
    return minNotMet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult Function(ZIssueMinNotMet value)? minNotMet,
    TResult Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult Function(ZIssueParseFail value)? parseFail,
    TResult Function(ZIssueMissingValue value)? missingValue,
    required TResult orElse(),
  }) {
    if (minNotMet != null) {
      return minNotMet(this);
    }
    return orElse();
  }
}

abstract class ZIssueMinNotMet extends ZIssue {
  const factory ZIssueMinNotMet(
      {required final num min,
      required final num val,
      final ZPath rawPath}) = _$ZIssueMinNotMetImpl;
  const ZIssueMinNotMet._() : super._();

  num get min;
  num get val;
  @override
  ZPath get rawPath;
  @override
  @JsonKey(ignore: true)
  _$$ZIssueMinNotMetImplCopyWith<_$ZIssueMinNotMetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZIssueMaxExceededImplCopyWith<$Res>
    implements $ZIssueCopyWith<$Res> {
  factory _$$ZIssueMaxExceededImplCopyWith(_$ZIssueMaxExceededImpl value,
          $Res Function(_$ZIssueMaxExceededImpl) then) =
      __$$ZIssueMaxExceededImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num max, num val, ZPath rawPath});

  @override
  $ZPathCopyWith<$Res> get rawPath;
}

/// @nodoc
class __$$ZIssueMaxExceededImplCopyWithImpl<$Res>
    extends _$ZIssueCopyWithImpl<$Res, _$ZIssueMaxExceededImpl>
    implements _$$ZIssueMaxExceededImplCopyWith<$Res> {
  __$$ZIssueMaxExceededImplCopyWithImpl(_$ZIssueMaxExceededImpl _value,
      $Res Function(_$ZIssueMaxExceededImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? max = null,
    Object? val = null,
    Object? rawPath = null,
  }) {
    return _then(_$ZIssueMaxExceededImpl(
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as num,
      val: null == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as num,
      rawPath: null == rawPath
          ? _value.rawPath
          : rawPath // ignore: cast_nullable_to_non_nullable
              as ZPath,
    ));
  }
}

/// @nodoc

class _$ZIssueMaxExceededImpl extends ZIssueMaxExceeded {
  const _$ZIssueMaxExceededImpl(
      {required this.max, required this.val, this.rawPath = const ZPath([])})
      : super._();

  @override
  final num max;
  @override
  final num val;
  @override
  @JsonKey()
  final ZPath rawPath;

  @override
  String toString() {
    return 'ZIssue.maxExceeded(max: $max, val: $val, rawPath: $rawPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZIssueMaxExceededImpl &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.val, val) || other.val == val) &&
            (identical(other.rawPath, rawPath) || other.rawPath == rawPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, max, val, rawPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZIssueMaxExceededImplCopyWith<_$ZIssueMaxExceededImpl> get copyWith =>
      __$$ZIssueMaxExceededImplCopyWithImpl<_$ZIssueMaxExceededImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int expectedLength, int actualLength, ZPath rawPath)
        lengthNotMet,
    required TResult Function(int minLength, int actualLength, ZPath rawPath)
        minLengthNotMet,
    required TResult Function(int maxLength, int actualLength, ZPath rawPath)
        maxLengthExceeded,
    required TResult Function(num min, num val, ZPath rawPath) minNotMet,
    required TResult Function(num max, num val, ZPath rawPath) maxExceeded,
    required TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)
        parseFail,
    required TResult Function(ZPath rawPath, Object? throwable) missingValue,
  }) {
    return maxExceeded(max, val, rawPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult? Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult? Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult? Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult? Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult? Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult? Function(ZPath rawPath, Object? throwable)? missingValue,
  }) {
    return maxExceeded?.call(max, val, rawPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult Function(ZPath rawPath, Object? throwable)? missingValue,
    required TResult orElse(),
  }) {
    if (maxExceeded != null) {
      return maxExceeded(max, val, rawPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZIssueLengthNotMet value) lengthNotMet,
    required TResult Function(ZIssueMinLengthNotMet value) minLengthNotMet,
    required TResult Function(ZIssueMaxLengthExceeded value) maxLengthExceeded,
    required TResult Function(ZIssueMinNotMet value) minNotMet,
    required TResult Function(ZIssueMaxExceeded value) maxExceeded,
    required TResult Function(ZIssueParseFail value) parseFail,
    required TResult Function(ZIssueMissingValue value) missingValue,
  }) {
    return maxExceeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult? Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult? Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult? Function(ZIssueMinNotMet value)? minNotMet,
    TResult? Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult? Function(ZIssueParseFail value)? parseFail,
    TResult? Function(ZIssueMissingValue value)? missingValue,
  }) {
    return maxExceeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult Function(ZIssueMinNotMet value)? minNotMet,
    TResult Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult Function(ZIssueParseFail value)? parseFail,
    TResult Function(ZIssueMissingValue value)? missingValue,
    required TResult orElse(),
  }) {
    if (maxExceeded != null) {
      return maxExceeded(this);
    }
    return orElse();
  }
}

abstract class ZIssueMaxExceeded extends ZIssue {
  const factory ZIssueMaxExceeded(
      {required final num max,
      required final num val,
      final ZPath rawPath}) = _$ZIssueMaxExceededImpl;
  const ZIssueMaxExceeded._() : super._();

  num get max;
  num get val;
  @override
  ZPath get rawPath;
  @override
  @JsonKey(ignore: true)
  _$$ZIssueMaxExceededImplCopyWith<_$ZIssueMaxExceededImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZIssueParseFailImplCopyWith<$Res>
    implements $ZIssueCopyWith<$Res> {
  factory _$$ZIssueParseFailImplCopyWith(_$ZIssueParseFailImpl value,
          $Res Function(_$ZIssueParseFailImpl) then) =
      __$$ZIssueParseFailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Type from, Type to, dynamic val, Object? throwable, ZPath rawPath});

  @override
  $ZPathCopyWith<$Res> get rawPath;
}

/// @nodoc
class __$$ZIssueParseFailImplCopyWithImpl<$Res>
    extends _$ZIssueCopyWithImpl<$Res, _$ZIssueParseFailImpl>
    implements _$$ZIssueParseFailImplCopyWith<$Res> {
  __$$ZIssueParseFailImplCopyWithImpl(
      _$ZIssueParseFailImpl _value, $Res Function(_$ZIssueParseFailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? val = freezed,
    Object? throwable = freezed,
    Object? rawPath = null,
  }) {
    return _then(_$ZIssueParseFailImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Type,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Type,
      val: freezed == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as dynamic,
      throwable: freezed == throwable ? _value.throwable : throwable,
      rawPath: null == rawPath
          ? _value.rawPath
          : rawPath // ignore: cast_nullable_to_non_nullable
              as ZPath,
    ));
  }
}

/// @nodoc

class _$ZIssueParseFailImpl extends ZIssueParseFail {
  const _$ZIssueParseFailImpl(
      {required this.from,
      required this.to,
      required this.val,
      this.throwable,
      this.rawPath = const ZPath([])})
      : super._();

  @override
  final Type from;
  @override
  final Type to;
  @override
  final dynamic val;
  @override
  final Object? throwable;
  @override
  @JsonKey()
  final ZPath rawPath;

  @override
  String toString() {
    return 'ZIssue.parseFail(from: $from, to: $to, val: $val, throwable: $throwable, rawPath: $rawPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZIssueParseFailImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality().equals(other.val, val) &&
            const DeepCollectionEquality().equals(other.throwable, throwable) &&
            (identical(other.rawPath, rawPath) || other.rawPath == rawPath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      from,
      to,
      const DeepCollectionEquality().hash(val),
      const DeepCollectionEquality().hash(throwable),
      rawPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZIssueParseFailImplCopyWith<_$ZIssueParseFailImpl> get copyWith =>
      __$$ZIssueParseFailImplCopyWithImpl<_$ZIssueParseFailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int expectedLength, int actualLength, ZPath rawPath)
        lengthNotMet,
    required TResult Function(int minLength, int actualLength, ZPath rawPath)
        minLengthNotMet,
    required TResult Function(int maxLength, int actualLength, ZPath rawPath)
        maxLengthExceeded,
    required TResult Function(num min, num val, ZPath rawPath) minNotMet,
    required TResult Function(num max, num val, ZPath rawPath) maxExceeded,
    required TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)
        parseFail,
    required TResult Function(ZPath rawPath, Object? throwable) missingValue,
  }) {
    return parseFail(from, to, val, throwable, rawPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult? Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult? Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult? Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult? Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult? Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult? Function(ZPath rawPath, Object? throwable)? missingValue,
  }) {
    return parseFail?.call(from, to, val, throwable, rawPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult Function(ZPath rawPath, Object? throwable)? missingValue,
    required TResult orElse(),
  }) {
    if (parseFail != null) {
      return parseFail(from, to, val, throwable, rawPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZIssueLengthNotMet value) lengthNotMet,
    required TResult Function(ZIssueMinLengthNotMet value) minLengthNotMet,
    required TResult Function(ZIssueMaxLengthExceeded value) maxLengthExceeded,
    required TResult Function(ZIssueMinNotMet value) minNotMet,
    required TResult Function(ZIssueMaxExceeded value) maxExceeded,
    required TResult Function(ZIssueParseFail value) parseFail,
    required TResult Function(ZIssueMissingValue value) missingValue,
  }) {
    return parseFail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult? Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult? Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult? Function(ZIssueMinNotMet value)? minNotMet,
    TResult? Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult? Function(ZIssueParseFail value)? parseFail,
    TResult? Function(ZIssueMissingValue value)? missingValue,
  }) {
    return parseFail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult Function(ZIssueMinNotMet value)? minNotMet,
    TResult Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult Function(ZIssueParseFail value)? parseFail,
    TResult Function(ZIssueMissingValue value)? missingValue,
    required TResult orElse(),
  }) {
    if (parseFail != null) {
      return parseFail(this);
    }
    return orElse();
  }
}

abstract class ZIssueParseFail extends ZIssue {
  const factory ZIssueParseFail(
      {required final Type from,
      required final Type to,
      required final dynamic val,
      final Object? throwable,
      final ZPath rawPath}) = _$ZIssueParseFailImpl;
  const ZIssueParseFail._() : super._();

  Type get from;
  Type get to;
  dynamic get val;
  Object? get throwable;
  @override
  ZPath get rawPath;
  @override
  @JsonKey(ignore: true)
  _$$ZIssueParseFailImplCopyWith<_$ZIssueParseFailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZIssueMissingValueImplCopyWith<$Res>
    implements $ZIssueCopyWith<$Res> {
  factory _$$ZIssueMissingValueImplCopyWith(_$ZIssueMissingValueImpl value,
          $Res Function(_$ZIssueMissingValueImpl) then) =
      __$$ZIssueMissingValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ZPath rawPath, Object? throwable});

  @override
  $ZPathCopyWith<$Res> get rawPath;
}

/// @nodoc
class __$$ZIssueMissingValueImplCopyWithImpl<$Res>
    extends _$ZIssueCopyWithImpl<$Res, _$ZIssueMissingValueImpl>
    implements _$$ZIssueMissingValueImplCopyWith<$Res> {
  __$$ZIssueMissingValueImplCopyWithImpl(_$ZIssueMissingValueImpl _value,
      $Res Function(_$ZIssueMissingValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawPath = null,
    Object? throwable = freezed,
  }) {
    return _then(_$ZIssueMissingValueImpl(
      rawPath: null == rawPath
          ? _value.rawPath
          : rawPath // ignore: cast_nullable_to_non_nullable
              as ZPath,
      throwable: freezed == throwable ? _value.throwable : throwable,
    ));
  }
}

/// @nodoc

class _$ZIssueMissingValueImpl extends ZIssueMissingValue {
  const _$ZIssueMissingValueImpl({required this.rawPath, this.throwable})
      : super._();

  @override
  final ZPath rawPath;
  @override
  final Object? throwable;

  @override
  String toString() {
    return 'ZIssue.missingValue(rawPath: $rawPath, throwable: $throwable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZIssueMissingValueImpl &&
            (identical(other.rawPath, rawPath) || other.rawPath == rawPath) &&
            const DeepCollectionEquality().equals(other.throwable, throwable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, rawPath, const DeepCollectionEquality().hash(throwable));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZIssueMissingValueImplCopyWith<_$ZIssueMissingValueImpl> get copyWith =>
      __$$ZIssueMissingValueImplCopyWithImpl<_$ZIssueMissingValueImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int expectedLength, int actualLength, ZPath rawPath)
        lengthNotMet,
    required TResult Function(int minLength, int actualLength, ZPath rawPath)
        minLengthNotMet,
    required TResult Function(int maxLength, int actualLength, ZPath rawPath)
        maxLengthExceeded,
    required TResult Function(num min, num val, ZPath rawPath) minNotMet,
    required TResult Function(num max, num val, ZPath rawPath) maxExceeded,
    required TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)
        parseFail,
    required TResult Function(ZPath rawPath, Object? throwable) missingValue,
  }) {
    return missingValue(rawPath, throwable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult? Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult? Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult? Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult? Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult? Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult? Function(ZPath rawPath, Object? throwable)? missingValue,
  }) {
    return missingValue?.call(rawPath, throwable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int expectedLength, int actualLength, ZPath rawPath)?
        lengthNotMet,
    TResult Function(int minLength, int actualLength, ZPath rawPath)?
        minLengthNotMet,
    TResult Function(int maxLength, int actualLength, ZPath rawPath)?
        maxLengthExceeded,
    TResult Function(num min, num val, ZPath rawPath)? minNotMet,
    TResult Function(num max, num val, ZPath rawPath)? maxExceeded,
    TResult Function(
            Type from, Type to, dynamic val, Object? throwable, ZPath rawPath)?
        parseFail,
    TResult Function(ZPath rawPath, Object? throwable)? missingValue,
    required TResult orElse(),
  }) {
    if (missingValue != null) {
      return missingValue(rawPath, throwable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZIssueLengthNotMet value) lengthNotMet,
    required TResult Function(ZIssueMinLengthNotMet value) minLengthNotMet,
    required TResult Function(ZIssueMaxLengthExceeded value) maxLengthExceeded,
    required TResult Function(ZIssueMinNotMet value) minNotMet,
    required TResult Function(ZIssueMaxExceeded value) maxExceeded,
    required TResult Function(ZIssueParseFail value) parseFail,
    required TResult Function(ZIssueMissingValue value) missingValue,
  }) {
    return missingValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult? Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult? Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult? Function(ZIssueMinNotMet value)? minNotMet,
    TResult? Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult? Function(ZIssueParseFail value)? parseFail,
    TResult? Function(ZIssueMissingValue value)? missingValue,
  }) {
    return missingValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZIssueLengthNotMet value)? lengthNotMet,
    TResult Function(ZIssueMinLengthNotMet value)? minLengthNotMet,
    TResult Function(ZIssueMaxLengthExceeded value)? maxLengthExceeded,
    TResult Function(ZIssueMinNotMet value)? minNotMet,
    TResult Function(ZIssueMaxExceeded value)? maxExceeded,
    TResult Function(ZIssueParseFail value)? parseFail,
    TResult Function(ZIssueMissingValue value)? missingValue,
    required TResult orElse(),
  }) {
    if (missingValue != null) {
      return missingValue(this);
    }
    return orElse();
  }
}

abstract class ZIssueMissingValue extends ZIssue {
  const factory ZIssueMissingValue(
      {required final ZPath rawPath,
      final Object? throwable}) = _$ZIssueMissingValueImpl;
  const ZIssueMissingValue._() : super._();

  @override
  ZPath get rawPath;
  Object? get throwable;
  @override
  @JsonKey(ignore: true)
  _$$ZIssueMissingValueImplCopyWith<_$ZIssueMissingValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
