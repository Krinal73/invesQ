import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/constants.dart';

part 'http_header_response_model.freezed.dart';
part 'http_header_response_model.g.dart';

@freezed
abstract class HTTPHeaderResponseModel with _$HTTPHeaderResponseModel {
  const factory HTTPHeaderResponseModel({
    @JsonKey(name: kAuthorizationKey) String? authorizationToken,
    @JsonKey(name: kRefreshTokenKey) String? refreshToken,
    @JsonKey(name: kDeviceTokenKey) String? deviceToken,
    @JsonKey(name: kDeviceTypeKey) String? deviceType,
    @JsonKey(name: kDeviceNameKey) String? deviceName,
    @JsonKey(name: kOSNameKey) String? osName,
    @JsonKey(name: kOSVersionKey) String? osVersion,
    @JsonKey(name: kVersionNameKey) String? versionName,
    @JsonKey(name: kVersionCodeKey) String? versionCode,
    @JsonKey(name: kUserIdKey) String? userId,
    @JsonKey(name: kUniqueIdKey) String? uniqueId,
  }) = _HTTPHeaderResponseModel;

  factory HTTPHeaderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HTTPHeaderResponseModelFromJson(json);
}
