part of 'on_boarding_bloc.dart';

sealed class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();

  @override
  List<Object> get props => [];
}

final class ChangeNameEvent extends OnBoardingEvent {
  final String name;
  const ChangeNameEvent(this.name);
  @override
  List<Object> get props => [name];
}

final class ChangeAgeEvent extends OnBoardingEvent {
  final String age;
  const ChangeAgeEvent(this.age);

  @override
  List<Object> get props => [age];
}

final class ChangeWeightEvent extends OnBoardingEvent {
  final String weight;
  const ChangeWeightEvent(this.weight);

  @override
  List<Object> get props => [weight];
}

final class ChangeEmailEvent extends OnBoardingEvent {
  final String email;
  const ChangeEmailEvent(this.email);

  @override
  List<Object> get props => [email];
}

final class NextButtonPressedEvent extends OnBoardingEvent {
  const NextButtonPressedEvent();
}
