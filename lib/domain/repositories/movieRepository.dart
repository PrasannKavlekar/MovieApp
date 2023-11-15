import 'package:tentwenty_movie_app/data/apis/movieAPIs.dart';
import 'package:tentwenty_movie_app/domain/models/generic/genreModel.dart';

class MovieRepository {
  static Future<String> getGenreNameById(int genreId) async {
    ///Make an API call for genre list with the ID received
    List<Genre> genreList = await MovieAPIs.fetchGenres();

    Genre matchedGenre = genreList.firstWhere((genre) => genre.id == genreId);
    return matchedGenre.name;
  }
}
