import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/config/color_constants.dart';
import 'package:tentwenty_movie_app/domain/models/moviesByGenreModel.dart';
import 'package:tentwenty_movie_app/domain/repositories/movieRepository.dart';
import 'package:tentwenty_movie_app/presentation/widgets/image_widget.dart';

class SearchResultWidget extends StatelessWidget {
  final MovieSearchResult movie;
  const SearchResultWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 130,
          height: 100,
          margin: const EdgeInsets.all(16),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ImageWidget(
            imagePath: movie.posterPath,
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              FutureBuilder<String>(
                future: movie.genreIds.isNotEmpty
                    ? MovieRepository.getGenreNameById(movie.genreIds.first)
                    : null,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    String? genreName = snapshot.data;
                    return Text(
                      genreName ?? "",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(
            Icons.more_horiz_outlined,
            color: AppColors.ttLightBlue,
          ),
        ),
      ],
    );
  }
}
