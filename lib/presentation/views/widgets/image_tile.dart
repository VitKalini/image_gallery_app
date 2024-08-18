import 'package:flutter/material.dart';
import 'package:image_gallery_app/domain/entities/image_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_gallery_app/presentation/views/image_detail_view.dart';

class ImageTile extends StatelessWidget {
  final ImageEntity image;

  const ImageTile({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ImageDetailView(image: image),
          ),
        );
      },
      child: Stack(
        children: [
          Hero(
            tag: image.id,
            child: CachedNetworkImage(
              imageUrl: image.imageUrl,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Likes: ${image.likes}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Views: ${image.views}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
