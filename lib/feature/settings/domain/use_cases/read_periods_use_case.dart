import 'package:injectable/injectable.dart';

import '../../../../core/domain/entities/period_entity.dart';
import '../repositories/isettings_repository.dart';

@injectable
class ReadPeriodsUseCase {
  final ISettingsRepository _iSettingsRepository;

  ReadPeriodsUseCase({
    required ISettingsRepository iSettingsRepository,
  }) : _iSettingsRepository = iSettingsRepository;

  Future<List<PeriodEntity>> call({required String userID}) async {
    return await _iSettingsRepository.readPeriods(userID);
  }
}
