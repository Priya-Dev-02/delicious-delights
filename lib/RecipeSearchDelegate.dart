import 'package:flutter/material.dart';
import 'ContDetailsScreen.dart';
class RecipeSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, dynamic>> recipes;

  RecipeSearchDelegate(this.recipes);

  @override
  List<Widget> buildActions(BuildContext context) {
    final String queryText = query ?? '';
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = recipes
        .where((recipe) => recipe["name"].toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No recipe found 😢",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Image.asset("assets/food/sad.png", height: 80.0, width: 80.0),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final recipe = results[index];
        return ListTile(
          title: Text(recipe["name"]),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ContDetailsScreen(
                  recipe["name"],
                  recipe["image"],
                  recipe["calories"],
                  recipe["time"],
                  recipe["reci"],
                  recipe["price"],
                  recipe["ingredients"],
                  recipe["videoUrl"],

                ),

              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = recipes
        .where((recipe) => recipe["name"].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final recipe = suggestions[index];
        return ListTile(
          title: Text(recipe["name"]),
          onTap: () {
            showResults(context);
          },
        );
      },
    );
  }
}
