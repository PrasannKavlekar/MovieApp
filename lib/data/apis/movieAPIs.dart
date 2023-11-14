import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tentwenty_movie_app/domain/models/movieDetailsModel.dart';
import 'package:tentwenty_movie_app/domain/models/movieImagesModel.dart';
import 'package:tentwenty_movie_app/domain/models/upcomingMovieModel.dart';

class MovieAPIs {
  static String apiKey = 'a820c8fc86167f8df6d98aac10bb055f';
  static String apiUrl = 'https://api.themoviedb.org/3/movie';

  static Future<List<UpcomingMovieModel>> fetchMovies() async {
    final response =
        await http.get(Uri.parse('$apiUrl/upcoming?api_key=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return UpcomingMoviesResponse.fromJson(data).results;
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  static Future<MovieDetailsModel> fetchMovieDetails(String movieId) async {
    final response =
        await http.get(Uri.parse('$apiUrl/$movieId?api_key=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return MovieDetailsModel.fromJson(data);
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  static Future<MovieImagesModel> fetchMovieImages(String movieId) async {
    final response =
        await http.get(Uri.parse('$apiUrl/$movieId/images?api_key=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return MovieImagesModel.fromJson(data);
    } else {
      throw Exception('Failed to load movie images');
    }
  }
}
