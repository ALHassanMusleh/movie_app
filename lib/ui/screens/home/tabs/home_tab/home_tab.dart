import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/api/api_manager.dart';
import 'package:movie_app/data/model/popular_response.dart';
import 'package:movie_app/data/model/result.dart';
import 'package:movie_app/ui/screens/movie_details/movie_details.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:movie_app/ui/utils/widgets/custom_movie_details.dart';
import 'package:movie_app/ui/utils/widgets/custom_movie_header.dart';
import 'package:movie_app/ui/utils/widgets/image_and_bookmark_large.dart';
import 'package:movie_app/ui/utils/widgets/image_and_bookmark_small.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          buildTopPopular(),
          const SizedBox(
            height: 20,
          ),
          buildNewReleases(),
          const SizedBox(
            height: 30,
          ),
          buildRecomended(),
        ],
      ),
    );
  }

  buildTopPopular() => FutureBuilder<PopularResponse>(
        future: ApiManager.getPopularMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(fontSize: 40),
              ),
            );
          } else if (snapshot.hasData) {
            return buildCarosalSlider(snapshot.data!.results!);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );

  buildCarosalSlider(List<Results> movies) {
    List<Widget> items = movies.map((movie) => movieFullHeader(movie)).toList();
    return CarouselSlider(
      items: items,
      options: CarouselOptions(
        height: 250,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(
          seconds: 5,
        ),
        autoPlayAnimationDuration: const Duration(
          seconds: 1,
        ),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1, //عشان الصورة تاخذ كل العرض
      ),
    );
  }

  buildNewReleases() => Container(
        padding: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height * .2,
        width: double.infinity,
        color: AppColors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Releases ',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            FutureBuilder<PopularResponse>(
              future: ApiManager.getNewRealeasesMovie(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      style: TextStyle(fontSize: 40),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.results!.length,
                        itemBuilder: (context, index) {
                          return ImageAndBookmarkSmall(
                            imagePath:
                                snapshot.data!.results![index].posterPath ?? '',
                          );
                        }),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      );

  buildRecomended() => Container(
        padding: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height * .3,
        width: double.infinity,
        color: AppColors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recomended',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            FutureBuilder<PopularResponse>(
              future: ApiManager.getRecommendedMovie(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      style: TextStyle(fontSize: 40),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: snapshot.data!.results!.length,
                      itemBuilder: (context, index) {
                        return CustomMovieDetails(
                          movie: snapshot.data!.results![index],
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      );

  Widget movieFullHeader(Results movie) => InkWell(
        onTap: () {
          Navigator.pushNamed(context, MovieDetails.routeName);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .32,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomMovieCover(
                coverImage: movie.backdropPath ?? '',
              ),
              Positioned(
                top: 75,
                left: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ImageAndBookmarkLarge(
                      imagePath: movie.posterPath ?? '',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title ?? '',
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          movie.releaseDate ?? '',
                          style: TextStyle(
                            color: AppColors.white.withOpacity(.53),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
