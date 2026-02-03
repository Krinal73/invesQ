import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_response_model.freezed.dart';
part 'lead_response_model.g.dart';

@freezed
abstract class LeadResponseModel with _$LeadResponseModel {
  const factory LeadResponseModel({
    int? id,
    String? assigned,
    String? name,
    String? company,
    String? email,
    String? phone,
    @JsonKey(name: 'lead_source_name') String? leadSourceName,
    @JsonKey(name: 'lead_status_name') String? leadStatusName,
    @JsonKey(name: 'lead_status_color') String? leadStatusColor,
    @JsonKey(name: 'created_at') String? createdAt,
    String? lastcontact,
  }) = _LeadResponseModel;

  factory LeadResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LeadResponseModelFromJson(json);
}
