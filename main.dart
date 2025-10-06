/// F2025 MAD201-01 Cross Platform MA
/// Manpreet Singh - A00198842
/// Main entry point for the travel app.

import 'package:assignmet1/state/travel_app_state.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/about_screen.dart';
import 'screens/bookings_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TravelAppState(
      child: Builder(
        builder: (context) {
          final state = TravelAppState.of(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Travel App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: '/',
            routes: {
              '/': (_) => const MainNavigation(),
              '/settings': (_) => const SettingsScreen(),
              '/about': (_) => const AboutScreen(),
            },
          );
        },
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeScreen(),
    BookingsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Travel App Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
            ListTile(
              title: const Text("Help"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Help is coming soon!")),
                );
              },
            ),
            ListTile(
              title: const Text("About"),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
          ],
        ),
      ),
    );
  }
}
