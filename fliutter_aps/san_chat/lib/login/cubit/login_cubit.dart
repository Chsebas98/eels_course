import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_chat/utils/form_validators.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void onEmailChangedEvent(String mail) {
    emit(state.copyWith(email: mail));
  }

  void onPasswordChangedEvent(String password) {
    emit(state.copyWith(password: password));
  }

  void loginAccount() {}
}
