import 'dart:convert';

MovieImagesModel movieImagesFromJson(String str) =>
    MovieImagesModel.fromJson(json.decode(str));

String movieImagesToJson(MovieImagesModel data) => json.encode(data.toJson());

class MovieImagesModel {
  List<MovieImage> backdrops;
  int id;
  List<MovieImage> logos;
  List<MovieImage> posters;

  MovieImagesModel({
    required this.backdrops,
    required this.id,
    required this.logos,
    required this.posters,
  });

  factory MovieImagesModel.fromJson(Map<String, dynamic> json) =>
      MovieImagesModel(
        backdrops: List<MovieImage>.from(
            json["backdrops"].map((x) => MovieImage.fromJson(x))),
        id: json["id"],
        logos: List<MovieImage>.from(
            json["logos"].map((x) => MovieImage.fromJson(x))),
        posters: List<MovieImage>.from(
            json["posters"].map((x) => MovieImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "backdrops": List<dynamic>.from(backdrops.map((x) => x.toJson())),
        "id": id,
        "logos": List<dynamic>.from(logos.map((x) => x.toJson())),
        "posters": List<dynamic>.from(posters.map((x) => x.toJson())),
      };
}

class MovieImage {
  double aspectRatio;
  int height;
  String? iso6391;
  String filePath;
  double voteAverage;
  int voteCount;
  int width;

  MovieImage({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory MovieImage.fromJson(Map<String, dynamic> json) => MovieImage(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "iso_639_1": iso6391,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
      };
}
