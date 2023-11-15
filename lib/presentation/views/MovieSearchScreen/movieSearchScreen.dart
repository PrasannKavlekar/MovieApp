import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/config/color_constants.dart';
import 'package:tentwenty_movie_app/data/apis/movieAPIs.dart';
import 'package:tentwenty_movie_app/domain/models/generic/genreModel.dart';
import 'package:tentwenty_movie_app/domain/models/moviesByGenreModel.dart';
import 'package:tentwenty_movie_app/presentation/views/MovieSearchScreen/widgets/searchGridCardWidget.dart';
import 'package:tentwenty_movie_app/presentation/widgets/searchResultWidget.dart';

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

  String get getSearchText {
    return _searchController.text;
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
                suffixIcon: getSearchText.isNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.close_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                          });
                        },
                      )
                    : null,
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.ttOffWhite,
      body: getSearchText.isEmpty
          ? const FutureGenreBuilder()
          : FutureSearchResultListBuilder(
              searchText: getSearchText,
            ),
    );
  }
}

class FutureGenreBuilder extends StatelessWidget {
  const FutureGenreBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Genre>>(
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

class FutureSearchResultListBuilder extends StatelessWidget {
  final String searchText;

  const FutureSearchResultListBuilder({super.key, required this.searchText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieSearchResult>>(
      future: MovieAPIs.fetchSearchResults(searchText),
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
          return SearchResultsList(movies: snapshot.data!);
        }
      },
    );
  }
}

class SearchResultsList extends StatelessWidget {
  final List<MovieSearchResult> movies;

  const SearchResultsList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return SearchResultWidget(movie: movies[index]);
      },
    );
  }
}
