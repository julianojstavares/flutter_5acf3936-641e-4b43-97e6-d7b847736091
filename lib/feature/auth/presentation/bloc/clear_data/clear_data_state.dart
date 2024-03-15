sealed class ClearDataState {}

final class ClearDataInitial extends ClearDataState {}

final class ClearDataLoading extends ClearDataState {}

final class ClearDataError extends ClearDataState {
  final String message;

  ClearDataError({required this.message});
}

final class ClearDataSuccess extends ClearDataState {
  final String message;

  ClearDataSuccess({required this.message});
}
