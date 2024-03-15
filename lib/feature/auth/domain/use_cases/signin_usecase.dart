import 'package:frontend/core/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../repositories/iauth_repository.dart';

@injectable
class SignInUseCase {
  final IAuthRepository _authRepository;

  SignInUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<UserEntity> call({
    required String username,
    required String password,
  }) async {
    return await _authRepository.signIn(username, password);
  }
}
