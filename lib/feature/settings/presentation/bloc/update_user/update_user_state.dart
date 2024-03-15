sealed class UpdateUserState {}

final class UpdateUserInitial extends UpdateUserState {}

final class UpdateUserLoading extends UpdateUserState {}

final class UpdateUserError extends UpdateUserState {
  final String message;

  UpdateUserError({required this.message});
}

final class UpdateUserSuccess extends UpdateUserState {}