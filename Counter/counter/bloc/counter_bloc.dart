import 'package:bloc_practice/counter/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncremented>((event, emit) {
      emit(state + 1);
    });

    on<CounterDecremented>((event, emit) {
      emit(state - 1);

      if (state <= 0) {
        emit(0);
      }
    });
  }
}
/// şöylede tanımlanabilir refactoring için
/// 
/* 
  void azalt() {
    return on<CounterDecremented>((event, emit) {
    emit(state - 1);
  });
  }
*/