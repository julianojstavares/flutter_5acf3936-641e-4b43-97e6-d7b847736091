import '../../../../core/domain/entities/period_entity.dart';
import '../../../../core/domain/entities/user_entity.dart';

abstract class ISettingsRepository {
  Future<void> createPeriod(PeriodEntity period);
  Future<List<PeriodEntity>> readPeriods(String userID);
  Future<PeriodEntity> readOnePeriod(String userID);
  Future<void> updatePeriod(PeriodEntity period);
  Future<void> deletePeriod(String periodID);
  Future<void> updateUser(UserEntity userUpdated);
}
