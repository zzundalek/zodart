// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ctor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Ctor {

 bool get isConst; bool get isFactory; Map<String, Reference> get reqNamedParams; Map<String, Reference> get optNamedParams; List<Reference> get reqPositionalParams; List<Reference> get optPositionalParams;
/// Create a copy of Ctor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CtorCopyWith<Ctor> get copyWith => _$CtorCopyWithImpl<Ctor>(this as Ctor, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ctor&&(identical(other.isConst, isConst) || other.isConst == isConst)&&(identical(other.isFactory, isFactory) || other.isFactory == isFactory)&&const DeepCollectionEquality().equals(other.reqNamedParams, reqNamedParams)&&const DeepCollectionEquality().equals(other.optNamedParams, optNamedParams)&&const DeepCollectionEquality().equals(other.reqPositionalParams, reqPositionalParams)&&const DeepCollectionEquality().equals(other.optPositionalParams, optPositionalParams));
}


@override
int get hashCode => Object.hash(runtimeType,isConst,isFactory,const DeepCollectionEquality().hash(reqNamedParams),const DeepCollectionEquality().hash(optNamedParams),const DeepCollectionEquality().hash(reqPositionalParams),const DeepCollectionEquality().hash(optPositionalParams));

@override
String toString() {
  return 'Ctor(isConst: $isConst, isFactory: $isFactory, reqNamedParams: $reqNamedParams, optNamedParams: $optNamedParams, reqPositionalParams: $reqPositionalParams, optPositionalParams: $optPositionalParams)';
}


}

/// @nodoc
abstract mixin class $CtorCopyWith<$Res>  {
  factory $CtorCopyWith(Ctor value, $Res Function(Ctor) _then) = _$CtorCopyWithImpl;
@useResult
$Res call({
 bool isConst, bool isFactory, Map<String, Reference> reqNamedParams, Map<String, Reference> optNamedParams, List<Reference> reqPositionalParams, List<Reference> optPositionalParams
});




}
/// @nodoc
class _$CtorCopyWithImpl<$Res>
    implements $CtorCopyWith<$Res> {
  _$CtorCopyWithImpl(this._self, this._then);

  final Ctor _self;
  final $Res Function(Ctor) _then;

/// Create a copy of Ctor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isConst = null,Object? isFactory = null,Object? reqNamedParams = null,Object? optNamedParams = null,Object? reqPositionalParams = null,Object? optPositionalParams = null,}) {
  return _then(_self.copyWith(
isConst: null == isConst ? _self.isConst : isConst // ignore: cast_nullable_to_non_nullable
as bool,isFactory: null == isFactory ? _self.isFactory : isFactory // ignore: cast_nullable_to_non_nullable
as bool,reqNamedParams: null == reqNamedParams ? _self.reqNamedParams : reqNamedParams // ignore: cast_nullable_to_non_nullable
as Map<String, Reference>,optNamedParams: null == optNamedParams ? _self.optNamedParams : optNamedParams // ignore: cast_nullable_to_non_nullable
as Map<String, Reference>,reqPositionalParams: null == reqPositionalParams ? _self.reqPositionalParams : reqPositionalParams // ignore: cast_nullable_to_non_nullable
as List<Reference>,optPositionalParams: null == optPositionalParams ? _self.optPositionalParams : optPositionalParams // ignore: cast_nullable_to_non_nullable
as List<Reference>,
  ));
}

}


/// @nodoc


class NamedCtor extends Ctor {
  const NamedCtor({required this.name, required this.isConst, required this.isFactory, required final  Map<String, Reference> reqNamedParams, required final  Map<String, Reference> optNamedParams, required final  List<Reference> reqPositionalParams, required final  List<Reference> optPositionalParams}): _reqNamedParams = reqNamedParams,_optNamedParams = optNamedParams,_reqPositionalParams = reqPositionalParams,_optPositionalParams = optPositionalParams,super._();
  

 final  String name;
@override final  bool isConst;
@override final  bool isFactory;
 final  Map<String, Reference> _reqNamedParams;
@override Map<String, Reference> get reqNamedParams {
  if (_reqNamedParams is EqualUnmodifiableMapView) return _reqNamedParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_reqNamedParams);
}

 final  Map<String, Reference> _optNamedParams;
