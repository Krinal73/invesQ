// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeadResponseModel {

 int? get id; String? get assigned; String? get name; String? get company; String? get email; String? get phone;@JsonKey(name: 'lead_source_name') String? get leadSourceName;@JsonKey(name: 'lead_status_name') String? get leadStatusName;@JsonKey(name: 'lead_status_color') String? get leadStatusColor;@JsonKey(name: 'created_at') String? get createdAt; String? get lastcontact;
/// Create a copy of LeadResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeadResponseModelCopyWith<LeadResponseModel> get copyWith => _$LeadResponseModelCopyWithImpl<LeadResponseModel>(this as LeadResponseModel, _$identity);

  /// Serializes this LeadResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.assigned, assigned) || other.assigned == assigned)&&(identical(other.name, name) || other.name == name)&&(identical(other.company, company) || other.company == company)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.leadSourceName, leadSourceName) || other.leadSourceName == leadSourceName)&&(identical(other.leadStatusName, leadStatusName) || other.leadStatusName == leadStatusName)&&(identical(other.leadStatusColor, leadStatusColor) || other.leadStatusColor == leadStatusColor)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastcontact, lastcontact) || other.lastcontact == lastcontact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,assigned,name,company,email,phone,leadSourceName,leadStatusName,leadStatusColor,createdAt,lastcontact);

@override
String toString() {
  return 'LeadResponseModel(id: $id, assigned: $assigned, name: $name, company: $company, email: $email, phone: $phone, leadSourceName: $leadSourceName, leadStatusName: $leadStatusName, leadStatusColor: $leadStatusColor, createdAt: $createdAt, lastcontact: $lastcontact)';
}


}

