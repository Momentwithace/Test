import 'package:flutter/material.dart';

import 'main.dart';

class DetailScreen extends StatelessWidget {
  final CardData cardData;

  DetailScreen({required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Column(
        children: [
          Image.network(cardData.imageUrl),
          ListTile(
            title: Text(cardData.title),
            subtitle: Text(cardData.description),
          ),
        ],
      ),
    );
  }
}
