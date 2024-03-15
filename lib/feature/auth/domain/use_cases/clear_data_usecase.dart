import 'package:injectable/injectable.dart';

import '../repositories/iauth_repository.dart';

@injectable
class ClearDataUseCase {
  final IAuthRepository _authRepository;

  ClearDataUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<void> call() async {
    await _authRepository.clearData();
  }
}
