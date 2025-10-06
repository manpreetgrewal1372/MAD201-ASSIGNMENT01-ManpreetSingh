import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://www.pexels.com/photo/man-in-red-sweater-12345678/', // Replace with your chosen image URL
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Manpreet Singh',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'A00198842',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
