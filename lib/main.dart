import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/config/color_constants.dart';
import 'package:tentwenty_movie_app/presentation/views/MovieParentScreen/movieParentScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.ttDarkPurple,
        fontFamily: 'Poppins',
      ),
      home: const MovieParentScreen(),
    );
  }
}
