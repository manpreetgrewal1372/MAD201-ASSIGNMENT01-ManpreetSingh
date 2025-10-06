// This is  the destination file for the app
class Destination {
  final String name;
  final String country;
  final String description;
  final String imageUrl;
  bool isFavorite;
  bool isVisited;

  Destination({
    required this.name,
    required this.country,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
    this.isVisited = false,
  });
}

class TouristDestination extends Destination {
  final double rating;

  TouristDestination({
    required String name,
    required String country,
    required String description,
    required String imageUrl,
    this.rating = 4.5,
    bool isFavorite = false,
    bool isVisited = false,
  }) : super(
          name: name,
          country: country,
          description: description,
          imageUrl: imageUrl,
          isFavorite: isFavorite,
          isVisited: isVisited,
        );
}

class CulturalDestination extends Destination {
  final String famousFood;

  CulturalDestination({
    required String name,
    required String country,
    required String description,
    required String imageUrl,
    this.famousFood = "Delicious Food",
    bool isFavorite = false,
    bool isVisited = false,
  }) : super(
          name: name,
          country: country,
          description: description,
          imageUrl: imageUrl,
          isFavorite: isFavorite,
          isVisited: isVisited,
        );
}
