part of 'login_bloc.dart';

class LoginState extends Equatable with FormzMixin {
  const LoginState({
    this.emailAddress = const EmailAddress.pure(''),
    this.password = const Password.pure(''),
    this.isShowPassword = false,
    this.apiStatus,
  });

  final EmailAddress emailAddress;
  final Password password;
  final bool isShowPassword;
  final ApiStatus? apiStatus;

  LoginState copyWith({
    EmailAddress? emailAddress,
    Password? password,
    bool? isShowPassword,
    ApiStatus? apiStatus,
  }) {
    return LoginState(
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [
    emailAddress,
    password,
    isShowPassword,
    apiStatus,
  ];

  @override
  List<FormzInput> get inputs => [emailAddress, password];
}
