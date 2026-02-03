// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_header_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HTTPHeaderResponseModel _$HTTPHeaderResponseModelFromJson(
  Map<String, dynamic> json,
) => _HTTPHeaderResponseModel(
  authorizationToken: json['Authorization'] as String?,
  refreshToken: json['refreshToken'] as String?,
  deviceToken: json['deviceToken'] as String?,
  deviceType: json['Device-Type'] as String?,
  deviceName: json['Device-Name'] as String?,
  osName: json['OS-Name'] as String?,
  osVersion: json['OS-Version'] as String?,
  versionName: json['Version-Name'] as String?,
  versionCode: json['Version-Code'] as String?,
  userId: json['User-ID'] as String?,
  uniqueId: json['Unique-ID'] as String?,
);

Map<String, dynamic> _$HTTPHeaderResponseModelToJson(
  _HTTPHeaderResponseModel instance,
) => <String, dynamic>{
  'Authorization': instance.authorizationToken,
  'refreshToken': instance.refreshToken,
  'deviceToken': instance.deviceToken,
  'Device-Type': instance.deviceType,
  'Device-Name': instance.deviceName,
  'OS-Name': instance.osName,
  'OS-Version': instance.osVersion,
  'Version-Name': instance.versionName,
  'Version-Code': instance.versionCode,
  'User-ID': instance.userId,
  'Unique-ID': instance.uniqueId,
};
