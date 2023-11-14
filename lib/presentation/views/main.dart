import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/config/themes/constants.dart';
import 'package:tentwenty_movie_app/presentation/views/MovieParentScreen/movieParentScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upcoming Movies App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.ttDarkPurple,
      ),
      home: const MovieParentScreen(),
    );
  }
}
