import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/entities/period_entity.dart';
import '../../../../core/domain/entities/user_entity.dart';

@injectable
class AuthSourceHive {
  void createUser(UserEntity user) {
    final usersDB = Hive.box<UserEntity>("users");

    bool usernameExists = usersDB.values.any(
      (usr) => usr.username == user.username,
    );

    if (usernameExists) {
      throw Exception("Já existe um usuário com esse nome");
    }

    usersDB.put(user.id, user);
  }

  void clearData() {
    final usersDB = Hive.box<UserEntity>("users");
    usersDB.clear();

    final periodsDB = Hive.box<PeriodEntity>("periods");
    periodsDB.clear();
  }

  void validateInput(String username, String password) {
    final usersDB = Hive.box<UserEntity>("users");

    bool usernameExists = usersDB.values.any(
      (usr) => usr.username == username,
    );

    if (!usernameExists) throw Exception("Usuário não encontrado");

    final user = usersDB.values.singleWhere(
      (usr) => usr.username == username,
    );

    if (user.password != password) throw Exception("Senha inválida");
  }

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
}
