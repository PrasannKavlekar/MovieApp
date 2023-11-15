import 'dart:convert';

import 'package:tentwenty_movie_app/domain/models/generic/genreModel.dart';

MovieGenreListModel movieGenreListModelFromJson(String str) =>
    MovieGenreListModel.fromJson(json.decode(str));

String movieGenreListModelToJson(MovieGenreListModel data) =>
    json.encode(data.toJson());

class MovieGenreListModel {
  List<Genre> genres;

  MovieGenreListModel({
    required this.genres,
  });

  factory MovieGenreListModel.fromJson(Map<String, dynamic> json) =>
      MovieGenreListModel(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}
