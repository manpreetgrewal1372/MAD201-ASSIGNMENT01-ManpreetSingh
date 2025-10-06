import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Travel App v1.0\n"
          "Created by Manpreet Singh - A00198842\n\n"
          "This app demonstrates Dart OOP, Stateful Widgets, Navigation, and App-wide State Management.",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
