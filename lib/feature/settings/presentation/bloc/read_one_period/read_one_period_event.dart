sealed class ReadOnePeriodEvent {}

final class OnePeriodReaded extends ReadOnePeriodEvent {
  final String periodID;

  OnePeriodReaded({required this.periodID});
}
