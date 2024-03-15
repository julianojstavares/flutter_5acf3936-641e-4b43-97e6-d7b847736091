import 'package:frontend/core/domain/entities/period_entity.dart';

sealed class UpdatePeriodEvent {}

final class PeriodUpdated extends UpdatePeriodEvent {
  final PeriodEntity periodUpdated;

  PeriodUpdated({required this.periodUpdated});

}