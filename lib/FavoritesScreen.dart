import 'package:flutter/material.dart';

class FavoritesScreen  extends StatelessWidget {
  final List<Map<String, dynamic>> favoritesList;

  FavoritesScreen({required this.favoritesList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoritesList.length,
        itemBuilder: (context, index) {
          final recipe = favoritesList[index];
          return ListTile(
            title: Text(favoritesList[index]['name']),
            // Add more details or actions as needed
          );
        },
      ),
    );
  }
}
