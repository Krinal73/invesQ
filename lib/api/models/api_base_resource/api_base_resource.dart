import '../../../utils/enum_utils.dart';
import '../../../utils/string_utils.dart';

class ApiBaseResource {
  ApiStatus apiStatus;
  dynamic data;
  String? message;
  int httpStatus;
  String? accessToken;
  String? tokenType;

  ApiBaseResource({
    this.apiStatus = ApiStatus.unknown,
    this.data,
    this.message,
    this.httpStatus = 0,
    this.accessToken,
    this.tokenType,
  });

  // -------- STATES (same pattern as Sharadgram) --------

  static ApiBaseResource unknown() =>
      ApiBaseResource(apiStatus: ApiStatus.unknown);

  static ApiBaseResource loading() =>
      ApiBaseResource(apiStatus: ApiStatus.loading);

  static ApiBaseResource success(
    dynamic data,
    String message, {
    int httpStatus = 200,
    String? accessToken,
    String? tokenType,
  }) => ApiBaseResource(
    apiStatus: ApiStatus.success,
    data: data,
    message: message,
    httpStatus: httpStatus,
    accessToken: accessToken,
    tokenType: tokenType,
  );

  static dynamic warning(
    dynamic data,
    String message, {
    int httpStatus = 200,
    String? accessToken,
    String? tokenType,
  }) => ApiBaseResource(
    apiStatus: ApiStatus.warning,
    data: data,
    message: message,
    httpStatus: httpStatus,
    accessToken: accessToken,
    tokenType: tokenType,
  );

  static ApiBaseResource error(String message, {int httpStatus = 500}) =>
      ApiBaseResource(
        apiStatus: ApiStatus.error,
        message: message,
        httpStatus: httpStatus,
      );

  static ApiBaseResource unauthorizedAccess(String message) => ApiBaseResource(
    apiStatus: ApiStatus.unauthorizedAccess,
    message: message,
    httpStatus: 401,
  );

  static ApiBaseResource tokenExpired() =>
      ApiBaseResource(apiStatus: ApiStatus.tokenExpired, httpStatus: 401);

  static ApiBaseResource updateApp() =>
      ApiBaseResource(apiStatus: ApiStatus.updateApp);

  static ApiBaseResource somethingWentWrong({String? message}) =>
      ApiBaseResource(
        apiStatus: ApiStatus.somethingWentWrong,
        message: message ?? AppStrings.somethingWentWrong,
      );

  bool get isSuccess => apiStatus == ApiStatus.success;

  @override
  String toString() {
    return 'ApiBaseResource('
        '"status": $apiStatus, '
        '"httpStatus": $httpStatus, '
        '"message": $message, '
        '"data": $data'
        ')';
  }
}
