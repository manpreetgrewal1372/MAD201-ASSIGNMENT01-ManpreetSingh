import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "No bookings yet",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
