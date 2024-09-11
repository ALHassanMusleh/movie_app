import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/api/api_manager.dart';
import 'package:movie_app/data/model/details_movie/DetailsMovie.dart';
import 'package:movie_app/data/model/result.dart';
import 'package:movie_app/data/provider/watchlist_provider.dart';
import 'package:movie_app/ui/screens/movie_details/movie_details.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class MovieDiscover extends StatefulWidget {
  String categoryName;

  MovieDiscover({super.key, required this.categoryName});

  @override
  State<MovieDiscover> createState() => _MovieDiscoverState();
}

class _MovieDiscoverState extends State<MovieDiscover> {
  List<Results> movies = [];
  late WatchlistProvider watchlistProvider;
  bool isLoading = true;

  @override
  void initState() {
    fetchMovies(widget.categoryName);
    print(movies);
    super.initState();
  }

  Widget build(BuildContext context) {
    watchlistProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Spacer(flex: 2),
            isLoading
                ? Expanded(
              flex: 90,
              child: const Center(child: CircularProgressIndicator()),
            )
                : movies.isEmpty
                ? Expanded(
              flex: 90,
              child: const Center(
                child: Text(
                  'No movies found',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
                : Expanded(
              flex: 90,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  itemCount: movies.length, // Safely access the movies list
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        DetailsMovie movieDetails =
                        await ApiManager.getDetailsMovie(
                            movies[index].id.toString());
                        Navigator.pushNamed(
                            context, MovieDetails.routeName,
                            arguments: movieDetails);
                      },
                      child: Container(
                        margin:
                        const EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * .8,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                  movies[index].backdropPath ??
                                      '',
                                  placeholder: (context, url) =>
                                  const Center(
                                    child:
                                    CircularProgressIndicator(),
                                  ),
                                  errorWidget:
                                      (context, url, error) =>
                                  const Icon(Icons.error),
                                  width: MediaQuery.of(context)
                                      .size
                                      .width *
                                      .33,
                                  height: MediaQuery.of(context)
                                      .size
                                      .height *
                                      .1,
                                ),
                                Positioned(
                                  left: -10,
                                  top: -5,
                                  child: InkWell(
                                    onTap: () {
                                      watchlistProvider
                                          .toggleWatchlist(
                                          movies[
                                          index]);
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      clipBehavior: Clip.none,
                                      children: [
                                        watchlistProvider
                                            .moviesIsBooked(
                                            movies[
                                            index])
                                            ? Icon(
                                          Icons.bookmark,
                                          color:
                                          AppColors.primary,
                                          size: 45,
                                        )
                                            : Icon(
                                          Icons.bookmark,
                                          color: Color(
                                              0xff514F4F),
                                          size: 45,
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment:
                                            Alignment.center,
                                            child: watchlistProvider
                                                .moviesIsBooked(
                                                movies[
                                                index])
                                                ? Icon(
                                              Icons.done,
                                              color: AppColors
                                                  .white,
                                              size: 15,
                                            )
                                                : Icon(
                                              Icons.add,
                                              color: AppColors
                                                  .white,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
                                    movies[index].title ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: AppColors.white),
                                  ),
                                  Text(
                                    movies[index].releaseDate ?? '',
                                    style: TextStyle(
                                      color: AppColors.white
                                          .withOpacity(.53),
                                    ),
                                  ),
                                  Text(
                                    movies[index].originalTitle ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColors.white
                                          .withOpacity(.53),
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
      ),
    );
  }

  void fetchMovies(String category) async {
    String url =
        'https://api.themoviedb.org/3/discover/movie?api_key=5c1677c3d590a0da02b950bde3d80151&language=en&region=$category';

    try {
      final response = await get(Uri.parse(url));
      print('response: $response');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        print('jsonData: $jsonData');
        final List<dynamic> resultsList = jsonData['results'];
        print('resultsList: $resultsList');

        setState(() {
          movies = resultsList.map((json) => Results.fromJson(json)).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      print(error);
      setState(() {
        isLoading = false;
      });
    }
  }
}
