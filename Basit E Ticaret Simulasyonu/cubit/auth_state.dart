class AuthState {
  final AuthStatus status;
  final String? username;
  final String? errorMessage;

  AuthState({required this.status, required this.username, required this.errorMessage});
}

enum AuthStatus { initial, isLoggedIn, failed, isLoggedOut }
