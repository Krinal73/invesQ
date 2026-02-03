// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeadResponseModel _$LeadResponseModelFromJson(Map<String, dynamic> json) =>
    _LeadResponseModel(
      id: (json['id'] as num?)?.toInt(),
      assigned: json['assigned'] as String?,
      name: json['name'] as String?,
      company: json['company'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      leadSourceName: json['lead_source_name'] as String?,
      leadStatusName: json['lead_status_name'] as String?,
      leadStatusColor: json['lead_status_color'] as String?,
      createdAt: json['created_at'] as String?,
      lastcontact: json['lastcontact'] as String?,
    );

Map<String, dynamic> _$LeadResponseModelToJson(_LeadResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assigned': instance.assigned,
      'name': instance.name,
      'company': instance.company,
      'email': instance.email,
      'phone': instance.phone,
      'lead_source_name': instance.leadSourceName,
      'lead_status_name': instance.leadStatusName,
      'lead_status_color': instance.leadStatusColor,
      'created_at': instance.createdAt,
      'lastcontact': instance.lastcontact,
    };
