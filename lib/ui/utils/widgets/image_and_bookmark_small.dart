import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/api/api_manager.dart';
import 'package:movie_app/data/model/details_movie/DetailsMovie.dart';
import 'package:movie_app/data/model/result.dart';
import 'package:movie_app/data/provider/watchlist_provider.dart';
import 'package:movie_app/ui/screens/movie_details/movie_details.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class ImageAndBookmarkSmall extends StatelessWidget {
   ImageAndBookmarkSmall({super.key, required this.movie});
  final Results movie;
  late WatchlistProvider watchlistProvider;

  @override
  Widget build(BuildContext context) {
    watchlistProvider = Provider.of(context);
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        InkWell(
          onTap: () async {
            DetailsMovie movieDetails =
            await ApiManager.getDetailsMovie(movie.id.toString());
            Navigator.pushNamed(context, MovieDetails.routeName,
                arguments: movieDetails);
          },
          child: CachedNetworkImage(
            imageUrl: movie.posterPath ?? '',
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: MediaQuery.of(context).size.width * .23,
            height: MediaQuery.of(context).size.height * .14,
          ),
        ),
         Positioned(
          left: 0,
          top: -10,
          child: InkWell(
            onTap: (){
              print('book mark');
            },
            child:  InkWell(
              onTap: watchlistProvider.toggleWatchlist(movie),
              child: Stack(
                alignment: Alignment.center, // Center the child inside
                clipBehavior: Clip.none,
                children: [
                  watchlistProvider.isExist(movie)?
                  Icon(
                    Icons.bookmark,
                    color: AppColors.primary,
                    size: 45,
                  )
                  :
                  Icon(
                    Icons.bookmark,
                    color: Color(0xff514F4F),
                    size: 45,
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: watchlistProvider.isExist(movie)?
                      Icon(
                        Icons.done,
                        color: AppColors.white,
                        size: 15,
                      )
                          :
                      Icon(
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
                 ),
      ],
    );
  }
}
