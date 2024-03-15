import '../../../../../core/domain/entities/period_entity.dart';

sealed class ReadOnePeriodState {}

final class ReadOnePeriodLoading extends ReadOnePeriodState {}

final class ReadOnePeriodError extends ReadOnePeriodState {
  final String message;

  ReadOnePeriodError({required this.message});
}

final class ReadOnePeriodSuccess extends ReadOnePeriodState {
  final PeriodEntity period;

  ReadOnePeriodSuccess({required this.period});
}
