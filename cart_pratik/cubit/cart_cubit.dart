import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<int> {
  CartCubit() : super(0);

  // artır
  void increment() {
    emit(state + 1);
  }

  // azalt
  void decrement() {
    emit(state - 1);
  }
}
