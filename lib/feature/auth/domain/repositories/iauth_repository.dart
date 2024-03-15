import '../../../../core/domain/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<void> signUp(UserEntity user);
  Future<void> clearData();
  Future<void> signIn(String username, String password);
}
