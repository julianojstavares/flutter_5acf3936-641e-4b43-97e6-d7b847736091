sealed class SigninEvent {}

final class SignInSucceeded extends SigninEvent {
  final String username;
  final String password;

  SignInSucceeded({
    required this.username,
    required this.password,
  });
}

final class SignInRetried extends SigninEvent {}
