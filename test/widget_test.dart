import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travel_app_task/view/presentation/dashboard_screen/home_screen.dart';
import 'package:travel_app_task/view/presentation/dashboard_screen/share_screen.dart';
import 'package:travel_app_task/view/presentation/search_screen/search_screen.dart';

void main() {
  testWidgets('HomeScreen widget test', (WidgetTester tester) async {
    // Build the HomeScreen widget.
    await tester.pumpWidget(
        MaterialApp(
            home: HomeScreen()
        )
    );

    // Verify if the AppBar title is showing.
    expect(find.text("Hyderabad, India"), findsOneWidget);

    // Verify the Home Banner content is present.
    expect(find.text("Thailand"), findsOneWidget);
    expect(find.text("And Explore the world"), findsOneWidget);

    // Tap on the "Book Now" button in the banner.
    await tester.tap(find.text("Book Now"));
    await tester.pump();

    // Verify if the Category widget is present.
    expect(find.text("Categories"), findsOneWidget);

    // Verify if a category is visible.
    expect(find.text("Holidays"), findsOneWidget);
    expect(find.text("Rental"), findsOneWidget);

    // Simulate tap on a category and check if the state updates.
    await tester.tap(find.text("Holidays"));
    await tester.pump();

    // Check if the category selection works.
    expect(find.byWidgetPredicate((widget) => widget is Container && widget.decoration != null), findsWidgets);

    // Verify the Destination widget title.
    expect(find.text("What destination do you like to go to?"), findsOneWidget);

    // Tap on the "See More" button.
    await tester.tap(find.text("See More"));
    await tester.pump();

    // Verify presence of the destination images (Dubai image).
    expect(find.byType(Image), findsWidgets);
  });

  testWidgets('ShareScreen widget test', (WidgetTester tester) async {
    // Build the ShareScreen widget
    await tester.pumpWidget(
      MaterialApp(
        home: ShareScreen(),
      ),
    );

    // Check if the app bar title exists
    expect(find.text('The Holiday'), findsOneWidget);

    // Check if the "Post Story" text exists
    expect(find.text('Post Story'), findsOneWidget);

    // Find the story list view by key and perform a scroll action
    final storyListView = find.byKey(const Key('storyListView'));
    expect(storyListView, findsOneWidget);

    await tester.drag(storyListView, const Offset(-200, 0));
    await tester.pumpAndSettle();

    // Find the post list view by key
    final postListView = find.byKey(const Key('postListView'));
    expect(postListView, findsOneWidget);

    // Check for the post titles
    expect(find.textContaining('Travel can be Done'), findsOneWidget);
    expect(find.textContaining('Meals can be prepared'), findsOneWidget);

    // Check if the profile image in the post exists
    expect(find.byType(Image), findsWidgets);

    // Verify that the 'Follow' button exists in the post list
    expect(find.text('Follow'), findsWidgets);

    // Test tapping on the 'Follow' button
    await tester.tap(find.text('Follow').first);
    await tester.pump();

  });

  testWidgets('SearchScreen widget test', (WidgetTester tester) async {
    // Build the SearchScreen widget
    await tester.pumpWidget(
      const MaterialApp(
        home: SearchScreen(),
      ),
    );

    // Verify the AppBar title is correct
    expect(find.text('Search Result'), findsOneWidget);

    // Verify ListView is rendered
    expect(find.byType(ListView), findsOneWidget);

    // Verify a search result card is rendered
    expect(find.text('Manali - 5N/6 Days'), findsWidgets); // Multiple cards may be rendered

    // Verify the Trending tag exists
    expect(find.text('Trending'), findsWidgets);

    // Check if "Book Now" button is visible
    expect(find.text('Book Now'), findsWidgets);

    // Scroll the ListView to check more items
    await tester.drag(find.byType(ListView), const Offset(0, -200));
    await tester.pump();

    // Verify scrolling works and still finds elements
    expect(find.text('20,000 ₹'), findsWidgets);

    // Tap the "View Details" button to trigger an interaction
    await tester.tap(find.text('View Details').first);
    await tester.pump();

    // Tap the "Book Now" button to trigger an interaction
    await tester.tap(find.text('Book Now').first);
    await tester.pump();

    // Ensure the widget tree remains stable after interactions
    await tester.pumpAndSettle();
  });

}
