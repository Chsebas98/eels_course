import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_chat/app/core/models/models.dart';
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

  void createAccount() async {
    emit(state.copyWith(formSignUpStatus: Status.loading));
    final (name, email, password) = (state.name, state.mail, state.pasword);
    try {
      await _authRepositoryFirebaseImpl.signUp(name, email, password);
      emit(
        state.copyWith(
          formSignUpStatus: Status.success,
          showSnackbar: ToastInterface(
            showToast: true,
            title: 'Success',
            description: 'Your account has be succesfully created',
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint('Entra FirebaseAuthException');
      emit(
        state.copyWith(
          formSignUpStatus: Status.error,
          showSnackbar: ToastInterface(
            showToast: true,
            title: 'An error ocurred',
            description: e.message.toString(),
          ),
        ),
      );
    } catch (e) {
      debugPrint('Entra Exception');
      emit(
        state.copyWith(
          formSignUpStatus: Status.error,
          showSnackbar: ToastInterface(
            showToast: true,
            title: 'Something is wrong',
            description: e.toString(),
          ),
        ),
      );
    }
  }
}
