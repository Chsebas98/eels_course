import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository_firebase_impl.dart';
import 'package:san_chat/utils/form_validators.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final _authRepositoryFirebaseImpl = AuthRepositoryFirebaseImpl();
  SignUpCubit() : super(SignUpState());

  void onNameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void onMailChanged(String mail) {
    emit(state.copyWith(mail: mail));
  }

  void onPasswordChanged(String pasword) {
    emit(state.copyWith(pasword: pasword));
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void createAccount() {
    final (name, email, password) = (state.name, state.mail, state.pasword);
    _authRepositoryFirebaseImpl.signUp(name, email, password);
  }
}
