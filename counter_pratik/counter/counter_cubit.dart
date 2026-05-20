import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  //  super(0) diyerek başlangıç değerini 0 olarak belirliyoruz.
  CounterCubit() : super(0);

  void artir() {
    emit(state + 1);
  }

  void azalt() {
    emit(state - 1);
  }
}
