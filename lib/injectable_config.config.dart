// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_gallery_app/data/datasources/image_remote_data_source.dart'
    as _i589;
import 'package:image_gallery_app/data/repositories/image_repository_impl.dart'
    as _i207;
import 'package:image_gallery_app/domain/repositories/image_repository.dart'
    as _i810;
import 'package:image_gallery_app/domain/usecases/fetch_images.dart' as _i557;
import 'package:image_gallery_app/injectable_config.dart' as _i282;
import 'package:injectable/injectable.dart' as _i526;

const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.lazySingletonAsync<_i361.Dio>(
      () => registerModule.dio(),
      preResolve: true,
    );
    gh.lazySingleton<_i589.ImageRemoteDataSource>(
      () => _i589.ImageRemoteDataSourceImpl(dio: gh<_i361.Dio>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i810.ImageRepository>(
      () => _i207.ImageRepositoryImpl(
          remoteDataSource: gh<_i589.ImageRemoteDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i557.FetchImages>(
      () => _i557.FetchImages(gh<_i810.ImageRepository>()),
      registerFor: {_prod},
    );
    return this;
  }
}

class _$RegisterModule extends _i282.RegisterModule {}
