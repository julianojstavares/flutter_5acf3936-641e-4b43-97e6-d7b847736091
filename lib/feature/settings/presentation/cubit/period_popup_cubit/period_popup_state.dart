import 'package:frontend/core/domain/entities/period_entity.dart';

sealed class PeriodPopUpState {}

final class CreatePeriodPopUpState extends PeriodPopUpState {}

final class EditPeriodPopUpState extends PeriodPopUpState {
  final PeriodEntity? period;

  EditPeriodPopUpState({required this.period});
}
