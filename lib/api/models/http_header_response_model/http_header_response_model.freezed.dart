// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_header_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HTTPHeaderResponseModel {

@JsonKey(name: kAuthorizationKey) String? get authorizationToken;@JsonKey(name: kRefreshTokenKey) String? get refreshToken;@JsonKey(name: kDeviceTokenKey) String? get deviceToken;@JsonKey(name: kDeviceTypeKey) String? get deviceType;@JsonKey(name: kDeviceNameKey) String? get deviceName;@JsonKey(name: kOSNameKey) String? get osName;@JsonKey(name: kOSVersionKey) String? get osVersion;@JsonKey(name: kVersionNameKey) String? get versionName;@JsonKey(name: kVersionCodeKey) String? get versionCode;@JsonKey(name: kUserIdKey) String? get userId;@JsonKey(name: kUniqueIdKey) String? get uniqueId;
/// Create a copy of HTTPHeaderResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HTTPHeaderResponseModelCopyWith<HTTPHeaderResponseModel> get copyWith => _$HTTPHeaderResponseModelCopyWithImpl<HTTPHeaderResponseModel>(this as HTTPHeaderResponseModel, _$identity);

  /// Serializes this HTTPHeaderResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HTTPHeaderResponseModel&&(identical(other.authorizationToken, authorizationToken) || other.authorizationToken == authorizationToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.deviceToken, deviceToken) || other.deviceToken == deviceToken)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.osName, osName) || other.osName == osName)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.versionCode, versionCode) || other.versionCode == versionCode)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.uniqueId, uniqueId) || other.uniqueId == uniqueId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authorizationToken,refreshToken,deviceToken,deviceType,deviceName,osName,osVersion,versionName,versionCode,userId,uniqueId);

@override
String toString() {
  return 'HTTPHeaderResponseModel(authorizationToken: $authorizationToken, refreshToken: $refreshToken, deviceToken: $deviceToken, deviceType: $deviceType, deviceName: $deviceName, osName: $osName, osVersion: $osVersion, versionName: $versionName, versionCode: $versionCode, userId: $userId, uniqueId: $uniqueId)';
}


}

