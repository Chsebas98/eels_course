import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository_firebase_impl.dart';
import 'package:san_chat/utils/form_validators.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final _authRepositoryFirebaseImpl = AuthRepositoryFirebaseImpl();
  LoginCubit() : super(LoginState());

  void onEmailChangedEvent(String mail) {
    emit(state.copyWith(email: mail));
  }

  void onPasswordChangedEvent(String password) {
    emit(state.copyWith(password: password));
  }

  void loginAccount() async {
    final (email, password) = (state.email, state.password);
    final response = await _authRepositoryFirebaseImpl.login(email, password);
    if (response != null) {
      emit(state.copyWith(isAuth: true));
    }
  }
}
