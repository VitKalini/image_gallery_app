import 'package:dartz/dartz.dart';
import 'package:image_gallery_app/core/error/failures.dart';
import 'package:image_gallery_app/domain/entities/image_entity.dart';

abstract class ImageRepository {
  Future<Either<Failure, List<ImageEntity>>> fetchImages(String query, int page);
}
