// To parse this JSON data, do
//
//     final movieVideos = movieVideosFromJson(jsonString);

import 'dart:convert';

MovieVideosModel movieVideosFromJson(String str) =>
    MovieVideosModel.fromJson(json.decode(str));

String movieVideosToJson(MovieVideosModel data) => json.encode(data.toJson());

class MovieVideosModel {
  int id;
  List<MovieVideo> results;

  MovieVideosModel({
    required this.id,
    required this.results,
  });

  factory MovieVideosModel.fromJson(Map<String, dynamic> json) =>
      MovieVideosModel(
        id: json["id"],
        results: List<MovieVideo>.from(
            json["results"].map((x) => MovieVideo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class MovieVideo {
  String iso6391;
  String iso31661;
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  DateTime publishedAt;
  String id;

  MovieVideo({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory MovieVideo.fromJson(Map<String, dynamic> json) => MovieVideo(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt.toIso8601String(),
        "id": id,
      };
}
