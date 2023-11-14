import 'package:flutter/material.dart';

class MovieDashboardScreen extends StatelessWidget {
  const MovieDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
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
