sealed class DeletePeriodState {}

final class DeletePeriodInitial extends DeletePeriodState {}

final class DeletePeriodLoading extends DeletePeriodState {}

final class DeletePeriodError extends DeletePeriodState {
  final String message;

  DeletePeriodError({required this.message});
}

final class DeletePeriodSuccess extends DeletePeriodState {}