/// @nodoc
abstract mixin class $HTTPHeaderResponseModelCopyWith<$Res>  {
  factory $HTTPHeaderResponseModelCopyWith(HTTPHeaderResponseModel value, $Res Function(HTTPHeaderResponseModel) _then) = _$HTTPHeaderResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: kAuthorizationKey) String? authorizationToken,@JsonKey(name: kRefreshTokenKey) String? refreshToken,@JsonKey(name: kDeviceTokenKey) String? deviceToken,@JsonKey(name: kDeviceTypeKey) String? deviceType,@JsonKey(name: kDeviceNameKey) String? deviceName,@JsonKey(name: kOSNameKey) String? osName,@JsonKey(name: kOSVersionKey) String? osVersion,@JsonKey(name: kVersionNameKey) String? versionName,@JsonKey(name: kVersionCodeKey) String? versionCode,@JsonKey(name: kUserIdKey) String? userId,@JsonKey(name: kUniqueIdKey) String? uniqueId
});




}
/// @nodoc
class _$HTTPHeaderResponseModelCopyWithImpl<$Res>
    implements $HTTPHeaderResponseModelCopyWith<$Res> {
  _$HTTPHeaderResponseModelCopyWithImpl(this._self, this._then);

  final HTTPHeaderResponseModel _self;
  final $Res Function(HTTPHeaderResponseModel) _then;

/// Create a copy of HTTPHeaderResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authorizationToken = freezed,Object? refreshToken = freezed,Object? deviceToken = freezed,Object? deviceType = freezed,Object? deviceName = freezed,Object? osName = freezed,Object? osVersion = freezed,Object? versionName = freezed,Object? versionCode = freezed,Object? userId = freezed,Object? uniqueId = freezed,}) {
  return _then(_self.copyWith(
authorizationToken: freezed == authorizationToken ? _self.authorizationToken : authorizationToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,deviceToken: freezed == deviceToken ? _self.deviceToken : deviceToken // ignore: cast_nullable_to_non_nullable
as String?,deviceType: freezed == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String?,deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,osName: freezed == osName ? _self.osName : osName // ignore: cast_nullable_to_non_nullable
as String?,osVersion: freezed == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String?,versionName: freezed == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String?,versionCode: freezed == versionCode ? _self.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,uniqueId: freezed == uniqueId ? _self.uniqueId : uniqueId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HTTPHeaderResponseModel].
extension HTTPHeaderResponseModelPatterns on HTTPHeaderResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HTTPHeaderResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HTTPHeaderResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HTTPHeaderResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _HTTPHeaderResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HTTPHeaderResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _HTTPHeaderResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: kAuthorizationKey)  String? authorizationToken, @JsonKey(name: kRefreshTokenKey)  String? refreshToken, @JsonKey(name: kDeviceTokenKey)  String? deviceToken, @JsonKey(name: kDeviceTypeKey)  String? deviceType, @JsonKey(name: kDeviceNameKey)  String? deviceName, @JsonKey(name: kOSNameKey)  String? osName, @JsonKey(name: kOSVersionKey)  String? osVersion, @JsonKey(name: kVersionNameKey)  String? versionName, @JsonKey(name: kVersionCodeKey)  String? versionCode, @JsonKey(name: kUserIdKey)  String? userId, @JsonKey(name: kUniqueIdKey)  String? uniqueId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HTTPHeaderResponseModel() when $default != null:
return $default(_that.authorizationToken,_that.refreshToken,_that.deviceToken,_that.deviceType,_that.deviceName,_that.osName,_that.osVersion,_that.versionName,_that.versionCode,_that.userId,_that.uniqueId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: kAuthorizationKey)  String? authorizationToken, @JsonKey(name: kRefreshTokenKey)  String? refreshToken, @JsonKey(name: kDeviceTokenKey)  String? deviceToken, @JsonKey(name: kDeviceTypeKey)  String? deviceType, @JsonKey(name: kDeviceNameKey)  String? deviceName, @JsonKey(name: kOSNameKey)  String? osName, @JsonKey(name: kOSVersionKey)  String? osVersion, @JsonKey(name: kVersionNameKey)  String? versionName, @JsonKey(name: kVersionCodeKey)  String? versionCode, @JsonKey(name: kUserIdKey)  String? userId, @JsonKey(name: kUniqueIdKey)  String? uniqueId)  $default,) {final _that = this;
switch (_that) {
case _HTTPHeaderResponseModel():
return $default(_that.authorizationToken,_that.refreshToken,_that.deviceToken,_that.deviceType,_that.deviceName,_that.osName,_that.osVersion,_that.versionName,_that.versionCode,_that.userId,_that.uniqueId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: kAuthorizationKey)  String? authorizationToken, @JsonKey(name: kRefreshTokenKey)  String? refreshToken, @JsonKey(name: kDeviceTokenKey)  String? deviceToken, @JsonKey(name: kDeviceTypeKey)  String? deviceType, @JsonKey(name: kDeviceNameKey)  String? deviceName, @JsonKey(name: kOSNameKey)  String? osName, @JsonKey(name: kOSVersionKey)  String? osVersion, @JsonKey(name: kVersionNameKey)  String? versionName, @JsonKey(name: kVersionCodeKey)  String? versionCode, @JsonKey(name: kUserIdKey)  String? userId, @JsonKey(name: kUniqueIdKey)  String? uniqueId)?  $default,) {final _that = this;
switch (_that) {
case _HTTPHeaderResponseModel() when $default != null:
return $default(_that.authorizationToken,_that.refreshToken,_that.deviceToken,_that.deviceType,_that.deviceName,_that.osName,_that.osVersion,_that.versionName,_that.versionCode,_that.userId,_that.uniqueId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HTTPHeaderResponseModel implements HTTPHeaderResponseModel {
  const _HTTPHeaderResponseModel({@JsonKey(name: kAuthorizationKey) this.authorizationToken, @JsonKey(name: kRefreshTokenKey) this.refreshToken, @JsonKey(name: kDeviceTokenKey) this.deviceToken, @JsonKey(name: kDeviceTypeKey) this.deviceType, @JsonKey(name: kDeviceNameKey) this.deviceName, @JsonKey(name: kOSNameKey) this.osName, @JsonKey(name: kOSVersionKey) this.osVersion, @JsonKey(name: kVersionNameKey) this.versionName, @JsonKey(name: kVersionCodeKey) this.versionCode, @JsonKey(name: kUserIdKey) this.userId, @JsonKey(name: kUniqueIdKey) this.uniqueId});
  factory _HTTPHeaderResponseModel.fromJson(Map<String, dynamic> json) => _$HTTPHeaderResponseModelFromJson(json);

@override@JsonKey(name: kAuthorizationKey) final  String? authorizationToken;
@override@JsonKey(name: kRefreshTokenKey) final  String? refreshToken;
@override@JsonKey(name: kDeviceTokenKey) final  String? deviceToken;
@override@JsonKey(name: kDeviceTypeKey) final  String? deviceType;
@override@JsonKey(name: kDeviceNameKey) final  String? deviceName;
@override@JsonKey(name: kOSNameKey) final  String? osName;
@override@JsonKey(name: kOSVersionKey) final  String? osVersion;
@override@JsonKey(name: kVersionNameKey) final  String? versionName;
@override@JsonKey(name: kVersionCodeKey) final  String? versionCode;
@override@JsonKey(name: kUserIdKey) final  String? userId;
@override@JsonKey(name: kUniqueIdKey) final  String? uniqueId;

/// Create a copy of HTTPHeaderResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HTTPHeaderResponseModelCopyWith<_HTTPHeaderResponseModel> get copyWith => __$HTTPHeaderResponseModelCopyWithImpl<_HTTPHeaderResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HTTPHeaderResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HTTPHeaderResponseModel&&(identical(other.authorizationToken, authorizationToken) || other.authorizationToken == authorizationToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.deviceToken, deviceToken) || other.deviceToken == deviceToken)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.osName, osName) || other.osName == osName)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.versionCode, versionCode) || other.versionCode == versionCode)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.uniqueId, uniqueId) || other.uniqueId == uniqueId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authorizationToken,refreshToken,deviceToken,deviceType,deviceName,osName,osVersion,versionName,versionCode,userId,uniqueId);

@override
String toString() {
  return 'HTTPHeaderResponseModel(authorizationToken: $authorizationToken, refreshToken: $refreshToken, deviceToken: $deviceToken, deviceType: $deviceType, deviceName: $deviceName, osName: $osName, osVersion: $osVersion, versionName: $versionName, versionCode: $versionCode, userId: $userId, uniqueId: $uniqueId)';
}


}

/// @nodoc
abstract mixin class _$HTTPHeaderResponseModelCopyWith<$Res> implements $HTTPHeaderResponseModelCopyWith<$Res> {
  factory _$HTTPHeaderResponseModelCopyWith(_HTTPHeaderResponseModel value, $Res Function(_HTTPHeaderResponseModel) _then) = __$HTTPHeaderResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: kAuthorizationKey) String? authorizationToken,@JsonKey(name: kRefreshTokenKey) String? refreshToken,@JsonKey(name: kDeviceTokenKey) String? deviceToken,@JsonKey(name: kDeviceTypeKey) String? deviceType,@JsonKey(name: kDeviceNameKey) String? deviceName,@JsonKey(name: kOSNameKey) String? osName,@JsonKey(name: kOSVersionKey) String? osVersion,@JsonKey(name: kVersionNameKey) String? versionName,@JsonKey(name: kVersionCodeKey) String? versionCode,@JsonKey(name: kUserIdKey) String? userId,@JsonKey(name: kUniqueIdKey) String? uniqueId
});




}
/// @nodoc
class __$HTTPHeaderResponseModelCopyWithImpl<$Res>
    implements _$HTTPHeaderResponseModelCopyWith<$Res> {
  __$HTTPHeaderResponseModelCopyWithImpl(this._self, this._then);

  final _HTTPHeaderResponseModel _self;
  final $Res Function(_HTTPHeaderResponseModel) _then;

/// Create a copy of HTTPHeaderResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authorizationToken = freezed,Object? refreshToken = freezed,Object? deviceToken = freezed,Object? deviceType = freezed,Object? deviceName = freezed,Object? osName = freezed,Object? osVersion = freezed,Object? versionName = freezed,Object? versionCode = freezed,Object? userId = freezed,Object? uniqueId = freezed,}) {
  return _then(_HTTPHeaderResponseModel(
authorizationToken: freezed == authorizationToken ? _self.authorizationToken : authorizationToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,deviceToken: freezed == deviceToken ? _self.deviceToken : deviceToken // ignore: cast_nullable_to_non_nullable
as String?,deviceType: freezed == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String?,deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,osName: freezed == osName ? _self.osName : osName // ignore: cast_nullable_to_non_nullable
as String?,osVersion: freezed == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String?,versionName: freezed == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String?,versionCode: freezed == versionCode ? _self.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,uniqueId: freezed == uniqueId ? _self.uniqueId : uniqueId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
