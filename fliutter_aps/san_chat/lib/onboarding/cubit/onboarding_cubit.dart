import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:san_chat/app/core/models/models.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository_firebase_impl.dart';

class OnboardingCubit extends Cubit<Status> {
  OnboardingCubit() : super((Status.initial));

  final _authRepository = AuthRepositoryFirebaseImpl();

  void signInWithGoogle() async {
    emit(Status.loading);
    try {
      await _authRepository.sigInWithGoogle();
      emit(Status.success);
    } on GoogleSignInException catch (error) {
      debugPrint(error.toString());
      emit(Status.error);
    } catch (e) {
      emit(Status.error);
    }
  }
}
