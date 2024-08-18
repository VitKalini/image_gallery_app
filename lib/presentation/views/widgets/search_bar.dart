import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:image_gallery_app/presentation/viewmodels/image_gallery_viewmodel.dart';

class ImagesSearchBar extends StatefulWidget {
  const ImagesSearchBar({super.key});

  @override
  State<StatefulWidget> createState() => _ImagesSearchBarState();
}

class _ImagesSearchBarState extends State<ImagesSearchBar> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImageGalleryViewModel>.nonReactive(
      viewModelBuilder: () => ImageGalleryViewModel(),
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            onChanged: (text) {
              if (_debounce?.isActive ?? false) _debounce!.cancel();
              _debounce = Timer(const Duration(milliseconds: 500), () {
                viewModel.fetchImages(text, reset: true);
              });
            },
            decoration: InputDecoration(
              hintText: 'Search images...',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                  viewModel.fetchImages('', reset: true);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
