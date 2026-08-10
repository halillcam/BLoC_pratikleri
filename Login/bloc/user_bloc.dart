import 'package:bloc_practice/login/bloc/login_event.dart';
import 'package:bloc_practice/login/bloc/login_state.dart';
import 'package:bloc_practice/login/data/user_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<LoginEvent, LoginState> {
  final UserData _user = UserData();
  UserBloc() : super(LoginState.initial) {
    on<UserLogin>((event, emit) {
      emit(LoginState.loading);
      for (int i = 0; i < _user.users.length; i++) {
        if (event.username == _user.users[i].username &&
            event.password == _user.users[i].password) {
          emit(LoginState.success);
          return;
        }
      }
      emit(LoginState.notFound);
    });
  }
}
