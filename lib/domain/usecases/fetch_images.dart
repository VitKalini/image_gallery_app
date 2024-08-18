import 'package:dartz/dartz.dart';
import 'package:image_gallery_app/core/error/failures.dart';
import 'package:image_gallery_app/core/usecases/usecases.dart';
import 'package:image_gallery_app/domain/entities/image_entity.dart';
import 'package:image_gallery_app/domain/repositories/image_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: <String>[Environment.prod])
class FetchImages extends UseCase<List<ImageEntity>, FetchImagesParams> {
  final ImageRepository repository;

  FetchImages(this.repository);

  @override
  Future<Either<Failure, List<ImageEntity>>> call(FetchImagesParams params) async {
    return await repository.fetchImages(params.query, params.page);
  }
}

class FetchImagesParams {
  final String query;
  final int page;

  FetchImagesParams({required this.query, required this.page});
}
