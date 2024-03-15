sealed class UpdatePeriodState {}

final class UpdatePeriodInitial extends UpdatePeriodState {}

final class UpdatePeriodLoading extends UpdatePeriodState {}

final class UpdatePeriodError extends UpdatePeriodState {
  final String message;

  UpdatePeriodError({required this.message});
}

final class UpdatePeriodSuccess extends UpdatePeriodState {}