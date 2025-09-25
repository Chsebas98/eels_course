part of 'login_bloc.dart';

class LoginState {
  final String username;
  final String password;
  final bool isPswVisible;

  ValidationFieldResult get isValidUsername =>
      FormValidators.isValidUsername(username);
  ValidationFieldResult get isValidPassword =>
      FormValidators.isValidPassword(password);

  const LoginState({
    this.username = '',
    this.password = '',
    this.isPswVisible = false,
  });

  LoginState copyWith({
    String? username,
    String? password,
    bool? isPswVisible,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isPswVisible: isPswVisible ?? this.isPswVisible,
    );
  }
}

final class LoginInitial extends LoginState {}

final class LoginAuthenticated extends LoginState {
  const LoginAuthenticated({super.username});
}
