part of 'random_bloc.dart';

@immutable
sealed class RandomEvent {}

class GenerateRandomNameEvent extends RandomEvent {}

class ChangeCounterValueEvent extends RandomEvent {}
