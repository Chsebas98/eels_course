import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_guide/packages/data/account/app/save_user.dart';
import 'package:route_guide/packages/data/account/domain/models/user_model.dart';
import 'package:route_guide/packages/data/account/domain/user/exceptions.dart';
import 'package:route_guide/packages/features/core/utility/input_converter.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final InputConverter _inputConverter;
  final SaveUser _saveUser;
  OnBoardingBloc(this._inputConverter, this._saveUser)
    : super(OnBoardingState()) {
    on<ChangeNameEvent>(_onChangeNameEvent);
    on<ChangeAgeEvent>(_onChangeAgeEvent);
    on<ChangeWeightEvent>(_onChangeWeightEvent);
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<NextButtonPressedEvent>(_onNextButtonPressedEvent);
  }
  FutureOr<void> _onChangeNameEvent(
    ChangeNameEvent event,
    Emitter<OnBoardingState> emit,
  ) {
    emit(state.copyWith(name: event.name));
  }

  FutureOr<void> _onChangeAgeEvent(
    ChangeAgeEvent event,
    Emitter<OnBoardingState> emit,
  ) {
    try {
      final age = _inputConverter.stringToUnsignedInteger(event.age);
      emit(state.copyWith(age: age, error: Object));
    } catch (e) {
      emit(state.copyWith(error: e, age: 0));
    }
  }

  FutureOr<void> _onChangeWeightEvent(
    ChangeWeightEvent event,
    Emitter<OnBoardingState> emit,
  ) {
    try {
      final weight = _inputConverter.stringToUnsignedDouble(event.weight);
      emit(state.copyWith(weight: weight, error: Object));
    } catch (e) {
      emit(state.copyWith(error: e, weight: 0));
    }
  }

  FutureOr<void> _onChangeEmailEvent(
    ChangeEmailEvent event,
    Emitter<OnBoardingState> emit,
  ) {
    final isValidEmail = _inputConverter.isValidEmail(event.email);
    if (isValidEmail) {
      emit(state.copyWith(email: event.email, error: Object));
    } else {
      emit(state.copyWith(error: const InvalidEmailException(), email: ''));
    }
  }

  FutureOr<void> _onNextButtonPressedEvent(
    NextButtonPressedEvent event,
    Emitter<OnBoardingState> emit,
  ) {
    final user = UserModel(
      name: state.name!,
      age: state.age!,
      weight: state.weight!,
      email: state.email!,
    );
    _saveUser(user);
  }
}
