import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_app/domain/usecases/fetch_images.dart';
import 'package:image_gallery_app/domain/entities/image_entity.dart';
import 'package:image_gallery_app/core/error/map_failures.dart';
import 'package:stacked/stacked.dart';

import '../../core/error/failures.dart';

class ImageGalleryViewModel extends BaseViewModel {
  final FetchImages fetchImagesUseCase;

  ImageGalleryViewModel({required this.fetchImagesUseCase});

  final List<ImageEntity> _images = [];
  List<ImageEntity> get images => _images;
  int _page = 1;
  String _query = '';
  ScrollController scrollController = ScrollController();
  FocusNode searchFocusNode = FocusNode();

  void clearSearch() {
    _images.clear();
    notifyListeners();
  }

  void fetchImages({String? query, bool reset = false}) async {
    if (reset) {
      _page = 1;
      _images.clear();
      _query = query ?? '';
    } else {
      _page++;
    }
    final Either<Failure, List<ImageEntity>> result =
        await fetchImagesUseCase.call((FetchImagesParams(query: _query, page: _page)));
    result.fold(
      (Failure failure) {
        // ignore: avoid_print
        print(FailureMapper.mapFailureToMessage(failure));
      },
      (List<ImageEntity> newImages) {
        _images.addAll(newImages);
      },
    );
    notifyListeners();
  }

  scrollListener() {
    if (scrollController.offset >= (scrollController.position.maxScrollExtent * 0.8) &&
        !scrollController.position.outOfRange) {
      fetchImages();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
