part of 'home_bloc.dart';

class HomeState {
  final List<Contact> listaContactos;

  const HomeState({this.listaContactos = const []});

  HomeState copyWith({List<Contact>? listaContactos}) {
    return HomeState(listaContactos: listaContactos ?? this.listaContactos);
  }
}
