import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/domain/models/upcomingMovieModel.dart';
import 'package:tentwenty_movie_app/presentation/views/MovieDetailScreen/movieDetailScreen.dart';
import 'package:tentwenty_movie_app/presentation/widgets/image_widget.dart';

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
            ImageWidget(
              imagePath: movie.posterPath,
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  // borderRadius:
                  //     BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0, 0.6, 1],
                  ),
                ),
              ),
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
