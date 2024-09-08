import 'package:flutter/material.dart';
import 'package:movie_app/data/api/api_manager.dart';
import 'package:movie_app/data/model/details_movie/DetailsMovie.dart';
import 'package:movie_app/data/model/popular_response.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:movie_app/ui/utils/widgets/custom_movie_details.dart';
import 'package:movie_app/ui/utils/widgets/custom_movie_header.dart';
import 'package:movie_app/ui/utils/widgets/image_and_bookmark_large.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({super.key});
  static const String routeName = 'MovieDetails';
  late DetailsMovie movieDetails;

  @override
  Widget build(BuildContext context) {
    movieDetails = ModalRoute.of(context)!.settings.arguments as DetailsMovie;
    print(movieDetails.title);
    // ApiManager.getDetailsMovie('278');
    // ApiManager.getSimilarMovie('278');
    return Scaffold(
      appBar: AppBar(
        title: Text(movieDetails.title ?? ''),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildMovieDetails(context),
          buildMovieLikeThis(context),
        ],
      ),
    );
  }

  Expanded buildMovieLikeThis(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        padding: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height * .3,
        width: double.infinity,
        color: AppColors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'More like this',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: FutureBuilder<PopularResponse>(
                future: ApiManager.getSimilarMovie(movieDetails.id.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(fontSize: 40),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: snapshot.data!.results!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            DetailsMovie movieDetails =
                                await ApiManager.getDetailsMovie(snapshot
                                    .data!.results![index].id
                                    .toString());
                            Navigator.pushNamed(
                              context,
                              MovieDetails.routeName,
                              arguments: movieDetails,
                            );
                          },
                          child: CustomMovieDetails(
                            movie: snapshot.data!.results![index],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildMovieDetails(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Column(
        children: [
          CustomMovieCover(
            coverImage: movieDetails.backdropPath ?? '',
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieDetails.title ?? '',
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      movieDetails.releaseDate ?? '',
                      style: TextStyle(
                        color: AppColors.white.withOpacity(.53),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 4,
                        child: ImageAndBookmarkLarge(
                          imagePath: movieDetails.posterPath ?? '',
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .03,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 5,
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: movieDetails.genres!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color:
                                              AppColors.white.withOpacity(0.5),
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        movieDetails.genres![index].name!,
                                        style: TextStyle(
                                          color:
                                              AppColors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              movieDetails.overview ?? '',
                              style: const TextStyle(
                                color: Color(0xffbacCBCBCB),
                              ),
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColors.primary,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  movieDetails.voteAverage
                                          ?.toStringAsFixed(1)
                                          .toString() ??
                                      '',
                                  style: const TextStyle(
                                      color: AppColors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
