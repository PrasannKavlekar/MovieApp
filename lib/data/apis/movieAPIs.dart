import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tentwenty_movie_app/domain/models/generic/genreModel.dart';
import 'package:tentwenty_movie_app/domain/models/generic/movieDetailsModel.dart';
import 'package:tentwenty_movie_app/domain/models/movieGenreListModel.dart';
import 'package:tentwenty_movie_app/domain/models/movieImagesModel.dart';
import 'package:tentwenty_movie_app/domain/models/movieVideosModel.dart';
import 'package:tentwenty_movie_app/domain/models/moviesByGenreModel.dart';
import 'package:tentwenty_movie_app/domain/models/upcomingMovieModel.dart';

class MovieAPIs {
  static String apiKey = 'a820c8fc86167f8df6d98aac10bb055f';
  static String apiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhODIwYzhmYzg2MTY3ZjhkZjZkOThhYWMxMGJiMDU1ZiIsInN1YiI6IjY1NTMxNDk1NjdiNjEzNDVkYmJmZGUwNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.V5PCsgYKa_rxWnnNbcmkw7PQsdwrffPKVl3ONRGCU1A';
  static String apiUrl = 'https://api.themoviedb.org/3';

  static Future<List<UpcomingMovieModel>> fetchMovies() async {
    final response =
        await http.get(Uri.parse('$apiUrl/movie/upcoming?api_key=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return UpcomingMoviesResponse.fromJson(data).results;
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  static Future<MovieDetailsModel> fetchMovieDetails(String movieId) async {
    final response =
        await http.get(Uri.parse('$apiUrl/movie/$movieId?api_key=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return MovieDetailsModel.fromJson(data);
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  static Future<MovieImagesModel> fetchMovieImages(String movieId) async {
    final response = await http
        .get(Uri.parse('$apiUrl/movie/$movieId/images?api_key=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return MovieImagesModel.fromJson(data);
    } else {
      throw Exception('Failed to load movie images');
    }
  }

  static Future<MovieVideosModel> fetchMovieVideos(String movieId) async {
    final response = await http
        .get(Uri.parse('$apiUrl/movie/$movieId/videos?api_key=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return MovieVideosModel.fromJson(data);
    } else {
      throw Exception('Failed to load movie videos');
    }
  }

  static Future<List<Genre>> fetchGenres() async {
    final response =
        await http.get(Uri.parse('$apiUrl/genre/movie/list?api_key=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return MovieGenreListModel.fromJson(data).genres;
    } else {
      throw Exception('Failed to load genre list');
    }
  }

  static Future<List<MovieSearchResult>> fetchMoviesByGenres(
      String genreId) async {
    final response = await http.get(Uri.parse(
        '$apiUrl/discover/movie?with_genres=$genreId&api_key=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return MoviesByGenreModel.fromJson(data).results;
    } else {
      throw Exception('Failed to load movies by genre');
    }
  }
}
