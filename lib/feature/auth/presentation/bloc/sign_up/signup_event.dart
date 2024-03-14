sealed class SignupEvent {}

final class SignUpUserCreated extends SignupEvent {
  final String username;
  final String email;
  final String password;

  SignUpUserCreated({
    required this.username,
    required this.email,
    required this.password,
  });
}

final class SignUpRetried extends SignupEvent {}
