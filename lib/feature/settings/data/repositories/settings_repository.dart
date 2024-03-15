import 'package:injectable/injectable.dart';

import '../../../../core/domain/entities/period_entity.dart';
import '../../../../core/domain/entities/user_entity.dart';
import '../../domain/repositories/isettings_repository.dart';
import '../datasources/settings_source_hive.dart';

@Injectable(as: ISettingsRepository)
class SettingsRepository implements ISettingsRepository {
  final SettingsSourceHive _hiveSource;

  SettingsRepository({
    required SettingsSourceHive hiveSource,
  }) : _hiveSource = hiveSource;

  @override
  Future<void> createPeriod(PeriodEntity period) async {
    _hiveSource.createPeriod(period);
  }

  @override
  Future<void> deletePeriod(String periodID) async {
    _hiveSource.deletePeriod(periodID);
  }

  @override
  Future<List<PeriodEntity>> readPeriods(String userID) async {
    return _hiveSource.returnUserPeriods(userID);
  }

  @override
  Future<void> updatePeriod(PeriodEntity period) async {
    _hiveSource.updatePeriod(period);
  }

  @override
  Future<void> updateUser(UserEntity userUpdated) async {
    _hiveSource.updateUser(userUpdated);
  }
  
  @override
  Future<PeriodEntity> readOnePeriod(String userID) {
    throw UnimplementedError();
  }
}
