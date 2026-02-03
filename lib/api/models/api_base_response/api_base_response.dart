import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_base_response.freezed.dart';
part 'api_base_response.g.dart';

@freezed
abstract class ApiBaseResponse with _$ApiBaseResponse {
  const factory ApiBaseResponse({
    @JsonKey(name: 'http_status') int? httpStatus,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') dynamic data,
  }) = _ApiBaseResponse;

  factory ApiBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiBaseResponseFromJson(json);
}
