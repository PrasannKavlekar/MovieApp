import 'dart:convert';

MovieImagesModel movieImagesFromJson(String str) =>
    MovieImagesModel.fromJson(json.decode(str));

String movieImagesToJson(MovieImagesModel data) => json.encode(data.toJson());

class MovieImagesModel {
  List<Backdrop> backdrops;
  int id;
  List<Backdrop> logos;
  List<Backdrop> posters;

  MovieImagesModel({
    required this.backdrops,
    required this.id,
    required this.logos,
    required this.posters,
  });

  factory MovieImagesModel.fromJson(Map<String, dynamic> json) =>
      MovieImagesModel(
        backdrops: List<Backdrop>.from(
            json["backdrops"].map((x) => Backdrop.fromJson(x))),
        id: json["id"],
        logos:
            List<Backdrop>.from(json["logos"].map((x) => Backdrop.fromJson(x))),
        posters: List<Backdrop>.from(
            json["posters"].map((x) => Backdrop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "backdrops": List<dynamic>.from(backdrops.map((x) => x.toJson())),
        "id": id,
        "logos": List<dynamic>.from(logos.map((x) => x.toJson())),
        "posters": List<dynamic>.from(posters.map((x) => x.toJson())),
      };
}

class Backdrop {
  double aspectRatio;
  int height;
  String? iso6391;
  String filePath;
  double voteAverage;
  int voteCount;
  int width;

  Backdrop({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
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
