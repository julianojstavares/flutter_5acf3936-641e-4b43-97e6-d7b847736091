import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/entities/period_entity.dart';
import '../../../../core/domain/entities/user_entity.dart';

@injectable
class SettingsSourceHive {
  void createPeriod(PeriodEntity period) {
    final periodsDB = Hive.box<PeriodEntity>("periods");
    periodsDB.put(period.id, period);
  }

  List<PeriodEntity> returnUserPeriods(String userID) {
    final periodsDB = Hive.box<PeriodEntity>("periods");

    final periods = periodsDB.values
        .where(
          (period) => period.userID == userID,
        )
        .toList();

    return periods;
  }

  void updatePeriod(PeriodEntity period) {
    final periodsDB = Hive.box<PeriodEntity>("periods");
    periodsDB.put(period.id, period);
  }

  void deletePeriod(String periodID) {
    final periodsDB = Hive.box<PeriodEntity>("periods");
    periodsDB.delete(periodID);
  }

  void updateUser(UserEntity user) {
    final usersDB = Hive.box<UserEntity>("users");
    usersDB.put(user.id, user);
  }

  PeriodEntity? readOnePeriod(String periodID) {
    final periodsDB = Hive.box<PeriodEntity>("periods");
    final period = periodsDB.get(periodID);

    return period;
  }
}
