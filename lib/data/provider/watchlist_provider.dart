import 'package:flutter/material.dart';
import 'package:movie_app/data/model/details_movie/DetailsMovie.dart';
import 'package:movie_app/data/model/result.dart';
import 'package:provider/provider.dart';

class WatchlistProvider extends ChangeNotifier {
  final List<Results> moviesList = [];

  List<Results> get movies => moviesList;

  toggleWatchlist(Results movie) {
    if (moviesIsBooked(movie)) {
      moviesList.removeWhere((movieL) => movie.id == movieL.id);
    } else {
      moviesList.add(movie);
    }
    notifyListeners();
  }

  bool moviesIsBooked(Results movie) {
    for (int i = 0; i < moviesList.length; i++) {
      if (movie.id == moviesList[i].id!) {
        return true;
      }
    }
    return false;
  }
}