import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState());

  void incrementValue() {
    final newValue = state.value + 1;
    emit(state.copyWith(value: newValue));
  }

  void decrementValue() {
    final newValue = state.value - 1;
    emit(state.copyWith(value: newValue));
  }
}
