// Basic smoke test for the Ticket App.
//
// Verifies the app builds without throwing and that the bottom
// navigation bar with all four tabs renders on launch.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ticket_app/main.dart';

void main() {
  testWidgets('App launches and shows bottom nav with all tabs', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Bottom navigation bar is present.
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // All four tabs are labeled correctly.
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Tickets'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    // Home tab is selected by default (index 0).
    final navBar = tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
    expect(navBar.currentIndex, 0);
  });

  testWidgets('Tapping Tickets tab switches view', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Tickets'));
    await tester.pumpAndSettle();

    final navBar = tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
    expect(navBar.currentIndex, 2);
  });
}
