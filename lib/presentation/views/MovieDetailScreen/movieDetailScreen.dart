import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/config/themes/constants.dart';
import 'package:tentwenty_movie_app/data/apis/movieAPIs.dart';
import 'package:tentwenty_movie_app/domain/models/movieDetailsModel.dart';
import 'package:tentwenty_movie_app/utils/dateutils/dateUtils.dart';

class MovieDetailScreen extends StatefulWidget {
  final String movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();

    debugPrint("ID: ${widget.movieId}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Watch',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            overflow: TextOverflow.ellipsis,
            // shadows: <Shadow>[
            //   Shadow(
            //     offset: Offset(1.0, 1.0),
            //     blurRadius: 1.0,
            //     color: Color.fromARGB(255, 0, 0, 0),
            //   ),
            // ],
          ),
        ),
        backgroundColor: const Color(0x00000000),
        elevation: 0,
      ),
      body: FutureBuilder<MovieDetailsModel>(
        future: MovieAPIs.fetchMovieDetails(widget.movieId),
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
            var movieData = snapshot.data;

            return SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.7,
                            width: double.infinity,
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movieData!.backdropPath}',
                              fit: BoxFit.cover,
                            ),
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
                          Container(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: IntrinsicWidth(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'In Theaters ${MovieDateUtils.formatReleaseDate(movieData.releaseDate)}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.ttLightBlue,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 60, vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text('Get Tickets'),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        width: 1.0,
                                        color: AppColors.ttLightBlue,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: RichText(
                                      text: const TextSpan(
                                        children: [
                                          WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.middle,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                              child: Icon(Icons.play_arrow),
                                            ),
                                          ),
                                          WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.middle,
                                            child: Text('Watch Trailer'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
