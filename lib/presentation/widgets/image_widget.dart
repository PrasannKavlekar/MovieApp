import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/config/path_constants.dart';

class ImageWidget extends StatelessWidget {
  final String? imagePath;
  const ImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return imagePath == null
        ? Image.asset(
            PathConstants.movieIconPath,
            // width: 30,
            // height: 30,
            fit: BoxFit.contain,
          )
        : Image.network(
            'https://image.tmdb.org/t/p/w500$imagePath',
            fit: BoxFit.cover,
          );
  }
}
