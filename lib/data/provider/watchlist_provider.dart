import 'package:flutter/material.dart';
import 'package:movie_app/data/model/details_movie/DetailsMovie.dart';
import 'package:movie_app/data/model/result.dart';
import 'package:provider/provider.dart';

class WatchlistProvider extends ChangeNotifier{
  final List<Results> moviesList = [];
  List<Results> get movies => moviesList;
   toggleWatchlist(Results movie){
    if(moviesList.contains(movie)){
      moviesList.remove(movie);
    }else
      {
        moviesList.add(movie);
      }
    notifyListeners();
  }
  bool isExist(Results movie){
    final isExist = moviesList.contains(movie);
    return isExist;
  }
}