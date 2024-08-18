import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String id;
  final String imageUrl;
  final int likes;
  final int views;

  const ImageEntity({
    required this.id,
    required this.imageUrl,
    required this.likes,
    required this.views,
  });

  @override
  List<Object?> get props => [id, imageUrl, likes, views];
}
