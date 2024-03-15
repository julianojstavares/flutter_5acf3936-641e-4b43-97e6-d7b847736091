import 'package:frontend/core/domain/entities/user_entity.dart';
import 'package:frontend/feature/auth/data/datasources/auth_source_hive.dart';
import 'package:frontend/feature/auth/domain/repositories/iauth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final AuthSourceHive _hiveSource;

  AuthRepository({
    required AuthSourceHive hiveSource,
  }) : _hiveSource = hiveSource;

  @override
  Future<void> signUp(UserEntity user) async {
    _hiveSource.createUser(user);
  }

  @override
  Future<void> clearData() async {
    _hiveSource.clearData();
  }

  @override
  Future<UserEntity> signIn(String username, String password) async {
    return _hiveSource.returnUser(username, password);
  }
}
