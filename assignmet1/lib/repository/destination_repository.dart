import '../models/destination.dart';

class DestinationRepository {
  final List<Destination> _destinations = [
    TouristDestination(
      name: "Paris",
      country: "France",
      description: "The city of lights with stunning architecture, art, and culture.",
      imageUrl:
          "https://images.pexels.com/photos/15011405/pexels-photo-15011405.jpeg",
      rating: 4.8,
    ),
    CulturalDestination(
      name: "Kyoto",
      country: "Japan",
      description: "Traditional temples, gardens, and rich Japanese culture.",
      imageUrl:
          "https://images.pexels.com/photos/156441932/pexels-photo-156441932.jpeg",
      famousFood: "Kaiseki",
    ),
    TouristDestination(
      name: "Toronto",
      country: "Canada",
      description: "A bustling city with diverse culture and amazing skyline.",
      imageUrl:
          "https://images.pexels.com/photos/13449219/pexels-photo-13449219.jpeg",
      rating: 4.6,
    ),
    CulturalDestination(
      name: "Geneva",
      country: "Switzerland",
      description: "Known for lakes, mountains, and luxury lifestyle.",
      imageUrl:
          "https://images.pexels.com/photos/8471279/pexels-photo-8471279.jpeg",
      famousFood: "Fondue",
    ),
    TouristDestination(
      name: "Rome",
      country: "Italy",
      description: "Rich in history with stunning architecture and cuisine.",
      imageUrl:
          "https://images.pexels.com/photos/10554851/pexels-photo-10554851.jpeg",
      rating: 4.7,
    ),
    CulturalDestination(
      name: "Berlin",
      country: "Germany",
      description: "A vibrant city with a blend of history and modern life.",
      imageUrl:
          "https://images.pexels.com/photos/25053929/pexels-photo-25053929.jpeg",
      famousFood: "Currywurst",
    ),
    TouristDestination(
      name: "Barcelona",
      country: "Spain",
      description: "Famous for art, architecture, and Mediterranean beaches.",
      imageUrl:
          "https://images.pexels.com/photos/33071757/pexels-photo-33071757.jpeg",
      rating: 4.5,
    ),
    CulturalDestination(
      name: "Vienna",
      country: "Austria",
      description: "A cultural hub known for music, art, and coffee houses.",
      imageUrl:
          "https://images.pexels.com/photos/15080509/pexels-photo-15080509.jpeg",
      famousFood: "Sachertorte",
    ),
  ];

  List<Destination> getAllDestinations() => _destinations;

  void toggleFavorite(Destination d) {
    d.isFavorite = !d.isFavorite;
  }

  void markVisited(Destination d) {
    d.isVisited = true;
  }

  Set<String> getVisitedCountries() {
    return _destinations
        .where((d) => d.isVisited)
        .map((d) => d.country)
        .toSet();
  }
}
