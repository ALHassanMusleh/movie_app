import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/api/api_manager.dart';
import 'package:movie_app/data/model/details_movie/DetailsMovie.dart';
import 'package:movie_app/data/provider/watchlist_provider.dart';
import 'package:movie_app/ui/screens/movie_details/movie_details.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class WatchlistTab extends StatelessWidget {
  late WatchlistProvider watchlistProvider;
   WatchlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    watchlistProvider = Provider.of(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 8,),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Watchlist',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w400),)),
          Spacer(flex: 2,),
          Expanded(
            flex: 90,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                itemCount: watchlistProvider.moviesList!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      DetailsMovie movieDetails =
                      await ApiManager.getDetailsMovie(watchlistProvider.moviesList[index].id.toString());
                      Navigator.pushNamed(
                          context, MovieDetails.routeName,
                          arguments: movieDetails);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width * .8,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CachedNetworkImage(
                            imageUrl: watchlistProvider
                                .moviesList![index].backdropPath ??
                                '',
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                            width:
                            MediaQuery.of(context).size.width * .33,
                            height:
                            MediaQuery.of(context).size.height * .1,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  watchlistProvider
                                      .moviesList![index].title ??
                                      '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: AppColors.white),
                                ),
                                Text(
                                  watchlistProvider
                                      .moviesList![index].releaseDate ??
                                      '',
                                  style: TextStyle(
                                    color:
                                    AppColors.white.withOpacity(.53),
                                  ),
                                ),
                                Text(
                                  watchlistProvider
                                      .moviesList![index].originalTitle ??
                                      '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color:
                                    AppColors.white.withOpacity(.53),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width * .9,
                    color: const Color(0xff707070),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
