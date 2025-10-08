part of 'auth_bloc.dart';

sealed class AuthEvent {}

//evento si existe un user logueado
class CheckUserLoggedEvent extends AuthEvent {}
