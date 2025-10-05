part of 'login_cubit.dart';

class LoginState {
  final String email;
  final String password;
  final bool isAuth;

  ValidationFieldResult get isValidMail => FormValidators.validateEmail(email);
  ValidationFieldResult get isValidPassword =>
      FormValidators.validatePassword(password);

  const LoginState({this.email = '', this.password = '', this.isAuth = false});

  LoginState copyWith({String? email, String? password, bool? isAuth}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isAuth: isAuth ?? this.isAuth,
    );
  }
}
