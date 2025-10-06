import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assignmet1/main.dart';

void main() {
  testWidgets('Travel App loads Home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TravelApp());

    // Let any async work finish
    await tester.pumpAndSettle();

    // Check that HomeScreen is displayed
    expect(find.text('Home'), findsOneWidget);

    // Check if bottom navigation exists
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Check if drawer exists
    expect(find.byType(Drawer), findsOneWidget);
  });
}