@override Map<String, Reference> get optNamedParams {
  if (_optNamedParams is EqualUnmodifiableMapView) return _optNamedParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_optNamedParams);
}

 final  List<Reference> _reqPositionalParams;
@override List<Reference> get reqPositionalParams {
  if (_reqPositionalParams is EqualUnmodifiableListView) return _reqPositionalParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reqPositionalParams);
}

 final  List<Reference> _optPositionalParams;
@override List<Reference> get optPositionalParams {
  if (_optPositionalParams is EqualUnmodifiableListView) return _optPositionalParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_optPositionalParams);
}


/// Create a copy of Ctor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NamedCtorCopyWith<NamedCtor> get copyWith => _$NamedCtorCopyWithImpl<NamedCtor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NamedCtor&&(identical(other.name, name) || other.name == name)&&(identical(other.isConst, isConst) || other.isConst == isConst)&&(identical(other.isFactory, isFactory) || other.isFactory == isFactory)&&const DeepCollectionEquality().equals(other._reqNamedParams, _reqNamedParams)&&const DeepCollectionEquality().equals(other._optNamedParams, _optNamedParams)&&const DeepCollectionEquality().equals(other._reqPositionalParams, _reqPositionalParams)&&const DeepCollectionEquality().equals(other._optPositionalParams, _optPositionalParams));
}


@override
int get hashCode => Object.hash(runtimeType,name,isConst,isFactory,const DeepCollectionEquality().hash(_reqNamedParams),const DeepCollectionEquality().hash(_optNamedParams),const DeepCollectionEquality().hash(_reqPositionalParams),const DeepCollectionEquality().hash(_optPositionalParams));

@override
String toString() {
  return 'Ctor.namedCtor(name: $name, isConst: $isConst, isFactory: $isFactory, reqNamedParams: $reqNamedParams, optNamedParams: $optNamedParams, reqPositionalParams: $reqPositionalParams, optPositionalParams: $optPositionalParams)';
}


}

/// @nodoc
abstract mixin class $NamedCtorCopyWith<$Res> implements $CtorCopyWith<$Res> {
  factory $NamedCtorCopyWith(NamedCtor value, $Res Function(NamedCtor) _then) = _$NamedCtorCopyWithImpl;
@override @useResult
$Res call({
 String name, bool isConst, bool isFactory, Map<String, Reference> reqNamedParams, Map<String, Reference> optNamedParams, List<Reference> reqPositionalParams, List<Reference> optPositionalParams
});




}
/// @nodoc
class _$NamedCtorCopyWithImpl<$Res>
    implements $NamedCtorCopyWith<$Res> {
  _$NamedCtorCopyWithImpl(this._self, this._then);

  final NamedCtor _self;
  final $Res Function(NamedCtor) _then;

/// Create a copy of Ctor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? isConst = null,Object? isFactory = null,Object? reqNamedParams = null,Object? optNamedParams = null,Object? reqPositionalParams = null,Object? optPositionalParams = null,}) {
  return _then(NamedCtor(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isConst: null == isConst ? _self.isConst : isConst // ignore: cast_nullable_to_non_nullable
as bool,isFactory: null == isFactory ? _self.isFactory : isFactory // ignore: cast_nullable_to_non_nullable
as bool,reqNamedParams: null == reqNamedParams ? _self._reqNamedParams : reqNamedParams // ignore: cast_nullable_to_non_nullable
as Map<String, Reference>,optNamedParams: null == optNamedParams ? _self._optNamedParams : optNamedParams // ignore: cast_nullable_to_non_nullable
as Map<String, Reference>,reqPositionalParams: null == reqPositionalParams ? _self._reqPositionalParams : reqPositionalParams // ignore: cast_nullable_to_non_nullable
as List<Reference>,optPositionalParams: null == optPositionalParams ? _self._optPositionalParams : optPositionalParams // ignore: cast_nullable_to_non_nullable
as List<Reference>,
  ));
}


}

/// @nodoc


class UnnamedCtor extends Ctor {
  const UnnamedCtor({required this.isConst, required this.isFactory, required final  Map<String, Reference> reqNamedParams, required final  Map<String, Reference> optNamedParams, required final  List<Reference> reqPositionalParams, required final  List<Reference> optPositionalParams}): _reqNamedParams = reqNamedParams,_optNamedParams = optNamedParams,_reqPositionalParams = reqPositionalParams,_optPositionalParams = optPositionalParams,super._();
  

@override final  bool isConst;
@override final  bool isFactory;
 final  Map<String, Reference> _reqNamedParams;
@override Map<String, Reference> get reqNamedParams {
  if (_reqNamedParams is EqualUnmodifiableMapView) return _reqNamedParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_reqNamedParams);
}

 final  Map<String, Reference> _optNamedParams;
