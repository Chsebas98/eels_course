part of 'app_bloc.dart';

final class AppState extends Equatable {
  final bool userExists;
  final bool loading;

  const AppState({this.userExists = false, this.loading = true});

  AppState copyWith({bool? userExists, bool? loading}) {
    return AppState(
      userExists: userExists ?? this.userExists,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => [userExists, loading];
}
