import 'package:flutter/material.dart';
import 'package:image_gallery_app/domain/entities/image_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_gallery_app/presentation/views/image_detail_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../core/utils/functions.dart';

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
      child: Column(
        children: [
          Hero(
            tag: image.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: CachedNetworkImage(
                imageUrl: image.imageUrl,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: getImageTileHeight(context),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 4),
                  Icon(
                    MdiIcons.thumbUpOutline,
                    size: 10,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    image.likes.toString(),
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    MdiIcons.eyeOutline,
                    size: 10,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    image.views.toString(),
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