@override Map<String, Reference> get optNamedParams {
  if (_optNamedParams is EqualUnmodifiableMapView) return _optNamedParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_optNamedParams);
}

 final  List<Reference> _reqPositionalParams;
@override List<Reference> get reqPositionalParams {
  if (_reqPositionalParams is EqualUnmodifiableListView) return _reqPositionalParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reqPositionalParams);
}

 final  List<Reference> _optPositionalParams;
@override List<Reference> get optPositionalParams {
  if (_optPositionalParams is EqualUnmodifiableListView) return _optPositionalParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_optPositionalParams);
}


/// Create a copy of Ctor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnnamedCtorCopyWith<UnnamedCtor> get copyWith => _$UnnamedCtorCopyWithImpl<UnnamedCtor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnnamedCtor&&(identical(other.isConst, isConst) || other.isConst == isConst)&&(identical(other.isFactory, isFactory) || other.isFactory == isFactory)&&const DeepCollectionEquality().equals(other._reqNamedParams, _reqNamedParams)&&const DeepCollectionEquality().equals(other._optNamedParams, _optNamedParams)&&const DeepCollectionEquality().equals(other._reqPositionalParams, _reqPositionalParams)&&const DeepCollectionEquality().equals(other._optPositionalParams, _optPositionalParams));
}


@override
int get hashCode => Object.hash(runtimeType,isConst,isFactory,const DeepCollectionEquality().hash(_reqNamedParams),const DeepCollectionEquality().hash(_optNamedParams),const DeepCollectionEquality().hash(_reqPositionalParams),const DeepCollectionEquality().hash(_optPositionalParams));

@override
String toString() {
  return 'Ctor.unnamedCtor(isConst: $isConst, isFactory: $isFactory, reqNamedParams: $reqNamedParams, optNamedParams: $optNamedParams, reqPositionalParams: $reqPositionalParams, optPositionalParams: $optPositionalParams)';
}


}

/// @nodoc
abstract mixin class $UnnamedCtorCopyWith<$Res> implements $CtorCopyWith<$Res> {
  factory $UnnamedCtorCopyWith(UnnamedCtor value, $Res Function(UnnamedCtor) _then) = _$UnnamedCtorCopyWithImpl;
@override @useResult
$Res call({
 bool isConst, bool isFactory, Map<String, Reference> reqNamedParams, Map<String, Reference> optNamedParams, List<Reference> reqPositionalParams, List<Reference> optPositionalParams
});




}
/// @nodoc
class _$UnnamedCtorCopyWithImpl<$Res>
    implements $UnnamedCtorCopyWith<$Res> {
  _$UnnamedCtorCopyWithImpl(this._self, this._then);

  final UnnamedCtor _self;
  final $Res Function(UnnamedCtor) _then;

/// Create a copy of Ctor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isConst = null,Object? isFactory = null,Object? reqNamedParams = null,Object? optNamedParams = null,Object? reqPositionalParams = null,Object? optPositionalParams = null,}) {
  return _then(UnnamedCtor(
isConst: null == isConst ? _self.isConst : isConst // ignore: cast_nullable_to_non_nullable
as bool,isFactory: null == isFactory ? _self.isFactory : isFactory // ignore: cast_nullable_to_non_nullable
as bool,reqNamedParams: null == reqNamedParams ? _self._reqNamedParams : reqNamedParams // ignore: cast_nullable_to_non_nullable
as Map<String, Reference>,optNamedParams: null == optNamedParams ? _self._optNamedParams : optNamedParams // ignore: cast_nullable_to_non_nullable
as Map<String, Reference>,reqPositionalParams: null == reqPositionalParams ? _self._reqPositionalParams : reqPositionalParams // ignore: cast_nullable_to_non_nullable
as List<Reference>,optPositionalParams: null == optPositionalParams ? _self._optPositionalParams : optPositionalParams // ignore: cast_nullable_to_non_nullable
as List<Reference>,
  ));
}


}

// dart format on
