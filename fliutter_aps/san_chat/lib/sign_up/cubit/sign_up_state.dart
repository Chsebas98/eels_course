part of 'sign_up_cubit.dart';

class SignUpState {
  final String name;
  final String mail;
  final String pasword;
  final String confirmPassword;

  ValidationFieldResult get isValidName => FormValidators.validateName(name);
  ValidationFieldResult get isValidMail => FormValidators.validateEmail(mail);
  ValidationFieldResult get isValidPassword =>
      FormValidators.validateValidPassword(pasword);

  const SignUpState({
    this.name = '',
    this.mail = '',
    this.pasword = '',
    this.confirmPassword = '',
  });

  SignUpState copyWith({
    String? name,
    String? mail,
    String? pasword,
    String? confirmPassword,
  }) {
    return SignUpState(
      name: name ?? this.name,
      mail: mail ?? this.mail,
      pasword: pasword ?? this.pasword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
