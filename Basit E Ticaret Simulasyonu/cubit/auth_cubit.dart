import 'package:bloc_practice/E%20Ticaret%20Demo/cubit/auth_state.dart';
import 'package:bloc_practice/E%20Ticaret%20Demo/data/user_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(status: AuthStatus.initial, username: "", errorMessage: ""));

  void login(String username, String password) {
    // check
    bool isAuth = authCheck(username, password);
    if (isAuth == true) {
      emit(AuthState(status: AuthStatus.isLoggedIn, username: username, errorMessage: null));
    } else {
      emit(
        AuthState(
          status: AuthStatus.failed,
          username: null,
          errorMessage: "Kullanıcı adı veya şifre hatalı",
        ),
      );
    }
  }

  bool authCheck(String username, String password) {
    final UserData _user = UserData();
    for (int i = 0; i < _user.users.length; i++) {
      if (username == _user.users[i].username && password == _user.users[i].password) {
        return true;
      }
    }
    return false;
  }
}
