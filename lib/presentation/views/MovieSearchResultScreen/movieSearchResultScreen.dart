import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/config/color_constants.dart';
import 'package:tentwenty_movie_app/data/apis/movieAPIs.dart';
import 'package:tentwenty_movie_app/domain/models/moviesByGenreModel.dart';
import 'package:tentwenty_movie_app/presentation/widgets/searchResultWidget.dart';

class MovieSearchResultScreen extends StatefulWidget {
  final String selectedGenreId;
  const MovieSearchResultScreen({super.key, required this.selectedGenreId});

  @override
  State<MovieSearchResultScreen> createState() =>
      _MovieSearchResultScreenState();
}

class _MovieSearchResultScreenState extends State<MovieSearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieSearchResult>>(
      future: MovieAPIs.fetchMoviesByGenres(widget.selectedGenreId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
            ),
            body: const Center(
              child: CircularProgressIndicator(
                color: AppColors.ttDarkPurple,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
            ),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                '${snapshot.data?.length.toString()} results found',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: MovieResultList(
              movies: snapshot.data!,
            ),
          );
        }
      },
    );
  }
}

class MovieResultList extends StatelessWidget {
  final List<MovieSearchResult> movies;

  const MovieResultList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return SearchResultWidget(
          movie: movies[index],
        );
      },
    );
  }
}
