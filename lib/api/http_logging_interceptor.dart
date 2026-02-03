import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:invesq/utils/common_function_utils.dart';

import '../utils/logger_utils.dart';

class HttpLoggingInterceptor extends Interceptor {
  final Dio diot;

  HttpLoggingInterceptor(this.diot);

  final Dio retryDio = Dio();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers = (await CommonFunctionUtils.getHeaders()).toJson();

    LoggerUtils().getLogger.i(
      "➡️ REQUEST: ${options.method} ${options.uri}\n"
      "Headers: ${jsonEncode(options.headers)}\n"
      "Query: ${options.queryParameters}\n"
      "Body: ${options.data}",
    );

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LoggerUtils().getLogger.i(
      "✅ RESPONSE: ${response.statusCode} ${response.requestOptions.uri}\n"
      "Data: ${jsonEncode(response.data)}",
    );

    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    LoggerUtils().getLogger.e(
      "❌ ERROR: ${err.requestOptions.method} ${err.requestOptions.uri}\n"
      "Message: ${err.message}\n"
      "Response: ${err.response?.statusCode == 401}",
    );

    // // ✅ Handle ONLY 401
    // if (err.response?.statusCode == 401) {
    //   try {
    //     // 🔁 Refresh token (queued & safe)
    //     await TokenManager.refreshToken();
    //
    //     final newAccessToken = await GetStorageUtils.getString(
    //       kAuthorizationToken,
    //       '',
    //     );
    //
    //     // 🔁 Clone request safely
    //     final RequestOptions options = err.requestOptions;
    //
    //     options.headers['Authorization'] = 'Bearer $newAccessToken';
    //
    //     // 🔁 Retry using CLEAN Dio (NO interceptors)
    //     final retryDio = Dio();
    //     final response = await retryDio.fetch(options);
    //
    //     return handler.resolve(response);
    //   } catch (e) {
    //     // ❌ Refresh failed → logout flow
    //     return handler.next(err);
    //   }
    // }

    handler.next(err);
  }
}
