import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

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
}
