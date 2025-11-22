// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CityResponse {

@JsonKey(name: 'name') String get name;@JsonKey(name: 'lat') double get lat;@JsonKey(name: 'lon') double get lon;@JsonKey(name: 'country') String get country;@JsonKey(name: 'state') String get state;
/// Create a copy of CityResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityResponseCopyWith<CityResponse> get copyWith => _$CityResponseCopyWithImpl<CityResponse>(this as CityResponse, _$identity);

  /// Serializes this CityResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.country, country) || other.country == country)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,lat,lon,country,state);

@override
String toString() {
  return 'CityResponse(name: $name, lat: $lat, lon: $lon, country: $country, state: $state)';
}


}

/// @nodoc
abstract mixin class $CityResponseCopyWith<$Res>  {
  factory $CityResponseCopyWith(CityResponse value, $Res Function(CityResponse) _then) = _$CityResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String name,@JsonKey(name: 'lat') double lat,@JsonKey(name: 'lon') double lon,@JsonKey(name: 'country') String country,@JsonKey(name: 'state') String state
});




}
/// @nodoc
class _$CityResponseCopyWithImpl<$Res>
    implements $CityResponseCopyWith<$Res> {
  _$CityResponseCopyWithImpl(this._self, this._then);

  final CityResponse _self;
  final $Res Function(CityResponse) _then;

/// Create a copy of CityResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? lat = null,Object? lon = null,Object? country = null,Object? state = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CityResponse].
extension CityResponsePatterns on CityResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityResponse value)  $default,){
final _that = this;
switch (_that) {
case _CityResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CityResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'lon')  double lon, @JsonKey(name: 'country')  String country, @JsonKey(name: 'state')  String state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityResponse() when $default != null:
return $default(_that.name,_that.lat,_that.lon,_that.country,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'lon')  double lon, @JsonKey(name: 'country')  String country, @JsonKey(name: 'state')  String state)  $default,) {final _that = this;
switch (_that) {
case _CityResponse():
return $default(_that.name,_that.lat,_that.lon,_that.country,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'lon')  double lon, @JsonKey(name: 'country')  String country, @JsonKey(name: 'state')  String state)?  $default,) {final _that = this;
switch (_that) {
case _CityResponse() when $default != null:
return $default(_that.name,_that.lat,_that.lon,_that.country,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CityResponse implements CityResponse {
  const _CityResponse({@JsonKey(name: 'name') this.name = '', @JsonKey(name: 'lat') this.lat = 0.0, @JsonKey(name: 'lon') this.lon = 0.0, @JsonKey(name: 'country') this.country = '', @JsonKey(name: 'state') this.state = ''});
  factory _CityResponse.fromJson(Map<String, dynamic> json) => _$CityResponseFromJson(json);

@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'lat') final  double lat;
@override@JsonKey(name: 'lon') final  double lon;
@override@JsonKey(name: 'country') final  String country;
@override@JsonKey(name: 'state') final  String state;

/// Create a copy of CityResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityResponseCopyWith<_CityResponse> get copyWith => __$CityResponseCopyWithImpl<_CityResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CityResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.country, country) || other.country == country)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,lat,lon,country,state);

@override
String toString() {
  return 'CityResponse(name: $name, lat: $lat, lon: $lon, country: $country, state: $state)';
}


}

/// @nodoc
abstract mixin class _$CityResponseCopyWith<$Res> implements $CityResponseCopyWith<$Res> {
  factory _$CityResponseCopyWith(_CityResponse value, $Res Function(_CityResponse) _then) = __$CityResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String name,@JsonKey(name: 'lat') double lat,@JsonKey(name: 'lon') double lon,@JsonKey(name: 'country') String country,@JsonKey(name: 'state') String state
});




}
/// @nodoc
class __$CityResponseCopyWithImpl<$Res>
    implements _$CityResponseCopyWith<$Res> {
  __$CityResponseCopyWithImpl(this._self, this._then);

  final _CityResponse _self;
  final $Res Function(_CityResponse) _then;

/// Create a copy of CityResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? lat = null,Object? lon = null,Object? country = null,Object? state = null,}) {
  return _then(_CityResponse(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
