sealed class ReadPeriodsEvent {}

final class PeriodsReaded extends ReadPeriodsEvent {
  final String userID;

  PeriodsReaded({required this.userID});
}
