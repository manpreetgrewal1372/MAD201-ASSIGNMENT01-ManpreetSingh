/// MAD201-01 Cross Platform MA
/// Author: Manpreet Singh (A00198842)
/// Cross Platform Travel App demonstrating Dart OOP, Stateful Widgets, Navigation, and App State.

import 'package:flutter/material.dart';

void main() {
  runApp(TravelApp());
}

/// Data Models

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

  void toggleFavorite() => isFavorite = !isFavorite;
  void markVisited() => isVisited = true;
}

class TouristDestination extends Destination {
  final double rating;

  TouristDestination({
    required String name,
    required String country,
    required String description,
    required String imageUrl,
    required this.rating,
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
    required this.famousFood,
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

/// Repository

class DestinationRepository {
  final List<Destination> _destinations = [
    TouristDestination(
      name: "Paris",
      country: "France",
      description: "City of Love and Lights.",
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/a/af/Tour_Eiffel_Wikimedia_Commons.jpg",
      rating: 4.9,
    ),
    CulturalDestination(
      name: "Tokyo",
      country: "Japan",
      description: "Vibrant city with rich culture.",
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/1/14/Tokyo_Tower_and_surroundings.jpg",
      famousFood: "Sushi",
    ),
  ];

  List<Destination> getAllDestinations() => _destinations;

  void toggleFavorite(Destination d) => d.toggleFavorite();

  void markVisited(Destination d) => d.markVisited();

  Set<String> getVisitedCountries() =>
      _destinations.where((d) => d.isVisited).map((d) => d.country).toSet();
}

/// App State

class TravelAppState extends StatefulWidget {
  final Widget child;

  TravelAppState({required this.child});

  static _TravelAppStateState of(BuildContext context) {
    return context.findAncestorStateOfType<_TravelAppStateState>()!;
  }

  @override
  _TravelAppStateState createState() => _TravelAppStateState();
}

class _TravelAppStateState extends State<TravelAppState> {
  final DestinationRepository repository = DestinationRepository();
  bool isDarkMode = false;

  void toggleFavorite(Destination d) {
    setState(() => repository.toggleFavorite(d));
  }

  void markVisited(Destination d) {
    setState(() => repository.markVisited(d));
  }

  void toggleDarkMode() {
    setState(() => isDarkMode = !isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// Main App

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TravelAppState(
      child: Builder(builder: (context) {
        final state = TravelAppState.of(context);
        return MaterialApp(
          title: "Travel App",
          theme: state.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          initialRoute: '/',
          routes: {
            '/': (context) => MainScreen(),
            '/profile': (context) => ProfileScreen(),
            '/about': (context) => AboutScreen(),
            '/settings': (context) => SettingsScreen(),
          },
        );
      }),
    );
  }
}

/// Main Screen with Bottom Navigation

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    BookingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Travel App")),
      drawer: AppDrawer(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

/// Drawer

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text("Menu")),
          ListTile(
            title: Text("Settings"),
            onTap: () => Navigator.pushNamed(context, '/settings'),
          ),
          ListTile(
            title: Text("Help"),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Help is not available")));
            },
          ),
          ListTile(
            title: Text("About"),
            onTap: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
    );
  }
}

/// Home Screen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = "";
  String sortOption = "Name";

  @override
  Widget build(BuildContext context) {
    final state = TravelAppState.of(context);
    List<Destination> destinations = state.repository.getAllDestinations();

    // Search filter
    if (searchQuery.isNotEmpty) {
      destinations = destinations
          .where((d) => d.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              d.country.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }

    // Sort
    if (sortOption == "Name") {
      destinations.sort((a, b) => a.name.compareTo(b.name));
    } else if (sortOption == "Country") {
      destinations.sort((a, b) => a.country.compareTo(b.country));
    } else if (sortOption == "Rating") {
      destinations.sort((a, b) {
        double ratingA = (a is TouristDestination) ? a.rating : 0;
        double ratingB = (b is TouristDestination) ? b.rating : 0;
        return ratingB.compareTo(ratingA);
      });
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(labelText: "Search"),
            onChanged: (value) => setState(() => searchQuery = value),
          ),
        ),
        DropdownButton<String>(
          value: sortOption,
          items: ["Name", "Country", "Rating"]
              .map((e) => DropdownMenuItem(value: e, child: Text("Sort by $e")))
              .toList(),
          onChanged: (value) => setState(() => sortOption = value!),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              Destination d = destinations[index];
              return ListTile(
                leading: Stack(
                  children: [
                    Image.network(d.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
                    if (d.isVisited)
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          color: Colors.green,
                          padding: EdgeInsets.all(2),
                          child: Text("Visited", style: TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                  ],
                ),
                title: Text(d.name),
                subtitle: Text(d.country),
                trailing: IconButton(
                  icon: Icon(d.isFavorite ? Icons.star : Icons.star_border, color: Colors.yellow),
                  onPressed: () => state.toggleFavorite(d),
                ),
                onTap: () async {
                  final updated = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DetailsScreen(destination: d)),
                  );
                  if (updated != null) setState(() {});
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Details Screen

class DetailsScreen extends StatelessWidget {
  final Destination destination;

  DetailsScreen({required this.destination});

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
                Image.network(destination.imageUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
                if (destination.isVisited)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      color: Colors.green,
                      padding: EdgeInsets.all(5),
                      child: Text("Visited", style: TextStyle(color: Colors.white)),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(destination.description, style: TextStyle(fontSize: 16)),
            ),
            if (destination is TouristDestination)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Rating: ${(destination as TouristDestination).rating}", style: TextStyle(fontSize: 16)),
              ),
            if (destination is CulturalDestination)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Famous Food: ${(destination as CulturalDestination).famousFood}", style: TextStyle(fontSize: 16)),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    state.markVisited(destination);
                    Navigator.pop(context, destination);
                  },
                  child: Text("Mark as Visited"),
                ),
                ElevatedButton(
                  onPressed: () {
                    state.toggleFavorite(destination);
                    Navigator.pop(context, destination);
                  },
                  child: Text(destination.isFavorite ? "Remove Favorite" : "Add to Favorites"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Profile Screen

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = TravelAppState.of(context);
    final visited = state.repository.getAllDestinations().where((d) => d.isVisited).toList();
    final favorites = state.repository.getAllDestinations().where((d) => d.isFavorite).toList();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Info"),
              Tab(text: "Visited"),
              Tab(text: "Stats"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Name: Manpreet Singh\nTraveler Level: Beginner")),
            ListView.builder(
              itemCount: visited.length,
              itemBuilder: (context, index) => ListTile(title: Text(visited[index].name)),
            ),
            Column(
              children: [
                Text("Favorites: ${favorites.length}"),
                Text("Visited Countries: ${state.repository.getVisitedCountries().length}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// About Screen

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: Center(child: Text("This is a Travel App built for MAD201.")),
    );
  }
}

/// Settings Screen

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = TravelAppState.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(
        child: SwitchListTile(
          title: Text("Dark Mode"),
          value: state.isDarkMode,
          onChanged: (val) => state.toggleDarkMode(),
        ),
      ),
    );
  }
}

/// Bookings Screen

class BookingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("No bookings yet."));
  }
}
