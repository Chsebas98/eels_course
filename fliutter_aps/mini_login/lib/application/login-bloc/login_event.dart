part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class UsernameChangedEvent extends LoginEvent {
  final String username;
  UsernameChangedEvent({required this.username});
}

class PasswordChangedEvent extends LoginEvent {
  final String password;
  PasswordChangedEvent({required this.password});
}

class SubmittedLoginEvent extends LoginEvent {
  final String username;

  SubmittedLoginEvent({required this.username});
}

class ChangeVisibility extends LoginEvent {}

class LogoutEvent extends LoginEvent {}
