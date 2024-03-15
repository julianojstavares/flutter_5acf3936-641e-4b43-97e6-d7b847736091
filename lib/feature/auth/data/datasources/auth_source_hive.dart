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

  UserEntity returnUser(String username, String password) {
    final usersDB = Hive.box<UserEntity>("users");

    bool usernameExists = usersDB.values.any(
      (usr) => usr.username == username,
    );

    if (!usernameExists) throw Exception("Usuário não encontrado");

    final user = usersDB.values.singleWhere(
      (usr) => usr.username == username,
    );

    if (user.password != password) throw Exception("Senha inválida");

    return user;
  }
}
