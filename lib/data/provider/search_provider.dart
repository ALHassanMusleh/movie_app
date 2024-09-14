import 'package:flutter/material.dart';
import 'package:movie_app/data/api/api_manager.dart';
import 'package:movie_app/data/model/popular_response.dart';
import 'package:movie_app/data/model/result.dart';

class SearchProvider extends ChangeNotifier {
  List<Results>? movies = [];
  bool isLoading = false;

  void getMovies(String movie) async {
    isLoading = true;
    notifyListeners();

    PopularResponse? response = await ApiManager.searchMovie(movie);

    if (response?.results != null && response!.results!.isNotEmpty) {
      movies = response.results;
      print('not empty');
    } else {
      movies = [];
      print('empty');
    }

    isLoading = false;
    notifyListeners();
  }
}
