import 'package:flutter_bloc/flutter_bloc.dart';

class QuitCubit extends Cubit<String> {
  QuitCubit() : super("Giriş yaptınız");

  void logout() {
    emit("Çıkış yaptınız !");
  }
}
