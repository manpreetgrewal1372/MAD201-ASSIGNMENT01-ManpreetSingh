/// MAD201-01 - Assignment 1
/// Student: YOUR_FULL_NAME  (YOUR_STUDENT_ID)
/// Short: List tile widget used in Home and Visited lists.

import 'package:flutter/material.dart';
import '../models/destination.dart';

class DestinationTile extends StatelessWidget {
  final Destination destination;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  const DestinationTile({
    Key? key,
    required this.destination,
    required this.onTap,
    required this.onFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 72,
        height: 72,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            destination.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: Colors.grey),
          ),
        ),
      ),
      title: Text(destination.name),
      subtitle: Text(destination.country),
      trailing: IconButton(
        icon: Icon(destination.isFavorite ? Icons.star : Icons.star_border),
        onPressed: onFavorite,
      ),
      onTap: onTap,
    );
  }
}
