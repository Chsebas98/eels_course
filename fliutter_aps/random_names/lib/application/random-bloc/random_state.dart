part of 'random_bloc.dart';

class RandomState {
  final String name;
  final int counterValue;

  const RandomState({this.name = 'no-name', this.counterValue = 0});

  RandomState copyWith({String? name, int? counterValue}) {
    return RandomState(
      name: name ?? this.name,
      counterValue: counterValue ?? this.counterValue,
    );
  }
}
