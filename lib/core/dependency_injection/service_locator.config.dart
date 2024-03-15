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
import '../../feature/auth/domain/use_cases/clear_data_usecase.dart' as _i8;
import '../../feature/auth/domain/use_cases/signin_usecase.dart' as _i6;
import '../../feature/auth/domain/use_cases/signup_usecase.dart' as _i7;
import '../../feature/auth/presentation/bloc/clear_data/clear_data_bloc.dart'
    as _i11;
import '../../feature/auth/presentation/bloc/sign_in/signup_bloc.dart' as _i9;
import '../../feature/auth/presentation/bloc/sign_up/signup_bloc.dart' as _i10;

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
    gh.factory<_i6.SignInUseCase>(
        () => _i6.SignInUseCase(authRepository: gh<_i4.IAuthRepository>()));
    gh.factory<_i7.SignUpUseCase>(
        () => _i7.SignUpUseCase(authRepository: gh<_i4.IAuthRepository>()));
    gh.factory<_i8.ClearDataUseCase>(
        () => _i8.ClearDataUseCase(authRepository: gh<_i4.IAuthRepository>()));
    gh.lazySingleton<_i9.SignInBloc>(
        () => _i9.SignInBloc(signInUseCase: gh<_i6.SignInUseCase>()));
    gh.lazySingleton<_i10.SignUpBloc>(
        () => _i10.SignUpBloc(signUpUseCase: gh<_i7.SignUpUseCase>()));
    gh.lazySingleton<_i11.ClearDataBloc>(
        () => _i11.ClearDataBloc(clearDataUseCase: gh<_i8.ClearDataUseCase>()));
    return this;
  }
}
