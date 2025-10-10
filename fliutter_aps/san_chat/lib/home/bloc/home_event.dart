part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetContactsEvent extends HomeEvent {}

class LogoutEvent extends HomeEvent {}
