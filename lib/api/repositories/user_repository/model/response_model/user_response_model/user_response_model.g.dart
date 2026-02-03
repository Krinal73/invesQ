// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    _UserResponseModel(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userid'] as num?)?.toInt(),
      clientId: (json['client_id'] as num?)?.toInt(),
      roleId: (json['role_id'] as num?)?.toInt(),
      firstName: json['firstname'] as String?,
      lastName: json['lastname'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phonenumber'] as String?,
      title: json['title'] as String?,
      profileImage: json['profile_image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserResponseModelToJson(_UserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userid': instance.userId,
      'client_id': instance.clientId,
      'role_id': instance.roleId,
      'firstname': instance.firstName,
      'lastname': instance.lastName,
      'email': instance.email,
      'phonenumber': instance.phoneNumber,
      'title': instance.title,
      'profile_image': instance.profileImage,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
