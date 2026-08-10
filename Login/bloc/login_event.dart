abstract class LoginEvent {}

class UserLogin extends LoginEvent {
  String username;
  String password;
  UserLogin({required this.username, required this.password});
}
