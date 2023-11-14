import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/config/themes/constants.dart';
import 'package:tentwenty_movie_app/data/apis/movieAPIs.dart';
import 'package:tentwenty_movie_app/domain/models/upcomingMovieModel.dart';
import 'package:tentwenty_movie_app/presentation/widgets/movieCardWidget.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    // fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Watch',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.ttOffWhite,
      body: Container(
        margin: const EdgeInsets.only(top: 16),
        child: FutureBuilder<List<UpcomingMovieModel>>(
          future: MovieAPIs.fetchMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.ttDarkPurple,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return MovieList(movies: snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<UpcomingMovieModel> movies;

  const MovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index]);
      },
    );
  }
}
