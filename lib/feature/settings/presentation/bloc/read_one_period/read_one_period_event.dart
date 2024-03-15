sealed class ReadOnePeriodEvent {}

final class OnePeriodReaded extends ReadOnePeriodEvent {
  final String userID;

  OnePeriodReaded({required this.userID});
}
