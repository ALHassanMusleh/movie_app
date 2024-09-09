import 'package:flutter/material.dart';
import 'package:movie_app/data/api/api_manager.dart';
import 'package:movie_app/data/model/details_movie/DetailsMovie.dart';
import 'package:movie_app/data/model/result.dart';
import 'package:movie_app/ui/screens/movie_details/movie_details.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:movie_app/ui/utils/widgets/image_and_bookmark_small.dart';

class CustomMovieDetails extends StatelessWidget {
  const CustomMovieDetails({
    super.key,
    required this.movie,
  });
  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * .23,
        height: MediaQuery.of(context).size.height * .2,
        decoration: BoxDecoration(
          color: const Color(0xff343534),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                DetailsMovie movieDetails =
                await ApiManager.getDetailsMovie(movie.id.toString());
                Navigator.pushNamed(context, MovieDetails.routeName,
                    arguments: movieDetails);
              },
              child: ImageAndBookmarkSmall(
                movie: movie,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.primary,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        movie.voteAverage?.toStringAsFixed(1).toString() ?? '',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    movie.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    movie.releaseDate ?? '',
                    style: TextStyle(
                      color: AppColors.white.withOpacity(.53),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
