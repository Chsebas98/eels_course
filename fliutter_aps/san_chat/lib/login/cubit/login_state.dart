part of 'login_cubit.dart';

class LoginState {
  final String email;
  final String password;

  ValidationFieldResult get isValidMail => FormValidators.validateEmail(email);
  ValidationFieldResult get isValidPassword =>
      FormValidators.validatePassword(password);

  const LoginState({this.email = '', this.password = ''});

  LoginState copyWith({String? email = '', String? password = ''}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
