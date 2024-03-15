// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../feature/auth/data/datasources/auth_source_hive.dart' as _i3;
import '../../feature/auth/data/repositories/auth_repository.dart' as _i5;
import '../../feature/auth/domain/repositories/iauth_repository.dart' as _i4;
import '../../feature/auth/domain/use_cases/clear_data_usecase.dart' as _i9;
import '../../feature/auth/domain/use_cases/signin_usecase.dart' as _i7;
import '../../feature/auth/domain/use_cases/signup_usecase.dart' as _i8;
import '../../feature/auth/presentation/bloc/clear_data/clear_data_bloc.dart'
    as _i17;
import '../../feature/auth/presentation/bloc/sign_in/signup_bloc.dart' as _i13;
import '../../feature/auth/presentation/bloc/sign_up/signup_bloc.dart' as _i14;
import '../../feature/settings/data/datasources/settings_source_hive.dart'
    as _i6;
import '../../feature/settings/data/repositories/settings_repository.dart'
    as _i11;
import '../../feature/settings/domain/repositories/isettings_repository.dart'
    as _i10;
import '../../feature/settings/domain/use_cases/ceate_period_use_case.dart'
    as _i18;
import '../../feature/settings/domain/use_cases/delete_period_use_case.dart'
    as _i19;
import '../../feature/settings/domain/use_cases/read_periods_use_case.dart'
    as _i12;
import '../../feature/settings/domain/use_cases/update_period_use_case.dart'
    as _i15;
import '../../feature/settings/domain/use_cases/update_user_use_case.dart'
    as _i16;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthSourceHive>(() => _i3.AuthSourceHive());
    gh.factory<_i4.IAuthRepository>(
        () => _i5.AuthRepository(hiveSource: gh<_i3.AuthSourceHive>()));
    gh.factory<_i6.SettingsSourceHive>(() => _i6.SettingsSourceHive());
    gh.factory<_i7.SignInUseCase>(
        () => _i7.SignInUseCase(authRepository: gh<_i4.IAuthRepository>()));
    gh.factory<_i8.SignUpUseCase>(
        () => _i8.SignUpUseCase(authRepository: gh<_i4.IAuthRepository>()));
    gh.factory<_i9.ClearDataUseCase>(
        () => _i9.ClearDataUseCase(authRepository: gh<_i4.IAuthRepository>()));
    gh.factory<_i10.ISettingsRepository>(() =>
        _i11.SettingsRepository(hiveSource: gh<_i6.SettingsSourceHive>()));
    gh.factory<_i12.ReadPeriodsUseCase>(() => _i12.ReadPeriodsUseCase(
        iSettingsRepository: gh<_i10.ISettingsRepository>()));
    gh.lazySingleton<_i13.SignInBloc>(
        () => _i13.SignInBloc(signInUseCase: gh<_i7.SignInUseCase>()));
    gh.lazySingleton<_i14.SignUpBloc>(
        () => _i14.SignUpBloc(signUpUseCase: gh<_i8.SignUpUseCase>()));
    gh.factory<_i15.UpdatePeriodUseCase>(() => _i15.UpdatePeriodUseCase(
        iSettingsRepository: gh<_i10.ISettingsRepository>()));
    gh.factory<_i16.UpdateUserUseCase>(() => _i16.UpdateUserUseCase(
        iSettingsRepository: gh<_i10.ISettingsRepository>()));
    gh.lazySingleton<_i17.ClearDataBloc>(
        () => _i17.ClearDataBloc(clearDataUseCase: gh<_i9.ClearDataUseCase>()));
    gh.factory<_i18.CreatePeriodUseCase>(() => _i18.CreatePeriodUseCase(
        iSettingsRepository: gh<_i10.ISettingsRepository>()));
    gh.factory<_i19.DeletePeriodUseCase>(() => _i19.DeletePeriodUseCase(
        settingsRepository: gh<_i10.ISettingsRepository>()));
    return this;
  }
}