/// @nodoc
abstract mixin class $LeadResponseModelCopyWith<$Res>  {
  factory $LeadResponseModelCopyWith(LeadResponseModel value, $Res Function(LeadResponseModel) _then) = _$LeadResponseModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? assigned, String? name, String? company, String? email, String? phone,@JsonKey(name: 'lead_source_name') String? leadSourceName,@JsonKey(name: 'lead_status_name') String? leadStatusName,@JsonKey(name: 'lead_status_color') String? leadStatusColor,@JsonKey(name: 'created_at') String? createdAt, String? lastcontact
});




}
/// @nodoc
class _$LeadResponseModelCopyWithImpl<$Res>
    implements $LeadResponseModelCopyWith<$Res> {
  _$LeadResponseModelCopyWithImpl(this._self, this._then);

  final LeadResponseModel _self;
  final $Res Function(LeadResponseModel) _then;

/// Create a copy of LeadResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? assigned = freezed,Object? name = freezed,Object? company = freezed,Object? email = freezed,Object? phone = freezed,Object? leadSourceName = freezed,Object? leadStatusName = freezed,Object? leadStatusColor = freezed,Object? createdAt = freezed,Object? lastcontact = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,assigned: freezed == assigned ? _self.assigned : assigned // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,leadSourceName: freezed == leadSourceName ? _self.leadSourceName : leadSourceName // ignore: cast_nullable_to_non_nullable
as String?,leadStatusName: freezed == leadStatusName ? _self.leadStatusName : leadStatusName // ignore: cast_nullable_to_non_nullable
as String?,leadStatusColor: freezed == leadStatusColor ? _self.leadStatusColor : leadStatusColor // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,lastcontact: freezed == lastcontact ? _self.lastcontact : lastcontact // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeadResponseModel].
extension LeadResponseModelPatterns on LeadResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeadResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeadResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeadResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _LeadResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeadResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _LeadResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? assigned,  String? name,  String? company,  String? email,  String? phone, @JsonKey(name: 'lead_source_name')  String? leadSourceName, @JsonKey(name: 'lead_status_name')  String? leadStatusName, @JsonKey(name: 'lead_status_color')  String? leadStatusColor, @JsonKey(name: 'created_at')  String? createdAt,  String? lastcontact)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeadResponseModel() when $default != null:
return $default(_that.id,_that.assigned,_that.name,_that.company,_that.email,_that.phone,_that.leadSourceName,_that.leadStatusName,_that.leadStatusColor,_that.createdAt,_that.lastcontact);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? assigned,  String? name,  String? company,  String? email,  String? phone, @JsonKey(name: 'lead_source_name')  String? leadSourceName, @JsonKey(name: 'lead_status_name')  String? leadStatusName, @JsonKey(name: 'lead_status_color')  String? leadStatusColor, @JsonKey(name: 'created_at')  String? createdAt,  String? lastcontact)  $default,) {final _that = this;
switch (_that) {
case _LeadResponseModel():
return $default(_that.id,_that.assigned,_that.name,_that.company,_that.email,_that.phone,_that.leadSourceName,_that.leadStatusName,_that.leadStatusColor,_that.createdAt,_that.lastcontact);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? assigned,  String? name,  String? company,  String? email,  String? phone, @JsonKey(name: 'lead_source_name')  String? leadSourceName, @JsonKey(name: 'lead_status_name')  String? leadStatusName, @JsonKey(name: 'lead_status_color')  String? leadStatusColor, @JsonKey(name: 'created_at')  String? createdAt,  String? lastcontact)?  $default,) {final _that = this;
switch (_that) {
case _LeadResponseModel() when $default != null:
return $default(_that.id,_that.assigned,_that.name,_that.company,_that.email,_that.phone,_that.leadSourceName,_that.leadStatusName,_that.leadStatusColor,_that.createdAt,_that.lastcontact);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeadResponseModel implements LeadResponseModel {
  const _LeadResponseModel({this.id, this.assigned, this.name, this.company, this.email, this.phone, @JsonKey(name: 'lead_source_name') this.leadSourceName, @JsonKey(name: 'lead_status_name') this.leadStatusName, @JsonKey(name: 'lead_status_color') this.leadStatusColor, @JsonKey(name: 'created_at') this.createdAt, this.lastcontact});
  factory _LeadResponseModel.fromJson(Map<String, dynamic> json) => _$LeadResponseModelFromJson(json);

@override final  int? id;
@override final  String? assigned;
@override final  String? name;
@override final  String? company;
@override final  String? email;
@override final  String? phone;
@override@JsonKey(name: 'lead_source_name') final  String? leadSourceName;
@override@JsonKey(name: 'lead_status_name') final  String? leadStatusName;
@override@JsonKey(name: 'lead_status_color') final  String? leadStatusColor;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override final  String? lastcontact;

/// Create a copy of LeadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeadResponseModelCopyWith<_LeadResponseModel> get copyWith => __$LeadResponseModelCopyWithImpl<_LeadResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeadResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeadResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.assigned, assigned) || other.assigned == assigned)&&(identical(other.name, name) || other.name == name)&&(identical(other.company, company) || other.company == company)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.leadSourceName, leadSourceName) || other.leadSourceName == leadSourceName)&&(identical(other.leadStatusName, leadStatusName) || other.leadStatusName == leadStatusName)&&(identical(other.leadStatusColor, leadStatusColor) || other.leadStatusColor == leadStatusColor)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastcontact, lastcontact) || other.lastcontact == lastcontact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,assigned,name,company,email,phone,leadSourceName,leadStatusName,leadStatusColor,createdAt,lastcontact);

@override
String toString() {
  return 'LeadResponseModel(id: $id, assigned: $assigned, name: $name, company: $company, email: $email, phone: $phone, leadSourceName: $leadSourceName, leadStatusName: $leadStatusName, leadStatusColor: $leadStatusColor, createdAt: $createdAt, lastcontact: $lastcontact)';
}


}

/// @nodoc
abstract mixin class _$LeadResponseModelCopyWith<$Res> implements $LeadResponseModelCopyWith<$Res> {
  factory _$LeadResponseModelCopyWith(_LeadResponseModel value, $Res Function(_LeadResponseModel) _then) = __$LeadResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? assigned, String? name, String? company, String? email, String? phone,@JsonKey(name: 'lead_source_name') String? leadSourceName,@JsonKey(name: 'lead_status_name') String? leadStatusName,@JsonKey(name: 'lead_status_color') String? leadStatusColor,@JsonKey(name: 'created_at') String? createdAt, String? lastcontact
});




}
/// @nodoc
class __$LeadResponseModelCopyWithImpl<$Res>
    implements _$LeadResponseModelCopyWith<$Res> {
  __$LeadResponseModelCopyWithImpl(this._self, this._then);

  final _LeadResponseModel _self;
  final $Res Function(_LeadResponseModel) _then;

/// Create a copy of LeadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? assigned = freezed,Object? name = freezed,Object? company = freezed,Object? email = freezed,Object? phone = freezed,Object? leadSourceName = freezed,Object? leadStatusName = freezed,Object? leadStatusColor = freezed,Object? createdAt = freezed,Object? lastcontact = freezed,}) {
  return _then(_LeadResponseModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,assigned: freezed == assigned ? _self.assigned : assigned // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,leadSourceName: freezed == leadSourceName ? _self.leadSourceName : leadSourceName // ignore: cast_nullable_to_non_nullable
as String?,leadStatusName: freezed == leadStatusName ? _self.leadStatusName : leadStatusName // ignore: cast_nullable_to_non_nullable
as String?,leadStatusColor: freezed == leadStatusColor ? _self.leadStatusColor : leadStatusColor // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,lastcontact: freezed == lastcontact ? _self.lastcontact : lastcontact // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
