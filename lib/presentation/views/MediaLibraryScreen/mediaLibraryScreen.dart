import 'package:flutter/material.dart';

class MediaLibraryScreen extends StatelessWidget {
  const MediaLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Media Library',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(
        child: Text("Nothing to see here..."),
      ),
    );
  }
}
