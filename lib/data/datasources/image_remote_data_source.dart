import 'package:image_gallery_app/data/models/image_model.dart';
import 'package:image_gallery_app/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ImageRemoteDataSource {
  Future<List<ImageModel>> fetchImages(String query, int page);
}

@LazySingleton(as: ImageRemoteDataSource, env: <String>[Environment.prod])
class ImageRemoteDataSourceImpl implements ImageRemoteDataSource {
  final Dio dio;

  ImageRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ImageModel>> fetchImages(String query, int page) async {
    final response = await dio.get('', queryParameters: {
      'key': Constants.apiKey,
      'q': query,
      'page': page,
      'image_type': 'photo',
    });

    final List<dynamic> jsonResponse = response.data['hits'];
    return jsonResponse.map((json) => ImageModel.fromJson(json)).toList();
  }
}
