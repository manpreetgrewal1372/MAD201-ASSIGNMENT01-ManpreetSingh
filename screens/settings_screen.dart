import 'package:assignmet1/state/travel_app_state.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = TravelAppState.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Dark Mode", style: TextStyle(fontSize: 18)),
                Switch(
                  value: state.isDarkMode,
                  onChanged: (val) {
                    state.isDarkMode = val;
                    (context as Element).markNeedsBuild();
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Settings placeholder", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
