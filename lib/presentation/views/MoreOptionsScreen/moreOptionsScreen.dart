import 'package:flutter/material.dart';

class MoreOptionsScreen extends StatelessWidget {
  const MoreOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'More Options',
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
