import '../../../../../core/domain/entities/user_entity.dart';

sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninError extends SigninState {
  final String message;

  SigninError({required this.message});
}

final class SigninSuccess extends SigninState {
  final UserEntity user;

  SigninSuccess({required this.user});
}
