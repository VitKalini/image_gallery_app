import 'package:flutter/material.dart';
import 'package:image_gallery_app/domain/entities/image_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageDetailView extends StatelessWidget {
  final ImageEntity image;

  const ImageDetailView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Details'),
      ),
      body: Center(
        child: Hero(
          tag: image.id,
          child: CachedNetworkImage(
            imageUrl: image.imageUrl,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
