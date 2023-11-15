import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/config/themes/constants.dart';
import 'package:tentwenty_movie_app/data/apis/movieAPIs.dart';
import 'package:tentwenty_movie_app/domain/models/generic/genreModel.dart';
import 'package:tentwenty_movie_app/presentation/widgets/searchGridCardWidget.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: "TV Shows, movies and more",
                fillColor: AppColors.ttOffWhite,
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.close_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.ttOffWhite,
      body: FutureBuilder<List<Genre>>(
        future: MovieAPIs.fetchGenres(),
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
            return GenreList(genres: snapshot.data!);
          }
        },
      ),
    );
  }
}

class GenreList extends StatelessWidget {
  final List<Genre> genres;

  const GenreList({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GridView.builder(
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return SearchGridCardWidget(
            genreName: genres[index].name,
            genreId: genres[index].id.toString(),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 8.0, // spacing between rows
          crossAxisSpacing: 8.0, // spacing between columns
        ),
      ),
    );
  }
}
