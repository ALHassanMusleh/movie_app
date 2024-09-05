import 'package:flutter/material.dart';
import 'package:movie_app/ui/utils/app_colors.dart';

class ImageAndBookmarkSmall extends StatelessWidget {
  const ImageAndBookmarkSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Image.asset(
          'assets/images/bg_1.png',
          width: MediaQuery.of(context).size.width * .23,
          height: MediaQuery.of(context).size.height * .14,
        ),
        Positioned(
          left: -10,
          top: -10,
          child: const Stack(
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
