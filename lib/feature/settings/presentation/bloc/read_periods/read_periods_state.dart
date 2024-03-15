import '../../../../../core/domain/entities/period_entity.dart';

sealed class ReadPeriodsState {}

final class ReadPeriodLoading extends ReadPeriodsState {}

final class ReadPeriodError extends ReadPeriodsState {
  final String message;

  ReadPeriodError({required this.message});
}

final class ReadPeriodSuccess extends ReadPeriodsState {
  final List<PeriodEntity> periods;

  ReadPeriodSuccess({required this.periods});
}
