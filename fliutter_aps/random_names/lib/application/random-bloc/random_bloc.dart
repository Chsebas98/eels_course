import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_names/data/random_names.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  RandomBloc() : super(RandomState()) {
    on<GenerateRandomNameEvent>(_onGenerateRandomNameEvent);
    on<ChangeCounterValueEvent>(_onChangeCounterValueEvent);
  }

  void _onGenerateRandomNameEvent(
    GenerateRandomNameEvent event,
    Emitter<RandomState> emit,
  ) {
    final int randomNumber = DateTime.now().millisecondsSinceEpoch % 30;
    debugPrint('randomNumber :$randomNumber');
    emit(state.copyWith(name: randomNames[randomNumber]));
  }

  void _onChangeCounterValueEvent(
    ChangeCounterValueEvent event,
    Emitter<RandomState> emit,
  ) {
    debugPrint("Value ${state.counterValue}");
    if (state.counterValue > 14) {
      debugPrint("Entra");
      emit(state.copyWith(counterValue: 0));
    } else {
      emit(state.copyWith(counterValue: state.counterValue + 1));
    }
  }
}
