import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/model/result.dart';
import 'package:movie_app/data/provider/watchlist_provider.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class ImageAndBookmarkLarge extends StatelessWidget {
   ImageAndBookmarkLarge({super.key, required this.imagePath, required this.movie});

  final String imagePath;
  late WatchlistProvider watchlistProvider;
  Results movie;

  @override
  Widget build(BuildContext context) {
    watchlistProvider = Provider.of(context);
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        CachedNetworkImage(
          imageUrl: imagePath,
          placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
          errorWidget: (context, url, error) => Icon(Icons.error),
          width: MediaQuery.of(context).size.width * .31,
          height: MediaQuery.of(context).size.height * .22,
        ),
        Positioned(
          left: 0,
          top: -10,
          child: InkWell(
            onTap: (){
              watchlistProvider.toggleWatchlist(movie);
            },
            child:  Stack(
              alignment: Alignment.center, // Center the child inside
              clipBehavior: Clip.none,
              children: [
                watchlistProvider.moviesIsBooked(movie)?
                Icon(
                  Icons.bookmark,
                  color: AppColors.primary,
                  size: 45,
                )
                    :Icon(
                  Icons.bookmark,
                  color: Color(0xff514F4F),
                  size: 45,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child:
                    watchlistProvider.moviesIsBooked(movie)?
                    Icon(
                      Icons.done,
                      color: AppColors.white,
                      size: 15,
                    )
                        :Icon(
                      Icons.add,
                      color: AppColors.white,
                      size: 15,
                    ),
                  ),
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
