part of 'app_bloc.dart';

final class AppState extends Equatable {
  final bool userExists;

  const AppState({this.userExists = false});

  AppState copyWith({bool? userExists}) {
    return AppState(userExists: userExists ?? this.userExists);
  }

  @override
  List<Object> get props => [userExists];
}
