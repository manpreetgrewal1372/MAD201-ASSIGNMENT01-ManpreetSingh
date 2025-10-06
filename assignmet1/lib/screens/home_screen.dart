import 'package:assignmet1/state/travel_app_state.dart';
import 'package:flutter/material.dart';
import '../models/destination.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = TravelAppState.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView.builder(
        itemCount: state.destinationRepository.getAllDestinations().length,
        itemBuilder: (context, index) {
          Destination dest = state.destinationRepository.getAllDestinations()[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(
                dest.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const CircularProgressIndicator();
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image);
                },
              ),
              title: Text(dest.name),
              subtitle: Text(dest.country),
              trailing: IconButton(
                icon: Icon(dest.isFavorite ? Icons.star : Icons.star_border),
                onPressed: () {
                  state.destinationRepository.toggleFavorite(dest);
                  (context as Element).markNeedsBuild();
                },
              ),
              onTap: () async {
                final updated = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailsScreen(destination: dest)),
                );
                if (updated != null) {
                  (context as Element).markNeedsBuild();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
