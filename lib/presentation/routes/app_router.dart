import 'package:flutter/material.dart';
import 'package:image_gallery_app/presentation/views/image_gallery_view.dart';
import 'package:image_gallery_app/presentation/views/image_detail_view.dart';
import 'package:image_gallery_app/domain/entities/image_entity.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const ImageGalleryView());
      case '/imageDetail':
        final image = settings.arguments as ImageEntity;
        return MaterialPageRoute(builder: (_) => ImageDetailView(image: image));
      default:
        return MaterialPageRoute(builder: (_) => const ImageGalleryView());
    }
  }
}
