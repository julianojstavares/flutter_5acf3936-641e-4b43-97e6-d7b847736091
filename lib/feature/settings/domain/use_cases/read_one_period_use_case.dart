import 'package:injectable/injectable.dart';

import '../../../../core/domain/entities/period_entity.dart';
import '../repositories/isettings_repository.dart';

@injectable
class ReadOnePeriodUseCase {
  final ISettingsRepository _iSettingsRepository;

  ReadOnePeriodUseCase({
    required ISettingsRepository iSettingsRepository,
  }) : _iSettingsRepository = iSettingsRepository;

  Future<PeriodEntity?> call({required String periodID}) async {
    return await _iSettingsRepository.readOnePeriod(periodID);
  }
}
