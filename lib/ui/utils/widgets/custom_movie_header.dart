import 'package:flutter/material.dart';
import 'package:movie_app/ui/utils/app_colors.dart';

class CustomMovieCover extends StatelessWidget {
  const CustomMovieCover({
    super.key,
    required this.coverImage,
  });

  final String coverImage;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .24,
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            coverImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: const Icon(
        Icons.play_circle_rounded,
        color: AppColors.white,
        size: 60,
      ),
    );
  }
}
