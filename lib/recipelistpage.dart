import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RecipeListPage extends StatefulWidget {
  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  String name = ''; // Variable to store recipe name
  String ingredients = ''; // Variable to store recipe ingredients

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        title: Text('Recipe Book'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('recipes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Handle the case when data is still loading
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            // Handle the case when an error occurs
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // Now we know that snapshot.data is not null
          final recipes = snapshot.data!.docs; // List of recipe documents

          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipeData =
                  recipes[index].data() as Map<String, dynamic>; // Recipe data
              final name = recipeData['name'] ?? 'No Name';
              final ingredients = recipeData['ingredients'] ?? 'No Ingredients';
              final fullRecipe = recipeData['full_recipe'] ?? '';
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailPage(
                        name: name,
                        ingredients: ingredients,
                        fullRecipe: fullRecipe,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text(
                        name,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddRecipePage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final String name;
  final String ingredients;
  final String fullRecipe;

  RecipeDetailPage({
    required this.name,
    required this.ingredients,
    required this.fullRecipe,
  });

  @override
  Widget build(BuildContext context) {
    List<String> ingredientList = ingredients.split('\n');

    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ingredientList
                  .map((ingredient) => Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.brightness_1, size: 8),
                            SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                ingredient,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Full Recipe:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              fullRecipe,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class AddRecipePage extends StatefulWidget {
  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _fullRecipeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _ingredientsController,
              decoration: InputDecoration(labelText: 'Ingredients'),
              maxLines: 4,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _fullRecipeController,
              decoration: InputDecoration(labelText: 'Full Recipe'),
              maxLines: 8,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add recipe to Firestore
                FirebaseFirestore.instance.collection('recipes').add({
                  'name': _nameController.text,
                  'ingredients': _ingredientsController.text,
                  'full_recipe': _fullRecipeController.text,
                });
                Navigator.pop(context); // Close add recipe page
              },
              child: Text('Save Recipe'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ingredientsController.dispose();
    _fullRecipeController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: RecipeListPage(),
  ));
}
