import 'package:bloc_ogreniyorum/auth/model/auth_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthModel> {
  AuthCubit() : super(AuthModel(email: "", isLoggedIn: false));

  void login(String userEmail) {
    emit(AuthModel(email: userEmail, isLoggedIn: true));
  }
}
