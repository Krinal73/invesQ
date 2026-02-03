import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

import '../../utils/enum_utils.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/string_utils.dart';
import '../api_client/api_client.dart';
import '../models/api_base_resource/api_base_resource.dart';
import '../models/api_base_response/api_base_response.dart';

abstract class BaseRepository {
  ApiClient apiClient = ApiClient(Dio());

  Future<void> baseResponse(
    HttpResponse<ApiBaseResponse> httpResponse,
    StreamController controller,
  ) async {
    switch (httpResponse.response.statusCode) {
      case 200:
        controller.add(
          ApiBaseResource.success(
            httpResponse.data.data, // can be Map OR List
            httpResponse.data.message ?? "Success",
          ),
        );
        break;

      default:
        controller.add(
          ApiBaseResource.somethingWentWrong(
            message: httpResponse.data.message,
          ),
        );
        break;
    }
  }

  baseErrorResponse(dynamic onError, StreamController controller) {
    switch ((onError as DioException).type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
        controller.add(ApiBaseResource.unknown());
        SnackBarUtils.showSnackBar(
          message: AppStrings.noInternetConnection,
          type: SnackBarType.error,
        );
        break;
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        if (onError.message != null) {
          controller.add(ApiBaseResource.error(onError.message.toString()));
        } else {
          controller.add(ApiBaseResource.unknown());
          SnackBarUtils.showSnackBar(
            message: AppStrings.noInternetConnection,
            type: SnackBarType.error,
          );
        }
        break;
      case DioExceptionType.badResponse:
        final response = onError.response;
        switch (response?.statusCode) {
          case 401:
            final apiBaseResponse = ApiBaseResponse.fromJson(response?.data);
            controller.add(
              ApiBaseResource.unauthorizedAccess(
                apiBaseResponse.message.toString(),
              ),
            );
            if (apiBaseResponse.message != null) {
              SnackBarUtils.showSnackBar(
                type: SnackBarType.error,
                message: apiBaseResponse.message,
              );
            }
            break;
          case 403:
            final apiBaseResponse = ApiBaseResponse.fromJson(response?.data);
            controller.add(
              ApiBaseResource.unauthorizedAccess(
                apiBaseResponse.message.toString(),
              ),
            );
            if (apiBaseResponse.message != null) {
              SnackBarUtils.showSnackBar(
                type: SnackBarType.error,
                message: apiBaseResponse.message,
              );
            }
            break;
          case 426:
            controller.add(ApiBaseResource.updateApp());
            break;
          case 500:
            controller.add(ApiBaseResource.error("Server error."));
            SnackBarUtils.showSnackBar(
              type: SnackBarType.error,
              message: "Server error.",
            );

          default:
            final apiBaseResponse = ApiBaseResponse.fromJson(response?.data);
            controller.add(
              ApiBaseResource.somethingWentWrong(
                message: apiBaseResponse.message.toString(),
              ),
            );
            if (apiBaseResponse.message != null) {
              SnackBarUtils.showSnackBar(
                type: SnackBarType.error,
                message: apiBaseResponse.message,
              );
            }
            break;
        }
        break;
    }
  }
}
