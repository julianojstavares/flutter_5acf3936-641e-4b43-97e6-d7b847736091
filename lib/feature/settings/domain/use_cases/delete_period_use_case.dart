import 'package:injectable/injectable.dart';

import '../repositories/isettings_repository.dart';

@injectable
class DeletePeriodUseCase {
  final ISettingsRepository _settingsRepository;

  DeletePeriodUseCase({
    required ISettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  Future<void> call({required String periodID}) async {
    await _settingsRepository.deletePeriod(periodID);
  }
}
