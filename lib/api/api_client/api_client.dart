import 'package:dio/dio.dart';
import 'package:invesq/api/api_urls.dart';
import 'package:invesq/utils/constants.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../http_logging_interceptor.dart';
import '../models/api_base_response/api_base_response.dart';
import '../repositories/user_repository/model/request_model/login_request_model/login_request_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: null)
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options = BaseOptions(
      contentType: applicationJson,
      receiveTimeout: const Duration(milliseconds: 60000),
      connectTimeout: const Duration(milliseconds: 60000),
      baseUrl: ApiUrls.baseUrl,
    );
    dio.interceptors.add(HttpLoggingInterceptor(dio));
    return _ApiClient(dio);
  }

  @POST(ApiUrls.loginApi)
  Future<HttpResponse<ApiBaseResponse>> loginAPI({
    @Body(nullToAbsent: true) required LoginRequestModel loginRequestModel,
  });

  @GET(ApiUrls.leadsApi)
  Future<HttpResponse<ApiBaseResponse>> getLeadsAPI({
    @Query('per_page') required int perPage,
    @Query('page') required int page,
    @Query('sortBy') String? sortBy,
    @Query('sortDirection') String? sortDirection,
  });
}
