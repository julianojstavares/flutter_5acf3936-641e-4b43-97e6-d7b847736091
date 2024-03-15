sealed class CreatePeriodEvent {}

final class CreatePeriodSucceeded extends CreatePeriodEvent {
  final String userID;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final String category;
  final double goal1;
  final double goal2;

  CreatePeriodSucceeded({
    required this.userID,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.category,
    required this.goal1,
    required this.goal2,
  });
}
