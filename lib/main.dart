import 'package:flutter/material.dart';
import 'api_service.dart'; // Import ApiService class
import 'detail_screen.dart'; // Import DetailScreen class

void main() {
  runApp(MyApp());
}

// Define the data structure for each card
class CardData {
  final String imageUrl;
  final String title;
  final String description;
  bool isFavorite;

  CardData({
    required this.imageUrl,
    required this.title,
    required this.description,
    this.isFavorite = false,
  });

  // Factory constructor to create CardData from JSON
  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description'],
      isFavorite: false,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Card List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Card List'),
        ),
        body: CardList(), // Use CardList widget
      ),
    );
  }
}

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List<CardData> _cards = [];
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final List<dynamic> fetchedData = await ApiService.fetchData();
      final List<CardData> fetchedCards =
          fetchedData.map((item) => CardData.fromJson(item)).toList();
      setState(() {
        _cards.addAll(fetchedCards);
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _errorMessage = 'Failed to fetch data. Please try again.';
        _isLoading = false;
      });
    }
  }

  void _retryFetch() {
    _fetchData();
  }

  void _navigateToDetailScreen(CardData cardData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(cardData: cardData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Display a loading indicator while fetching data
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_errorMessage.isNotEmpty) {
      // Display error message and retry button if fetching data failed
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _retryFetch,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    } else {
      // Display the list of cards
      return ListView.builder(
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _navigateToDetailScreen(_cards[index]),
  child: Card(
    child: Column(
      children: [
        Image.network(_cards[index].imageUrl),
        ListTile(
          title: Text(_cards[index].title),
          subtitle: Text(_cards[index].description),
        ),
      ],
    ),
  ),
          );
        },
      );
    }
  }
}
