import 'package:frontend/core/domain/entities/period_entity.dart';
import 'package:injectable/injectable.dart';

import '../repositories/isettings_repository.dart';

@injectable
class UpdatePeriodUseCase {
  final ISettingsRepository _iSettingsRepository;

  UpdatePeriodUseCase({
    required ISettingsRepository iSettingsRepository,
  }) : _iSettingsRepository = iSettingsRepository;

  Future<void> call({required PeriodEntity periodUpdated})  async {
    await _iSettingsRepository.updatePeriod(periodUpdated);
  }
}
