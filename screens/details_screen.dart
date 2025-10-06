import 'package:assignmet1/state/travel_app_state.dart';
import 'package:flutter/material.dart';
import '../models/destination.dart';

class DetailsScreen extends StatelessWidget {
  final Destination destination;

  const DetailsScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final state = TravelAppState.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(destination.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  destination.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                if (destination.isVisited)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.green,
                      child: const Text(
                        "Visited",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(destination.description, style: const TextStyle(fontSize: 16)),
            ),
            if (destination is TouristDestination)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Rating: ${(destination as TouristDestination).rating}"),
              ),
            if (destination is CulturalDestination)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Famous Food: ${(destination as CulturalDestination).famousFood}"),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    state.destinationRepository.markVisited(destination);
                    Navigator.pop(context, destination);
                  },
                  child: const Text("Mark as Visited"),
                ),
                ElevatedButton(
                  onPressed: () {
                    state.destinationRepository.toggleFavorite(destination);
                    Navigator.pop(context, destination);
                  },
                  child: const Text("Add to Favorites"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
