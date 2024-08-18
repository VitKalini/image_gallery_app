import 'package:image_gallery_app/core/error/failures.dart';
import 'package:image_gallery_app/core/error/map_failures.dart';
import 'package:image_gallery_app/data/datasources/image_remote_data_source.dart';
import 'package:image_gallery_app/domain/entities/image_entity.dart';
import 'package:image_gallery_app/domain/repositories/image_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ImageRepository, env: <String>[Environment.prod])
class ImageRepositoryImpl implements ImageRepository {
  final ImageRemoteDataSource remoteDataSource;

  ImageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ImageEntity>>> fetchImages(String query, int page) async {
    try {
      final images = await remoteDataSource.fetchImages(query, page);
      return Right(images);
    } on Exception catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }
}
