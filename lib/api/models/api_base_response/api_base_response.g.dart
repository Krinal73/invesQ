// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiBaseResponse _$ApiBaseResponseFromJson(Map<String, dynamic> json) =>
    _ApiBaseResponse(
      httpStatus: (json['http_status'] as num?)?.toInt(),
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$ApiBaseResponseToJson(_ApiBaseResponse instance) =>
    <String, dynamic>{
      'http_status': instance.httpStatus,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
