// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/auth/data/api/api_auth.dart' as _i252;
import '../../../features/auth/data/data_sources/auth_data_source.dart'
    as _i277;
import '../../../features/auth/data/repositories_impl/auth_repository_impl.dart'
    as _i713;
import '../../../features/auth/domain/repositories/auth_repository.dart'
    as _i234;
import '../../../features/auth/domain/use_cases/login_use_case.dart' as _i933;
import '../../../features/auth/domain/use_cases/register_use_case.dart' as _i99;
import '../../../features/auth/presentation/blocs/login/login_cubit.dart'
    as _i312;
import '../../../features/auth/presentation/blocs/register/register_cubit.dart'
    as _i392;
import '../../api_helper/api_consumer/api_consumer.dart' as _i423;
import '../../api_helper/api_consumer/dio_consumer.dart' as _i561;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i423.ApiConsumer>(() => _i561.DioConsumer());
    gh.lazySingleton<_i252.ApiAuth>(
        () => _i252.ApiAuth(gh<_i423.ApiConsumer>()));
    gh.factory<_i277.AuthDataSource>(
        () => _i277.AuthDataSource(gh<_i252.ApiAuth>()));
    gh.factory<_i234.AuthRepository>(
        () => _i713.AuthRepositoryImpl(gh<_i277.AuthDataSource>()));
    gh.factory<_i99.RegisterUseCase>(
        () => _i99.RegisterUseCase(gh<_i234.AuthRepository>()));
    gh.factory<_i933.LoginUseCase>(
        () => _i933.LoginUseCase(gh<_i234.AuthRepository>()));
    gh.factory<_i392.RegisterCubit>(
        () => _i392.RegisterCubit(gh<_i99.RegisterUseCase>()));
    gh.factory<_i312.LoginCubit>(
        () => _i312.LoginCubit(gh<_i933.LoginUseCase>()));
    return this;
  }
}
