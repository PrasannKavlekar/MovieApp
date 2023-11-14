import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/domain/models/upcomingMovieModel.dart';
import 'package:tentwenty_movie_app/presentation/views/MovieDetailScreen/movieDetailScreen.dart';

class MovieCard extends StatelessWidget {
  final UpcomingMovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movieId: movie.id.toString(),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: MediaQuery.of(context).size.height / 4,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.center,
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 4,
              left: 4,
              width: MediaQuery.of(context).size.width *
                  0.90, //! so that the `Text` widget knows where it overflows
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  movie.title,
                  softWrap: true,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 1.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
