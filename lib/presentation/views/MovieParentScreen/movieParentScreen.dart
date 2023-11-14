import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/presentation/views/MediaLibraryScreen/mediaLibraryScreen.dart';
import 'package:tentwenty_movie_app/presentation/views/MoreOptionsScreen/moreOptionsScreen.dart';
import 'package:tentwenty_movie_app/presentation/views/MovieDashboardScreen/movieDashboardScreen.dart';
import 'package:tentwenty_movie_app/presentation/views/MovieListScreen/movieListScreen.dart';

import '../../../config/themes/constants.dart';

class MovieParentScreen extends StatefulWidget {
  const MovieParentScreen({super.key});

  @override
  State<MovieParentScreen> createState() => _MovieParentScreenState();
}

class _MovieParentScreenState extends State<MovieParentScreen> {
  int _selectedIndex = 0;

  final _pages = [
    const MovieDashboardScreen(),
    MovieListScreen(),
    const MediaLibraryScreen(),
    const MoreOptionsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard_outlined,
                color: AppColors.ttGrey,
              ),
              label: 'Dashboard',
              activeIcon: Icon(
                Icons.dashboard_outlined,
                color: AppColors.ttOffWhite,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_outline,
                color: AppColors.ttGrey,
              ),
              label: 'Watch',
              activeIcon: Icon(
                Icons.play_circle_outline,
                color: AppColors.ttOffWhite,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.perm_media_outlined,
                color: AppColors.ttGrey,
              ),
              label: 'Media Library',
              activeIcon: Icon(
                Icons.perm_media_outlined,
                color: AppColors.ttOffWhite,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz,
                color: AppColors.ttGrey,
              ),
              label: 'More',
              activeIcon: Icon(
                Icons.more_horiz,
                color: AppColors.ttOffWhite,
              ),
            ),
          ],
          backgroundColor: AppColors.ttDarkPurple,
          selectedItemColor: AppColors.ttOffWhite,
          unselectedItemColor: AppColors.ttGrey,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
