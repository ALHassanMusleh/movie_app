import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/model/result.dart';
import 'package:movie_app/ui/utils/app_colors.dart';

class ImageAndBookmarkSmall extends StatelessWidget {
  const ImageAndBookmarkSmall({super.key, required this.movie});
  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        CachedNetworkImage(
          imageUrl: movie.posterPath ?? '',
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: MediaQuery.of(context).size.width * .23,
          height: MediaQuery.of(context).size.height * .14,
        ),
        const Positioned(
          left: 0,
          top: -10,
          child: Stack(
            alignment: Alignment.center, // Center the child inside
            clipBehavior: Clip.none,
            children: [
              Icon(
                Icons.bookmark,
                color: Color(0xff514F4F),
                size: 45,
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
