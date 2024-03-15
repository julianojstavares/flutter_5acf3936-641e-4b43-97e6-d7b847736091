import 'package:hive/hive.dart';

part 'period_entity.g.dart';

@HiveType(typeId: 1)
class PeriodEntity extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String userID;

  @HiveField(2)
  String title;

  @HiveField(3)
  DateTime startDate;

  @HiveField(4)
  DateTime endDate;

  @HiveField(5)
  String category;

  @HiveField(6)
  double goal1;

  @HiveField(7)
  double goal2;

  PeriodEntity(this.id, this.userID, this.title, this.startDate, this.endDate,
      this.category, this.goal1, this.goal2);
}
