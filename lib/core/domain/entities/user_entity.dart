import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String username;

  @HiveField(2)
  String? nickname;

  @HiveField(3)
  String password;

  @HiveField(4)
  String? imgProfilePath;

  UserEntity(
    this.id,
    this.username,
    this.password, {
    this.nickname,
    this.imgProfilePath,
  });
}
