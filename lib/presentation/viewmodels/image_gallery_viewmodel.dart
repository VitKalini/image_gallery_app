import 'package:image_gallery_app/domain/usecases/fetch_images.dart';
import 'package:image_gallery_app/domain/entities/image_entity.dart';
import 'package:image_gallery_app/core/error/map_failures.dart';
import 'package:stacked/stacked.dart';
import 'package:image_gallery_app/injectable_config.dart';

class ImageGalleryViewModel extends BaseViewModel {
  final FetchImages _fetchImagesUseCase = getIt<FetchImages>();

  List<ImageEntity> _images = [];
  int _page = 1;
  String _query = '';

  List<ImageEntity> get images => _images;

  Future<void> fetchImages(String query, {bool reset = false}) async {
    if (reset) {
      _page = 1;
      _images.clear();
      _query = query;
    } else {
      _page++;
    }

    final result = await _fetchImagesUseCase.call((FetchImagesParams(query: _query, page: _page)));

    result.fold(
      (failure) {
        FailureMapper.mapFailureToMessage(failure);
      },
      (newImages) {
        _images.addAll(newImages);
      },
    );

    notifyListeners();
  }
}
