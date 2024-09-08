import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/api/api_manager.dart';
import 'package:movie_app/data/model/details_movie/DetailsMovie.dart';
import 'package:movie_app/data/model/popular_response.dart';
import 'package:movie_app/data/model/result.dart';
import 'package:movie_app/data/provider/search_provider.dart';
import 'package:movie_app/ui/screens/movie_details/movie_details.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class SearchTab extends StatefulWidget {
  SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late SearchProvider searchProvider;
  @override
  Widget build(BuildContext context) {
    searchProvider = Provider.of(context);
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
          child: TextField(
            onSubmitted: (value) {
              searchProvider.getMovies(value);
            },
            style: const TextStyle(
                color: Colors.white, backgroundColor: AppColors.grey),
            decoration: const InputDecoration(
              filled: true,
              fillColor: AppColors.grey,
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.white,
              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                color: AppColors.white,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    25,
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    25,
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    25,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (searchProvider.isLoading)
          Expanded(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        else if (searchProvider.movies != null &&
            searchProvider.movies!.isEmpty)
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/no_found_movies.png',
                  ),
                  Text(
                    'No movies found',
                    style: TextStyle(color: AppColors.white),
                  ),
                ],
              ),
            ),
          )
        else if (searchProvider.movies != null)
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: searchProvider.movies!.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemCount: searchProvider.movies!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            DetailsMovie movieDetails =
                                await ApiManager.getDetailsMovie(searchProvider
                                    .movies![index].id
                                    .toString());
                            Navigator.pushNamed(
                              context,
                              MovieDetails.routeName,
                              arguments: movieDetails,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.width * .8,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: searchProvider
                                          .movies![index].backdropPath ??
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
                                        searchProvider.movies![index].title ??
                                            '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: AppColors.white),
                                      ),
                                      Text(
                                        searchProvider
                                                .movies![index].releaseDate ??
                                            '',
                                        style: TextStyle(
                                          color:
                                              AppColors.white.withOpacity(.53),
                                        ),
                                      ),
                                      Text(
                                        searchProvider
                                                .movies![index].originalTitle ??
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
    );
  }
}
