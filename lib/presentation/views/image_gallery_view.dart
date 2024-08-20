import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_gallery_app/domain/usecases/fetch_images.dart';
import 'package:image_gallery_app/injectable_config.dart';
import 'package:image_gallery_app/presentation/views/widgets/empty_state.dart';
import 'package:image_gallery_app/presentation/views/widgets/search_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:image_gallery_app/presentation/viewmodels/image_gallery_viewmodel.dart';
import 'package:image_gallery_app/presentation/views/widgets/image_tile.dart';

import '../../core/utils/functions.dart';

class ImageGalleryView extends StatelessWidget {
  const ImageGalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImageGalleryViewModel>.reactive(
      viewModelBuilder: () => ImageGalleryViewModel(fetchImagesUseCase: getIt<FetchImages>()),
      onViewModelReady: (viewModel) {
        viewModel.scrollController.addListener(viewModel.scrollListener);
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0),
              ),
            ),
            title: const Text('Image Gallery'),
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 48),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
                child: ImagesSearchBar(
                  focusNode: viewModel.searchFocusNode,
                  onChanged: (String text) {
                    viewModel.fetchImages(query: text, reset: true);
                  },
                  onClearField: () => viewModel.clearSearch(),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: viewModel.images.isEmpty
                ? EmptyState(
                    onSuggestedAction: () {
                      viewModel.searchFocusNode.requestFocus();
                    },
                    suggestedAction: 'Start Searching...',
                  )
                : GridView.count(
                    crossAxisCount: getColumnsNumber(context),
                    controller: viewModel.scrollController,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: [for (var image in viewModel.images) ImageTile(image: image)],
                  ),
          ),
          bottomNavigationBar: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SizedBox(
              height: MediaQuery.of(context).padding.bottom + 55,
              child: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).padding.bottom,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        'assets/images/logo.svg',
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/github-mark.svg',
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '@VitKalini',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
