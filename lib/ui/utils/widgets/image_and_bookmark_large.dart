import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/utils/app_colors.dart';

class ImageAndBookmarkLarge extends StatelessWidget {
  const ImageAndBookmarkLarge({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        CachedNetworkImage(
          imageUrl: imagePath,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: MediaQuery.of(context).size.width * .31,
          height: MediaQuery.of(context).size.height * .22,
        ),
         Positioned(
          left: -10,
          top: -10,
          child: InkWell(
            onTap: (){
              print('book mark');
            },
            child: const Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.bookmark,
                  color: Color(0xff514F4F),
                  size: 45,
                ),
                Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
        // Positioned(
        //   left: 0,
        //   top: 0,
        //   child: const Stack(
        //     alignment: Alignment.center, // Center the child inside
        //     clipBehavior: Clip.none,
        //     children: [
        //       Icon(
        //         Icons.bookmark,
        //         color: Color(0xff514F4F),
        //         size: 45,
        //       ),
        //       Positioned.fill(
        //         child: Align(
        //           alignment: Alignment.center,
        //           child: Icon(
        //             Icons.add,
        //             color: AppColors.white,
        //             size: 15,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
