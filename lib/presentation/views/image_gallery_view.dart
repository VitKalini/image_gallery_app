import 'package:flutter/material.dart';
import 'package:image_gallery_app/presentation/views/widgets/search_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:image_gallery_app/presentation/viewmodels/image_gallery_viewmodel.dart';
import 'package:image_gallery_app/presentation/views/widgets/image_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImageGalleryView extends StatelessWidget {
  const ImageGalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImageGalleryViewModel>.reactive(
      viewModelBuilder: () => ImageGalleryViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Image Gallery'),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: ImagesSearchBar(),
            ),
          ),
          body: viewModel.isBusy
              ? const Center(child: CircularProgressIndicator())
              : StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: [
                    for (var image in viewModel.images) ImageTile(image: image),
                  ],
                ),
        );
      },
    );
  }
}
