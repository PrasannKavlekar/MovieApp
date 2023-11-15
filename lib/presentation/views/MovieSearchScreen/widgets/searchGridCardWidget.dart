import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/presentation/views/MovieSearchResultScreen/movieSearchResultScreen.dart';
import 'package:tentwenty_movie_app/utils/generic/colorUtils.dart';

class SearchGridCardWidget extends StatelessWidget {
  final String genreName;
  final String genreId;
  const SearchGridCardWidget(
      {super.key, required this.genreName, required this.genreId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MovieSearchResultScreen(selectedGenreId: genreId),
          ),
        );
      },
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.center,
        fit: StackFit.expand,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorUtils.getRandomColor(),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            width: MediaQuery.of(context).size.width *
                0.90, //! so that the `Text` widget knows where it overflows
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                genreName,
                softWrap: true,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
