part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class EmailAddressEvent extends LoginEvent {
  const EmailAddressEvent({required this.emailAddress});

  final String emailAddress;
}

class PasswordEvent extends LoginEvent {
  const PasswordEvent({required this.password});

  final String password;
}

class IsShowPasswordEvent extends LoginEvent {
  const IsShowPasswordEvent();
}

class OnClickLoginEvent extends LoginEvent {
  const OnClickLoginEvent();
}

class LoginResponseApiBaseResourceEvent extends LoginEvent {
  const LoginResponseApiBaseResourceEvent({required this.apiBaseResource});

  final ApiBaseResource apiBaseResource;
}
