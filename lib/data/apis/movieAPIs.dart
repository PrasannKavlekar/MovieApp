import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tentwenty_movie_app/config/api_constants.dart';
import 'package:tentwenty_movie_app/domain/models/generic/genreModel.dart';
import 'package:tentwenty_movie_app/domain/models/generic/movieDetailsModel.dart';
import 'package:tentwenty_movie_app/domain/models/movieGenreListModel.dart';
import 'package:tentwenty_movie_app/domain/models/movieImagesModel.dart';
import 'package:tentwenty_movie_app/domain/models/movieVideosModel.dart';
import 'package:tentwenty_movie_app/domain/models/moviesByGenreModel.dart';
import 'package:tentwenty_movie_app/domain/models/upcomingMovieModel.dart';

class MovieAPIs {
  static Future<List<UpcomingMovieModel>> fetchMovies() async {
    ///API for fetching Upcoming Movies from API
    final response = await http.get(Uri.parse(
        '${APIConstants.baseURL}/movie/upcoming?api_key=${APIConstants.apiKey}'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return UpcomingMoviesResponse.fromJson(data).results;
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  static Future<MovieDetailsModel> fetchMovieDetails(String movieId) async {
    ///API for fetching Movie Details from API
    final response = await http.get(Uri.parse(
        '${APIConstants.baseURL}/movie/$movieId?api_key=${APIConstants.apiKey}'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return MovieDetailsModel.fromJson(data);
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  static Future<MovieImagesModel> fetchMovieImages(String movieId) async {
    ///API for fetching Movie Images from API
    final response = await http.get(Uri.parse(
        '${APIConstants.baseURL}/movie/$movieId/images?api_key=${APIConstants.apiKey}'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return MovieImagesModel.fromJson(data);
    } else {
      throw Exception('Failed to load movie images');
    }
  }

  static Future<MovieVideosModel> fetchMovieVideos(String movieId) async {
    ///API for fetching Movie Videos from API
    final response = await http.get(Uri.parse(
        '${APIConstants.baseURL}/movie/$movieId/videos?api_key=${APIConstants.apiKey}'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return MovieVideosModel.fromJson(data);
    } else {
      throw Exception('Failed to load movie videos');
    }
  }

  static Future<List<Genre>> fetchGenres() async {
    ///API for fetching Genres from API
    final response = await http.get(Uri.parse(
        '${APIConstants.baseURL}/genre/movie/list?api_key=${APIConstants.apiKey}'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return MovieGenreListModel.fromJson(data).genres;
    } else {
      throw Exception('Failed to load genre list');
    }
  }

  static Future<List<MovieSearchResult>> fetchMoviesByGenres(
      String genreId) async {
    ///API for fetching Movies by Genre from API
    final response = await http.get(Uri.parse(
        '${APIConstants.baseURL}/discover/movie?with_genres=$genreId&api_key=${APIConstants.apiKey}'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return MoviesByGenreModel.fromJson(data).results;
    } else {
      throw Exception('Failed to load movies by genre');
    }
  }

  static Future<List<MovieSearchResult>> fetchSearchResults(String text) async {
    ///API for fetching Search Results from API
    final response = await http.get(Uri.parse(
        '${APIConstants.baseURL}/search/movie?query=$text&api_key=${APIConstants.apiKey}'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return MoviesByGenreModel.fromJson(data).results;
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
