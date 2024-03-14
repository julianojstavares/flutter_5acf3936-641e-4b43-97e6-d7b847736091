import '../../../../core/domain/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<void> signUp(UserEntity user);
}
