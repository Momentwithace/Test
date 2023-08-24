// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:test/main.dart'; // Import CardData class

// void main() {
//   test('Toggle favorite state', () {
//     final cardData = CardData(
//       imageUrl: 'https://via.placeholder.com/150',
//       title: 'Test Card',
//       description: 'Test Description',
//     );

//     expect(cardData.isFavorite, false);

//     cardData.isFavorite = true;
//     expect(cardData.isFavorite, true);

//     cardData.isFavorite = false;
//     expect(cardData.isFavorite, false);
//   });

//   testWidgets('List items are displayed correctly', (WidgetTester tester) async {
//     final List<CardData> dummyData = [
//       CardData(
//         imageUrl: 'https://via.placeholder.com/150',
//         title: 'Card 1',
//         description: 'Description for Card 1',
//       ),
//       // Add more dummy data here
//     ];

//     await tester.pumpWidget(MaterialApp(home: CardList(cards: "de", isFavorite: false,)));

//     // Verify if the list items are displayed correctly
//     expect(find.text('Card 1'), findsOneWidget);
//     // Add more assertions for other list items
//   });

//   testWidgets('Navigate from list to detail screen', (WidgetTester tester) async {
//     final List<CardData> dummyData = [
//       CardData(
//         imageUrl: 'https://via.placeholder.com/150',
//         title: 'Card 1',
//         description: 'Description for Card 1',
//       ),
//       // Add more dummy data here
//     ];

//     await tester.pumpWidget(MaterialApp(home: CardList(cards: dummyData)));

//     // Tap on the list item
//     await tester.tap(find.text('Card 1'));
//     await tester.pumpAndSettle();

//     // Verify if the detail screen is displayed
//     expect(find.text('Detail Screen'), findsOneWidget);
//     // Add more assertions for the detail screen content
//   });
// }

