import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:invesq/ui/base_screen/view/base_screen.dart';

import '../../../../api/models/api_base_resource/api_base_resource.dart';
import '../../../../api/repositories/user_repository/model/request_model/login_request_model/login_request_model.dart';
import '../../../../api/repositories/user_repository/model/response_model/user_response_model/user_response_model.dart';
import '../../../../api/repositories/user_repository/repository/user_repository.dart';
import '../../../utils/common_function_utils.dart';
import '../../../utils/enum_utils.dart';
import '../../../utils/get_storage_utils.dart';
import '../../../utils/snackbar_utils.dart';
import '../model/email.dart';
import '../model/password.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEvent>(_mapEventToState);

    _userRepository = UserRepository();

    _loginApiStreamSubscription = _userRepository.loginApiStream.listen((
      event,
    ) {
      add(LoginResponseApiBaseResourceEvent(apiBaseResource: event));
    });
  }

  late UserRepository _userRepository;
  late StreamSubscription _loginApiStreamSubscription;

  void _mapEventToState(LoginEvent event, Emitter<LoginState> emit) {
    if (event is EmailAddressEvent) {
      return _mapEmailAddressEventToState(event, emit);
    } else if (event is PasswordEvent) {
      return _mapPasswordEventToState(event, emit);
    } else if (event is IsShowPasswordEvent) {
      return _mapIsShowPasswordEventToState(event, emit);
    } else if (event is OnClickLoginEvent) {
      return _mapOnClickLoginEventToState(event, emit);
    } else if (event is LoginResponseApiBaseResourceEvent) {
      return _mapLoginResponseApiBaseResourceEventToState(event, emit);
    }
  }

  @override
  Future<void> close() {
    _loginApiStreamSubscription.cancel();
    return super.close();
  }

  void _mapEmailAddressEventToState(
    EmailAddressEvent event,
    Emitter<LoginState> emit,
  ) {
    final emailAddress = EmailAddress.dirty(value: event.emailAddress);
    emit(state.copyWith(emailAddress: emailAddress));
  }

  void _mapPasswordEventToState(PasswordEvent event, Emitter<LoginState> emit) {
    final password = Password.dirty(value: event.password);
    emit(state.copyWith(password: password));
  }

  void _mapIsShowPasswordEventToState(
    IsShowPasswordEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isShowPassword: !state.isShowPassword));
  }

  void _mapOnClickLoginEventToState(
    OnClickLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    await CommonFunctionUtils.hideKeyboard().then((value) {
      final loginRequestModel = LoginRequestModel(
        email: state.emailAddress.value,
        password: state.password.value,
      );
      _userRepository.login(loginRequestModel: loginRequestModel);
    });
  }

  void _mapLoginResponseApiBaseResourceEventToState(
    LoginResponseApiBaseResourceEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(apiStatus: event.apiBaseResource.apiStatus));

    print("API Response ${event.apiBaseResource}");
    if (event.apiBaseResource.apiStatus == ApiStatus.success) {
      if (event.apiBaseResource.data != null) {
        print("Access Token :${event.apiBaseResource.accessToken}");

        // data is already UserResponseModel
        final userResponseModel =
            event.apiBaseResource.data as UserResponseModel;

        GetStorageUtils.setString(
          kAuthorizationToken,
          event.apiBaseResource.accessToken!,
        );
        GetStorageUtils.setString(
          kUserResponseModel,
          jsonEncode(userResponseModel),
        );

        Get.toNamed(BaseScreen.route);
      }
    } else if (event.apiBaseResource.apiStatus == ApiStatus.error) {
      SnackBarUtils.showSnackBar(
        type: SnackBarType.error,
        message: event.apiBaseResource.message,
      );
    }
  }
}
