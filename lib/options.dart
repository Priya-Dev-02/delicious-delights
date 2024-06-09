import 'package:flutter/material.dart';

// Define enum for cuisine type
enum CuisineType { Italian, Mexican, Indian, Chinese,American }

// Define enum for recipe type
enum RecipeType { Snack, Breakfast, Lunch, Dinner }

// Sample Recipe class
class Recipe {
  final String name;
  final RecipeType type;
  final CuisineType cuisine;
  final int cookingTime; // in minutes

  Recipe({required this.name, required this.type, required this.cuisine, required this.cookingTime});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecipeScreen(),
    );
  }
}

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  // Sample list of recipes
  List<Recipe> _recipes = [
    Recipe(name: 'Spaghetti Carbonara', type: RecipeType.Dinner, cuisine: CuisineType.Italian, cookingTime: 30),
    Recipe(name: 'Pancakes', type: RecipeType.Breakfast, cuisine: CuisineType.American, cookingTime: 20),
    Recipe(name: 'Tacos', type: RecipeType.Lunch, cuisine: CuisineType.Mexican, cookingTime: 25),
    Recipe(name: 'Butter Chicken', type: RecipeType.Dinner, cuisine: CuisineType.Indian, cookingTime: 40),
    Recipe(name: 'Mapo Tofu', type: RecipeType.Dinner, cuisine: CuisineType.Chinese, cookingTime: 35),
    Recipe(name: 'Granola Bars', type: RecipeType.Snack, cuisine: CuisineType.American, cookingTime: 10),
    Recipe(name: 'Spaghetti Carbonara', type: RecipeType.Dinner, cuisine: CuisineType.Italian, cookingTime: 30),
    Recipe(name: 'Pancakes', type: RecipeType.Breakfast, cuisine: CuisineType.American, cookingTime: 20),
    Recipe(name: 'Tacos', type: RecipeType.Lunch, cuisine: CuisineType.Mexican, cookingTime: 25),
    Recipe(name: 'Butter Chicken', type: RecipeType.Dinner, cuisine: CuisineType.Indian, cookingTime: 40),
    Recipe(name: 'Mapo Tofu', type: RecipeType.Dinner, cuisine: CuisineType.Chinese, cookingTime: 35),
    Recipe(name: 'Granola Bars', type: RecipeType.Snack, cuisine: CuisineType.American, cookingTime: 10),
    Recipe(name: 'Spaghetti Carbonara', type: RecipeType.Dinner, cuisine: CuisineType.Italian, cookingTime: 30),
    Recipe(name: 'Pancakes', type: RecipeType.Breakfast, cuisine: CuisineType.American, cookingTime: 20),
    Recipe(name: 'Tacos', type: RecipeType.Lunch, cuisine: CuisineType.Mexican, cookingTime: 25),
    Recipe(name: 'Butter Chicken', type: RecipeType.Dinner, cuisine: CuisineType.Indian, cookingTime: 40),
    Recipe(name: 'Mapo Tofu', type: RecipeType.Dinner, cuisine: CuisineType.Chinese, cookingTime: 35),
    Recipe(name: 'Granola Bars', type: RecipeType.Snack, cuisine: CuisineType.American, cookingTime: 10),
    Recipe(name: 'Spaghetti Carbonara', type: RecipeType.Dinner, cuisine: CuisineType.Italian, cookingTime: 30),
    Recipe(name: 'Pancakes', type: RecipeType.Breakfast, cuisine: CuisineType.American, cookingTime: 20),
    Recipe(name: 'Tacos', type: RecipeType.Lunch, cuisine: CuisineType.Mexican, cookingTime: 25),
    Recipe(name: 'Butter Chicken', type: RecipeType.Dinner, cuisine: CuisineType.Indian, cookingTime: 40),
    Recipe(name: 'Mapo Tofu', type: RecipeType.Dinner, cuisine: CuisineType.Chinese, cookingTime: 35),
    Recipe(name: 'Granola Bars', type: RecipeType.Snack, cuisine: CuisineType.American, cookingTime: 10),
    Recipe(name: 'Spaghetti Carbonara', type: RecipeType.Dinner, cuisine: CuisineType.Italian, cookingTime: 30),
    Recipe(name: 'Pancakes', type: RecipeType.Breakfast, cuisine: CuisineType.American, cookingTime: 20),
    Recipe(name: 'Tacos', type: RecipeType.Lunch, cuisine: CuisineType.Mexican, cookingTime: 25),
    Recipe(name: 'Butter Chicken', type: RecipeType.Dinner, cuisine: CuisineType.Indian, cookingTime: 40),
    Recipe(name: 'Mapo Tofu', type: RecipeType.Dinner, cuisine: CuisineType.Chinese, cookingTime: 35),
    Recipe(name: 'Granola Bars', type: RecipeType.Snack, cuisine: CuisineType.American, cookingTime: 10),
    Recipe(name: 'Spaghetti Carbonara', type: RecipeType.Dinner, cuisine: CuisineType.Italian, cookingTime: 30),
    Recipe(name: 'Pancakes', type: RecipeType.Breakfast, cuisine: CuisineType.American, cookingTime: 20),
    Recipe(name: 'Tacos', type: RecipeType.Lunch, cuisine: CuisineType.Mexican, cookingTime: 25),
    Recipe(name: 'Butter Chicken', type: RecipeType.Dinner, cuisine: CuisineType.Indian, cookingTime: 40),
    Recipe(name: 'Mapo Tofu', type: RecipeType.Dinner, cuisine: CuisineType.Chinese, cookingTime: 35),
    Recipe(name: 'Granola Bars', type: RecipeType.Snack, cuisine: CuisineType.American, cookingTime: 10),


  ];

  // Variables to store filter selections
  String? _selectedName;
  RecipeType? _selectedType;
  CuisineType? _selectedCuisine;
  int? _selectedCookingTime;

  // Function to apply filters
  List<Recipe> _applyFilters() {
    return _recipes.where((recipe) {
      bool nameCondition = _selectedName == null || recipe.name.toLowerCase().contains(_selectedName!.toLowerCase());
      bool typeCondition = _selectedType == null || recipe.type == _selectedType;
      bool cuisineCondition = _selectedCuisine == null || recipe.cuisine == _selectedCuisine;
      bool timeCondition = _selectedCookingTime == null || recipe.cookingTime <= _selectedCookingTime!;
      return nameCondition && typeCondition && cuisineCondition && timeCondition;
    }).toList();
  }

  // Build filter options UI
  Widget _buildFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: (value) {
            setState(() {
              _selectedName = value;
            });
          },
          decoration: InputDecoration(labelText: 'Recipe Name'),
        ),
        DropdownButtonFormField<RecipeType>(
          value: _selectedType,
          onChanged: (value) {
            setState(() {
              _selectedType = value;
            });
          },
          items: RecipeType.values.map((type) {
            return DropdownMenuItem<RecipeType>(
              value: type,
              child: Text(type.toString().split('.').last),
            );
          }).toList(),
          decoration: InputDecoration(labelText: 'Recipe Type'),
        ),
        DropdownButtonFormField<CuisineType>(
          value: _selectedCuisine,
          onChanged: (value) {
            setState(() {
              _selectedCuisine = value;
            });
          },
          items: CuisineType.values.map((cuisine) {
            return DropdownMenuItem<CuisineType>(
              value: cuisine,
              child: Text(cuisine.toString().split('.').last),
            );
          }).toList(),
          decoration: InputDecoration(labelText: 'Cuisine'),
        ),
        Slider(
          value: (_selectedCookingTime ?? 60).toDouble(),
          min: 0,
          max: 60,
          divisions: 12,
          onChanged: (value) {
            setState(() {
              _selectedCookingTime = value.round();
            });
          },
          label: 'Cooking Time (${_selectedCookingTime ?? 60} mins)',
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {});
          },
          child: Text('Apply Filters'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe App')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFilters(),
          Expanded(
            child: ListView.builder(
              itemCount: _applyFilters().length,
              itemBuilder: (context, index) {
                final recipe = _applyFilters()[index];
                return ListTile(
                  title: Text(recipe.name),
                  subtitle: Text('Type: ${recipe.type}, Cuisine: ${recipe.cuisine}, Cooking Time: ${recipe.cookingTime} mins'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
