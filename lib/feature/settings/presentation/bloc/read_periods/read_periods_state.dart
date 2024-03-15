import '../../../../../core/domain/entities/period_entity.dart';

sealed class ReadPeriodsState {}

final class ReadPeriodsLoading extends ReadPeriodsState {}

final class ReadPeriodsError extends ReadPeriodsState {
  final String message;

  ReadPeriodsError({required this.message});
}

final class ReadPeriodsSuccess extends ReadPeriodsState {
  final List<PeriodEntity> periods;

  ReadPeriodsSuccess({required this.periods});
}
