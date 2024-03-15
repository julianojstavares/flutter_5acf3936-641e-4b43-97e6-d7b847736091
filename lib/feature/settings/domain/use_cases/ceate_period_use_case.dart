
import 'package:injectable/injectable.dart';

import '../../../../core/domain/entities/period_entity.dart';
import '../repositories/isettings_repository.dart';

@injectable
class CreatePeriodUseCase {
  final ISettingsRepository _iSettingsRepository;

  CreatePeriodUseCase({
    required ISettingsRepository iSettingsRepository,
  }) : _iSettingsRepository = iSettingsRepository;

  Future<void> call({required PeriodEntity period}) async {
    await _iSettingsRepository.createPeriod(period);
  }
}
