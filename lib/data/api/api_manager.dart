import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/data/model/details_movie/DetailsMovie.dart';
import 'package:movie_app/data/model/popular_response.dart';
import 'package:movie_app/data/model/result.dart';

abstract class ApiManager {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey = '1cf3389d387b95a499a3ae686e60d559';
  static const String _popularEndPoint = '/movie/popular';
  static const String _newRealeasesEndPoint = '/movie/upcoming';
  static const String _recommendedEndPoint = '/movie/top_rated';

  static Future<PopularResponse> getPopularMovie() async {
    Response serverResponse = await get(
        Uri.parse('$_baseUrl$_popularEndPoint?language=en&api_key=$_apiKey'));
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      PopularResponse popularResponse = PopularResponse.fromJson(json);
      print(popularResponse.results);
      print(popularResponse.results?[0].title);
      return popularResponse;
    } else {
      throw 'Something went wrong please try again later';
    }
  }

  static Future<PopularResponse> getNewRealeasesMovie() async {
    Response serverResponse = await get(Uri.parse(
        '$_baseUrl$_newRealeasesEndPoint?language=en&api_key=$_apiKey'));
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      PopularResponse popularResponse = PopularResponse.fromJson(json);
      print(popularResponse.results);
      print(popularResponse.results?[0].title);
      return popularResponse;
    } else {
      throw 'Something went wrong please try again later';
    }
  }

  static Future<PopularResponse> getRecommendedMovie() async {
    Response serverResponse = await get(Uri.parse(
        '$_baseUrl$_recommendedEndPoint?language=en&api_key=$_apiKey'));
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      PopularResponse popularResponse = PopularResponse.fromJson(json);
      print(popularResponse.results);
      print(popularResponse.results?[0].title);
      return popularResponse;
    } else {
      throw 'Something went wrong please try again later';
    }
  }

  static Future<DetailsMovie> getDetailsMovie(String movieId) async {
    Response serverResponse = await get(
        Uri.parse('$_baseUrl/movie/$movieId?language=en&api_key=$_apiKey'));
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      DetailsMovie detailsMovie = DetailsMovie.fromJson(json);
      print(detailsMovie.title);
      print(detailsMovie.voteAverage);
      return detailsMovie;
    } else {
      throw 'Something went wrong please try again later';
    }
  }

  static Future<PopularResponse> getSimilarMovie(String movieId) async {
    Response serverResponse = await get(Uri.parse(
        '$_baseUrl/movie/$movieId/similar?language=en&api_key=$_apiKey'));
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      PopularResponse popularResponse = PopularResponse.fromJson(json);
      print(popularResponse.results);
      print(popularResponse.results?[0].title);
      return popularResponse;
    } else {
      throw 'Something went wrong please try again later';
    }
  }

  // static  PopularResponse? response;
  static Future<PopularResponse?> searchMovie(String movie) async {
    Response serverResponse = await get(Uri.parse(
        '$_baseUrl/search/movie?query=$movie&language=en&api_key=$_apiKey'));
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      PopularResponse response = PopularResponse.fromJson(json);
      print(response.results);
      // print(response.results?[0].title);
      return response;
    } else {
      throw 'Something went wrong please try again later';
    }
  }
}
