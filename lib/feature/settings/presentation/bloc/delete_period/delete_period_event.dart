sealed class DeletePeriodEvent {}

final class PeriodDeleted extends DeletePeriodEvent {
  final String periodID;

  PeriodDeleted({required this.periodID});
}
