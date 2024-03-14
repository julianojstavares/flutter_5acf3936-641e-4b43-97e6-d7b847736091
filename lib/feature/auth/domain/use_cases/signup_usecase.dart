import 'package:frontend/core/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../repositories/iauth_repository.dart';

@injectable
class SignUpUseCase {
  final IAuthRepository _authRepository;

  SignUpUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<void> call({required UserEntity user}) async {
    await _authRepository.signUp(user);
  }
}
