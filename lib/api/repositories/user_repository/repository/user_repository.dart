import 'dart:async';

import '../../../models/api_base_resource/api_base_resource.dart';
import '../../base_repository.dart';
import '../model/request_model/login_request_model/login_request_model.dart';
import '../model/response_model/login_response_model/login_response_model.dart';

class UserRepository extends BaseRepository {
  final _loginApiStreamController = StreamController<ApiBaseResource>();

  Stream<ApiBaseResource> get loginApiStream async* {
    yield* _loginApiStreamController.stream;
  }

  Future<void> login({required LoginRequestModel loginRequestModel}) async {
    _loginApiStreamController.add(ApiBaseResource.loading());

    try {
      final response = await apiClient.loginAPI(
        loginRequestModel: loginRequestModel,
      );

      // raw response from base
      final rawData = response.data.data as Map<String, dynamic>;

      final loginResponse = LoginResponseModel.fromJson(rawData);

      _loginApiStreamController.add(
        ApiBaseResource.success(
          loginResponse.user,
          response.data.message ?? "Login successful",
          accessToken: loginResponse.accessToken,
          tokenType: loginResponse.tokenType,
        ),
      );
    } catch (onError) {
      baseErrorResponse(onError, _loginApiStreamController);
    }
  }
}
