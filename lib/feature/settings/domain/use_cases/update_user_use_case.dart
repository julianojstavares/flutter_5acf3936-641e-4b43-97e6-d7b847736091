import 'package:injectable/injectable.dart';

import '../../../../core/domain/entities/user_entity.dart';
import '../repositories/isettings_repository.dart';

@injectable
class UpdateUserUseCase {
  final ISettingsRepository _iSettingsRepository;

  UpdateUserUseCase({
    required ISettingsRepository iSettingsRepository,
  }) : _iSettingsRepository = iSettingsRepository;

  Future<void> call({required UserEntity userUpdated}) async {
    await _iSettingsRepository.updateUser(userUpdated);
  }
}
