import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mini_login/helpers/form_validators.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<UsernameChangedEvent>(_onUsernameChangedEvent);
    on<PasswordChangedEvent>(_onPasswordChangedEvent);
    on<SubmittedLoginEvent>(_onSubmittedLoginEvent);
    on<ChangeVisibility>(_onChangeVisibility);
    on<LogoutEvent>(_onLogoutEvent);
  }

  void _onUsernameChangedEvent(
    UsernameChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(username: event.username));
  }

  void _onPasswordChangedEvent(
    PasswordChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _onChangeVisibility(ChangeVisibility event, Emitter<LoginState> emit) {
    emit(state.copyWith(isPswVisible: !state.isPswVisible));
  }

  void _onSubmittedLoginEvent(
    SubmittedLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 2));
    emit(LoginAuthenticated(username: state.username));
  }

  void _onLogoutEvent(LogoutEvent event, Emitter<LoginState> emit) {
    emit(LoginInitial());
  }
}
