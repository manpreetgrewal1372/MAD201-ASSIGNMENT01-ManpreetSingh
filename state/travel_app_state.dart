import 'package:assignmet1/models/user_profile.dart';
import 'package:assignmet1/repository/destination_repository.dart';
import 'package:flutter/material.dart';

class TravelAppState extends StatefulWidget {
  final Widget child;

  const TravelAppState({super.key, required this.child});

  static TravelAppStateData of(BuildContext context) {
    final _TravelAppState? state =
        context.findAncestorStateOfType<_TravelAppState>();
    return state!.data;
  }

  @override
  State<TravelAppState> createState() => _TravelAppState();
}

class TravelAppStateData {
  final DestinationRepository destinationRepository;
  final UserProfile userProfile;
  bool isDarkMode;

  TravelAppStateData({
    required this.destinationRepository,
    required this.userProfile,
    this.isDarkMode = false,
  });
}

class _TravelAppState extends State<TravelAppState> {
  late TravelAppStateData data;

  @override
  void initState() {
    super.initState();
    data = TravelAppStateData(
      destinationRepository: DestinationRepository(),
      userProfile: UserProfile(
        name: "Manpreet Singh",
        travelerLevel: "Intermediate",
        profilePictureUrl:
            "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
