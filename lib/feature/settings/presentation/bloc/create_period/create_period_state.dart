sealed class CreatePeriodState {}

final class CreatePeriodInitial extends CreatePeriodState {}

final class CreatePeriodLoading extends CreatePeriodState {}

final class CreatePeriodError extends CreatePeriodState {
  final String message;

  CreatePeriodError({required this.message});
}

final class CreatePeriodSuccess extends CreatePeriodState {}
