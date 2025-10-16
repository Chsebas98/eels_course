part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetContactsEvent extends HomeEvent {}

class UpdateContactsEvent extends HomeEvent {
  final bool status;
  UpdateContactsEvent({required this.status});
}

class LogoutEvent extends HomeEvent {}
