import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response_model.freezed.dart';
part 'user_response_model.g.dart';

@freezed
abstract class UserResponseModel with _$UserResponseModel {
  const factory UserResponseModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'userid') int? userId,
    @JsonKey(name: 'client_id') int? clientId,
    @JsonKey(name: 'role_id') int? roleId,
    @JsonKey(name: 'firstname') String? firstName,
    @JsonKey(name: 'lastname') String? lastName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'phonenumber') String? phoneNumber,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'profile_image') String? profileImage,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _UserResponseModel;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
}
