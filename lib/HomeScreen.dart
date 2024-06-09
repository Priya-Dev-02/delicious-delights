import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:receipe_app/ContinentalPage.dart';
import 'package:receipe_app/DetailScreen.dart';
import 'package:receipe_app/FavoritesScreen.dart';
import 'package:receipe_app/RecipeSearchDelegate2.dart';
import 'package:receipe_app/constant.dart';
import 'package:receipe_app/recipelistpage.dart';
import 'package:receipe_app/signin.dart';
import 'package:receipe_app/feedback.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:receipe_app/options.dart';
class HomeScreen extends StatefulWidget {
  final String username;
  final String email;
  final String password;
  HomeScreen(
      {required this.username, required this.email, required this.password});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchResult = "";
  bool seeAllClicked = false;
  late List<bool> isFavoriteList;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> favoritesList = [];
  final CollectionReference recipesCollection =
      FirebaseFirestore.instance.collection('recipes');

  List<Map<String, dynamic>> freshList = [
    {
      "image": "assets/food/sambar.png",
      "name": "Sambar",
      "price": "200",
      "videoUrl": "https://www.youtube.com/watch?v=tibgK4QXtyA",
      "calories": "150 calories",
      "isFavorite": false,
      "time": "1 hour",
      "ingredients": [
        "1 cup toor dal (pigeon pea lentils)",
        "1 small onion, chopped",
        "2 tomatoes, chopped",
        "1 carrot, chopped",
        "1 potato, diced",
        "1 drumstick, chopped",
        "1/2 cup tamarind extract",
        "2 tablespoons sambar powder",
        "1 teaspoon turmeric powder",
        "Salt to taste",
        "2 tablespoons oil",
        "1 teaspoon mustard seeds",
        "1 teaspoon cumin seeds",
        "A pinch of asafoetida (hing)",
        "A few curry leaves",
        "2 dried red chilies",
        "2 cloves garlic, minced",
        "2 tablespoons chopped coriander leaves"
      ],
      "reci":
          "To make sambar, cook toor dal with chopped vegetables, tamarind extract, sambar powder, turmeric powder, and salt until soft. In a separate pan, heat oil and temper mustard seeds, cumin seeds, asafoetida, curry leaves, dried red chilies, and minced garlic. Add this tempering to the cooked dal mixture and simmer for a few minutes. Garnish with chopped coriander leaves and serve hot with rice or idli."
    },
    {
      "image": "assets/food/rogan.png",
      "name": "Rogan Josh",
      "price": "400",
      "videoUrl": "https://www.youtube.com/watch?v=XVgZBsuNU60",
      "calories": "300 calories",
      "isFavorite": false,
      "time": "1 hour 30 mins",
      "ingredients": [
        "500g lamb, cut into pieces",
        "2 onions, finely chopped",
        "2 tomatoes, pureed",
        "4 tablespoons yogurt",
        "2 tablespoons ginger-garlic paste",
        "2 teaspoons red chili powder",
        "1 teaspoon turmeric powder",
        "1 teaspoon ground fennel seeds",
        "1 teaspoon ground cumin",
        "1 teaspoon ground coriander",
        "4 tablespoons vegetable oil",
        "2 black cardamom pods",
        "4 green cardamom pods",
        "4 cloves",
        "2-inch cinnamon stick",
        "1 teaspoon dried ginger powder",
        "Salt to taste",
        "Chopped coriander leaves for garnish"
      ],
      "reci":
          "To make rogan josh, marinate lamb pieces with yogurt, ginger-garlic paste, red chili powder, turmeric powder, ground fennel seeds, ground cumin, and ground coriander. Heat oil in a pan and temper with black cardamom, green cardamom, cloves, cinnamon stick, and dried ginger powder. Add finely chopped onions and cook until golden brown. Add tomato puree and cook until oil separates. Add marinated lamb pieces and cook until tender. Garnish with chopped coriander leaves and serve hot with rice or naan."
    },
    {
      "image": "assets/food/panipuri.png",
      "name": "Pani Puri",
      "price": "30",
      "videoUrl": "https://www.youtube.com/watch?v=fOu3wB0Inx8",
      "calories": "80 calories (per serving)",
      "isFavorite": false,
      "time": "30 mins",
      "ingredients": [
        "1 cup semolina (sooji)",
        "1/4 cup all-purpose flour (maida)",
        "Water as needed",
        "Oil for frying",
        "1 cup boiled chickpeas",
        "1 cup boiled potatoes, mashed",
        "1 cup tamarind chutney",
        "1 cup mint-coriander chutney",
        "1 cup spicy water (pani)",
        "Chaat masala for garnish",
        "Sev for garnish",
        "Chopped coriander leaves for garnish"
      ],
      "reci":
          "To make pani puri, prepare a dough with semolina, all-purpose flour, and water. Rest the dough for 30 minutes and then roll out small puris. Deep fry the puris until they puff up and become crispy. Fill each puri with boiled chickpeas and mashed potatoes. Dip the filled puris in spicy water (pani), tamarind chutney, and mint-coriander chutney. Garnish with chaat masala, sev, and chopped coriander leaves. Serve immediately for the best taste."
    },
    {
      "image": "assets/food/jamun.png",
      "name": "Gulab Jamun",
      "price": "250",
      "videoUrl": "https://www.youtube.com/watch?v=QFvd7u_YjVk",
      "calories": "150 calories (per piece)",
      "isFavorite": false,
      "time": "45 mins",
      "ingredients": [
        "1 cup milk powder",
        "1/4 cup all-purpose flour (maida)",
        "1/4 teaspoon baking soda",
        "2 tablespoons ghee",
        "3/4 cup milk",
        "1 cup sugar",
        "1 cup water",
        "1/4 teaspoon cardamom powder",
        "Saffron strands for garnish",
        "Chopped pistachios for garnish"
      ],
      "reci":
          "To make gulab jamun, mix milk powder, all-purpose flour, and baking soda in a bowl. Add ghee and milk to form a soft dough. Divide the dough into small portions and roll them into smooth balls. Heat oil in a pan and fry the dough balls until golden brown. In a separate pan, prepare sugar syrup by boiling sugar, water, and cardamom powder until slightly thick. Soak the fried dough balls in warm sugar syrup for a few hours. Garnish with saffron strands and chopped pistachios before serving."
    },
    {
      "image": "assets/food/tandoori.png",
      "name": "Tandoori Chicken",
      "price": "500",
      "videoUrl": "https://www.youtube.com/watch?v=-CKvt1KNU74",
      "calories": "300 calories (per serving)",
      "isFavorite": false,
      "time": "1 hour 30 mins",
      "ingredients": [
        "500g chicken drumsticks",
        "1 cup yogurt",
        "2 tablespoons ginger-garlic paste",
        "2 tablespoons lemon juice",
        "2 tablespoons tandoori masala",
        "1 teaspoon red chili powder",
        "1 teaspoon turmeric powder",
        "1 teaspoon ground cumin",
        "1 teaspoon ground coriander",
        "Salt to taste",
        "2 tablespoons vegetable oil",
        "Chopped coriander leaves for garnish",
        "Lemon wedges for garnish"
      ],
      "reci":
          "To make tandoori chicken, start by making a marinade with yogurt, ginger-garlic paste, lemon juice, tandoori masala, red chili powder, turmeric powder, ground cumin, ground coriander, salt, and vegetable oil. Marinate chicken drumsticks in this mixture for at least 4 hours or overnight. Preheat the oven to 200°C (400°F). Place the marinated chicken on a baking tray and bake for 25-30 minutes, turning once, until cooked through and charred. Garnish with chopped coriander leaves and lemon wedges before serving."
    }
  ];
  List recommendedList = [
    {
      "image": "assets/food/food1.png",
      "name": "chicken burger",
      "type": "maindish",
      "price": "124",
      "isFavorite": false,
      "videoUrl": "https://www.youtube.com/watch?v=O8vTcxaCGa0",
      "calories": "250 calories",
      "time": "20 mins",
      "ingredients": [
        "1 pound ground beef (preferably 80% lean, 20% fat)",
        "Salt and pepper to taste",
        " tablespoon Worcestershire sauce (optional)",
        "1 clove garlic, minced (optional)",
        "Burger buns",
        "Lettuce leaves",
        "Tomato slices",
        "Onion slices",
        "Cheese slices (optional)",
        "Ketchup, mustard, mayonnaise (optional)"
      ],
      "reci":
          "To make classic Chicken burgers, mix 1 pound of ground chicken with salt, pepper, Worcestershire sauce, and minced garlic. Shape into patties and grill or cook in a skillet for 3-4 minutes per side, adding cheese during the last minute if desired. Toast burger buns, spread condiments, place patties, and layer with lettuce, tomato, onion, and pickles. Customize with additional toppings like bacon or avocado. Serve immediately for a delicious homemade burger.Feel free to customize your burger with additional toppings like bacon, avocado, sautéed mushrooms, or a fried egg. Enjoy your delicious homemade burger!"
    },
    {
      "image": "assets/food/food 2.png",
      "name": "Kuzhi panniyaram ",
      "type": "Dinner/Breakfast",
      "isFavorite": false,
      "price": "200",
      "videoUrl": "https://www.youtube.com/watch?v=_-iqfKBad20",
      "calories": "150 calories",
      "time": "10 mins",
      "ingredients": [
        "1 cup idli batter",
        "1/4 cup finely chopped onions",
        "1/4 cup finely chopped carrots",
        "1/4 cup finely chopped bell peppers (any color)",
        "1-2 green chilies, finely chopped",
        "1/2 teaspoon mustard seeds",
        "1/2 teaspoon urad dal (split black gram)",
        "A pinch of asafoetida (hing)",
        "Curry leaves, chopped",
        "Salt to taste",
        "1 tablespoon oil",
        "Cooking oil or ghee for greasing the paniyaram pan"
      ],
      "reci":
          "To make Kuzhi Paniyaram, mix 1 cup of idli batter with a sautéed mixture of 1/4 cup each of finely chopped onions, carrots, and bell peppers, along with 1-2 finely chopped green chilies, 1/2 teaspoon mustard seeds, 1/2 teaspoon urad dal, a pinch of asafoetida, and chopped curry leaves. Season with salt to taste. Heat 1 tablespoon of oil in a pan, sauté the mustard seeds and urad dal until golden, then add the onions, chilies, and vegetables, cooking until slightly tender. Combine this mixture with the idli batter, adjust salt, and preheat a greased paniyaram pan. Pour spoonfuls of the batter into each mold, cook covered on medium-low heat, flipping until golden brown on all sides. Serve the Kuzhi Paniyaram hot with your favorite chutney or sauce."
    },
    {
      "image": "assets/food/food3.png",
      "name": "poori chana masala",
      "type": "Maindish",
      "price": "179",
      "isFavorite": false,
      "videoUrl": "https://www.youtube.com/watch?v=uygb9O-MDPw",
      "videoUrl": "https://www.youtube.com/watch?v=Rnt4p_tOaWQ",
      "calories": "20 calories",
      "time": "90 mins",
      "ingredients": [
        "2 cups Whole Wheat Flour (Atta)",
        "Water (as needed to make a dough)",
        "1/2 teaspoon Salt",
        "Oil (for frying)",
        "1 cup Chickpeas (Chana) - soaked overnight and boiled",
        "1 large Onion (finely chopped)",
        "2 medium Tomatoes (pureed)",
        "1 tablespoon Ginger (grated)",
        "1 tablespoon Garlic (minced)",
        "2 Green Chilies (chopped)",
        "2 tablespoons Cooking Oil",
        "1 teaspoon Cumin Seeds",
        "1 tablespoon Coriander Powder",
        "1 teaspoon Cumin Powder",
        "1/2 teaspoon Turmeric Powder",
        "1 teaspoon Red Chili Powder (adjust to taste)",
        "1 teaspoon Garam Masala",
        "1/2 teaspoon Amchur (Dry Mango Powder)",
        "Salt (to taste)",
        "Fresh Coriander Leaves (for garnish)"
      ],
      "reci":
          "To make Poori with Chana Masala, mix 2 cups of whole wheat flour with water and salt to form a smooth dough. Divide into small balls and roll each into 3-inch discs. Fry the discs in hot oil until they puff up and turn golden brown. For the Chana Masala, cook 1 cup of soaked chickpeas and sauté 1 chopped onion in 2 tablespoons of oil until golden. Add 1 teaspoon each of ginger-garlic paste and cumin seeds, followed by 2 chopped tomatoes. Stir in 1 teaspoon each of coriander powder, turmeric powder, garam masala, and red chili powder, adjusting salt to taste. Add the cooked chickpeas and simmer for 10-15 minutes. Garnish with fresh coriander leaves and serve the hot and puffed poori's with the flavorful Chana Masala."
    },
    {
      "image": "assets/food/food4.png",
      "name": "Chicken Biriyani",
      "type": "Maindish",
      "price": "299",
      "isFavorite": false,
      "videoUrl": "https://www.youtube.com/watch?v=uygb9O-MDPw",
      "calories": "25 calories",
      "time": "60 mins",
      "ingredients": [
        "500 grams Chicken (preferably bone-in pieces)",
        "1 cup Yogurt (curd)",
        "1 tablespoon Ginger-Garlic Paste",
        "1 teaspoon Red Chili Powder",
        "1/2 teaspoon Turmeric Powder",
        "1 teaspoon Garam Masala",
        "Salt to taste",
        "Fresh Lemon Juice (from 1 lemon)",
        "2 cups Basmati Rice (soaked for 30 minutes)",
        "Water (for cooking rice)",
        "2-3 Green Cardamom",
        "2-3 Cloves",
        "1-2 Bay Leaves",
        "Salt to taste",
        "2 large Onions (thinly sliced and fried until golden brown, for garnish)",
        "1 cup Fried Onions (for layering)",
        "1/2 cup Chopped Mint Leaves",
        "1/2 cup Chopped Coriander Leaves",
        "1/2 cup Ghee or Cooking Oil",
        "1 teaspoon Shahi Jeera (Caraway Seeds)",
        "2-3 Green Chilies (slit)",
        "1/2 teaspoon Biryani Masala Powder (optional)",
        "Saffron strands soaked in warm milk (for color and flavor)",
        "2-3 Green Cardamom",
        "2-3 Cloves",
        "1-2 Bay Leaves",
        "1-2-inch Cinnamon Stick",
        "1-2 Star Anise",
        "5-6 Black Peppercorns",
        "Ghee or Cooking Oil (for layering)",
        "Fried Onions (for layering)",
        "Chopped Mint Leaves (for layering)",
        "Chopped Coriander Leaves (for layering)",
        "Saffron-soaked Milk (for layering)",
      ],
      "reci":
          "To make Hyderabadi Chicken Biryani, marinate 1 kg of chicken pieces in a mixture of 1 cup yogurt, 1 tablespoon ginger-garlic paste, 1 teaspoon turmeric powder, 1 teaspoon red chili powder, 1 teaspoon garam masala, salt to taste, and 2 tablespoons lemon juice for at least 1-2 hours. Boil 2 cups soaked basmati rice in 4-5 cups water with bay leaves, green cardamom pods, cloves, cinnamon stick, and salt until 70-80% cooked. For the biryani masala, heat 1/2 cup ghee or oil, add shah jeera, chopped green chilies, and ginger-garlic paste, then stir in the marinated chicken, adding 1/2 cup fried onions, chopped mint leaves, and coriander leaves. In a heavy-bottomed pan, layer half of the partially cooked rice over the chicken masala, adding saffron-infused milk, fried onions, and chopped mint-coriander leaves. Add the remaining rice as the top layer, seal the pot, and cook on low heat for 20-25 minutes for dum cooking. Gently mix before serving, and enjoy the aromatic Hyderabadi Chicken Biryani."
    },
    {
      "image": "assets/food/food5.png",
      "name": "Paneer butter Masala",
      "type": "Gravy",
      "price": "279",
      "isFavorite": false,
      "videoUrl": "https://www.youtube.com/watch?v=oYZ--rdHL6I",
      "calories": "50 calories",
      "time": "45 mins",
      "ingredients": [
        "200 grams Paneer (cubed)",
        "1/4 cup Yogurt",
        "1 teaspoon Ginger-Garlic Paste",
        "1/2 teaspoon Red Chili Powder",
        "Salt to taste",
        "2 tablespoons Butter",
        "1 tablespoon Oil",
        "1 cup Onion (finely chopped)",
        "1 cup Tomato (pureed)",
        "1 teaspoon Ginger-Garlic Paste",
        "1/2 cup Cashew Nuts (soaked in warm water)",
        "1/4 cup Fresh Cream",
        "1 teaspoon Sugar (optional)",
        "Salt to taste",
        "1 teaspoon Red Chili Powder",
        "1 teaspoon Garam Masala",
        "1 teaspoon Cumin Powder",
        "1 teaspoon Coriander Powder",
        "1/2 teaspoon Turmeric Powder",
        "1/2 teaspoon Kasuri Methi (Dried Fenugreek Leaves)",
        "Water (as needed)",
      ],
      "reci":
          "To make Paneer Butter Masala, sauté 200g of cubed paneer in 1 tablespoon of butter and 1 tablespoon of oil until golden, then set aside. In the same pan, add another tablespoon of butter and sauté one finely chopped onion until golden. Add 1 tablespoon of ginger-garlic paste and cook until fragrant, then incorporate 2 pureed tomatoes, cooking until the masala separates from the oil. Introduce 1 teaspoon each of red chili powder, turmeric powder, garam masala, cumin powder, and coriander powder, cooking for a couple of minutes. Blend 1/2 cup soaked cashew nuts into a smooth paste, mix with water, and add to the masala. Cook for a few minutes before adding 1/2 cup fresh cream, 1 teaspoon crushed kasuri methi, and salt to taste. Optionally, add 1 tablespoon honey or sugar for balance. Finally, add the sautéed paneer cubes and simmer for 5-7 minutes. Garnish with fresh coriander leaves and serve hot with naan or rice."
    },
    {
      "image": "assets/food/food 6.png",
      "name": "Paneer Paratha",
      "type": "Dinner/Breakfast",
      "price": "199",
      "isFavorite": false,
      "videoUrl": "www.youtube.com/watch?v=mS8uOQh-ue8",
      "calories": "276 calories",
      "time": "30 mins",
      "ingredients": [
        "2 cups Whole Wheat Flour",
        "Water (as needed for kneading)",
        "Salt to taste",
        "Ghee or Oil (for cooking)",
        "1 cup Paneer (grated)",
        "1 small Onion (finely chopped)",
        "1-2 Green Chilies (finely chopped, adjust to taste)",
        "1 teaspoon Ginger (grated)",
        "1 teaspoon Cumin Seeds",
        "1/2 teaspoon Red Chili Powder",
        "1/2 teaspoon Garam Masala",
        "Salt to taste",
        "Fresh Coriander Leaves (chopped)",
        "Whole Wheat Flour (for dusting)",
        "Ghee or Oil (for cooking)",
      ],
      "reci":
          "To make Paneer Paratha, combine 2 cups of whole wheat flour with salt, adding water gradually to form a soft dough; let it rest for 15-20 minutes. For the paneer filling, mix 1 cup grated paneer with a finely chopped onion, 1-2 green chilies, grated ginger, 1/2 teaspoon cumin powder, 1/2 teaspoon garam masala, salt, and chopped coriander leaves. Divide the dough into balls, roll one into a disc, place a portion of the filling in the center, seal, and roll into a 7-8 inch paratha. Cook on a hot griddle, spreading ghee or oil, until both sides are golden brown. Repeat for remaining dough and filling. Serve the Paneer Parathas hot with yogurt or pickle."
    },
    {
      "image": "assets/food/food7.png",
      "name": "Paneer Bhurji",
      "type": "Starter",
      "price": "280",
      "isFavorite": false,
      "videoUrl": "https://www.youtube.com/watch?v=MUzjIceBV70",
      "calories": "364 calories",
      "time": "40 mins",
      "ingredients": [
        "200 grams Paneer (grated or crumbled)",
        "1 tablespoon Oil or Ghee",
        "1 teaspoon Cumin Seeds",
        "1 Onion (finely chopped)",
        "1 Tomato (finely chopped)",
        "1-2 Green Chilies (finely chopped, adjust to taste)",
        "1 teaspoon Ginger-Garlic Paste",
        "1/2 teaspoon Turmeric Powder",
        "1 teaspoon Red Chili Powder (adjust to taste)",
        "1 teaspoon Garam Masala",
        "Salt to taste",
        "Fresh Coriander Leaves (chopped, for garnish)",
        "1 tablespoon Lemon Juice (optional)",
      ],
      "reci":
          "To make Paneer Bhurji, heat 1 tablespoon of oil or ghee in a pan, add 1 teaspoon of cumin seeds, and sauté finely chopped onions until golden. Add 1 teaspoon ginger-garlic paste, finely chopped tomatoes, and cook until soft. Stir in 1/2 teaspoon turmeric powder, 1 teaspoon red chili powder, 1 teaspoon coriander powder, 1/2 teaspoon garam masala, and salt to taste. Crumble 200g of paneer into the pan, mix well, and cook for 3-5 minutes. Adjust salt and spices, add 1 tablespoon lemon juice if desired, and garnish with chopped coriander leaves before serving hot. Enjoy Paneer Bhurji with roti, paratha, or as a filling for sandwiches."
    },
    {
      "image": "assets/food/food8.png",
      "name": "Pav Bhaji",
      "type": "Chat",
      "price": "140",
      "isFavorite": false,
      "videoUrl": "https://www.youtube.com/watch?v=qMAYG-soxhw",
      "calories": "401 calories",
      "time": "45 mins",
      "ingredients": [
        "2 cups Mixed Vegetables (e.g., potatoes, cauliflower, peas, carrots), boiled and mashed",
        "1 cup Onion, finely chopped",
        "1 cup Tomato, finely chopped",
        "1/2 cup Capsicum (bell pepper), finely chopped",
        "1/4 cup Green Peas (fresh or frozen)",
        "2-3 Green Chilies, finely chopped",
        "1 tablespoon Ginger-Garlic Paste",
        "1/4 cup Pav Bhaji Masala",
        "1 teaspoon Red Chili Powder (adjust to taste)",
        "1/2 teaspoon Turmeric Powder",
        "Salt to taste",
        "2-3 tablespoons Butter",
        "Fresh Coriander Leaves, chopped (for garnish)",
        "Lemon Wedges (for serving)",
        "Pav (soft bread rolls)",
        "Butter for toasting",
      ],
      "reci":
          "To make Pav Bhaji at home, boil 2 cups mixed vegetables (potatoes, cauliflower, peas, carrots), bell peppers, onions, tomatoes, green beans, peas, and corn in a pressure cooker until soft. Coarsely mash the boiled vegetables. In a large pan, heat 1/4 cup butter, sauté 1 tablespoon ginger-garlic paste, add 2-3 finely chopped green chilies, and mix in 1/2 cup pav bhaji masala, 1 teaspoon red chili powder, 1/2 teaspoon turmeric powder, and salt. Incorporate the mashed vegetables and cook for 10-15 minutes, adjusting the consistency with water as needed. Meanwhile, slice 8 pav horizontally, spread butter, and toast until golden brown. Garnish the bhaji with chopped coriander leaves and a dollop of butter, and serve hot with the toasted pav and lemon wedges on the side. Enjoy this flavorful homemade Pav Bhaji!"
    },
    {
      "image": "assets/food/food9.png",
      "name": "Dhal makhni",
      "type": "Gravy",
      "price": "260",
      "isFavorite": false,
      "videoUrl": "https://www.youtube.com/watch?v=ca51e7nMI2g",
      "calories": "278 calories",
      "time": "60 mins",
      "ingredients": [
        "2 cups Mixed Vegetables (e.g., potatoes, cauliflower, peas, carrots), boiled and mashed",
        "1 cup Onion, finely chopped",
        "1 cup Tomato, finely chopped",
        "1/2 cup Capsicum (bell pepper), finely chopped",
        "1/4 cup Green Peas (fresh or frozen)",
        "2-3 Green Chilies, finely chopped",
        "1 tablespoon Ginger-Garlic Paste",
        "1/4 cup Pav Bhaji Masala",
        "1 teaspoon Red Chili Powder (adjust to taste)",
        "1/2 teaspoon Turmeric Powder",
        "Salt to taste",
        "2-3 tablespoons Butter",
        "Fresh Coriander Leaves, chopped (for garnish)",
        "Lemon Wedges (for serving)",
        "Pav (soft bread rolls)",
        "Butter for toasting",
      ],
      "reci":
          "To make Dal Makhani at home, soak 1 cup whole black urad dal and 1/4 cup red kidney beans in 4 cups water overnight, then cook in a pressure cooker until soft. In a large pot, heat 1/4 cup butter, add 1 teaspoon cumin seeds, followed by a finely chopped onion, and sauté until golden. Add 1 tablespoon ginger-garlic paste, 2 pureed tomatoes, 1 teaspoon red chili powder, 1/2 teaspoon turmeric powder, 1 teaspoon garam masala, and 1 teaspoon coriander powder. Cook until the masala thickens and oil separates. Add the mashed lentils and beans, simmer for 20-30 minutes, and stir occasionally. Pour in 1/4 cup cream, adjust salt and spices to taste. Garnish with chopped fresh coriander leaves and a dollop of butter. Serve hot with naan, roti, or rice. Enjoy the rich and flavorful Dal Makhani!"
    },
    {
      "image": "assets/food/food10.png",
      "name": "Shahi Tukda",
      "type": "Dessert",
      "price": "300",
      "isFavorite": false,
      "videoUrl": "https://www.youtube.com/watch?v=nxYribBFEkM&t=197s",
      "calories": "496 calories",
      "time": "90 mins",
      "ingredients": [
        "Bread slices",
        "Ghee or clarified butter, for frying",
        "1 cup Milk",
        "1/2 cup Condensed Milk",
        "1/4 cup Sugar (adjust to taste)",
        "1/2 cup Khoya (reduced milk solids)",
        "1/4 cup Almonds, sliced",
        "1/4 cup Pistachios, sliced",
        "Saffron strands, soaked in warm milk",
        "1/2 teaspoon Cardamom Powder",
        "Rosewater (optional)",
        "Edible silver leaf (varak) for garnish (optional)",
      ],
      "reci":
          "To make Shahi Tukda, cut 4 slices of bread into triangles or rectangles and fry them in ghee until golden brown. In a saucepan, boil 1/4 cup sugar and 1/4 cup water to make a sugar syrup, adding a pinch of saffron strands and 1/2 teaspoon cardamom powder. Dip the fried bread slices into the sugar syrup for a few minutes. In another pan, boil 1 cup milk, add 1/2 cup condensed milk, and simmer until it thickens to a rabri consistency. Arrange the soaked bread slices on a plate, pour the thickened milk over them, and garnish with chopped nuts and edible silver leaf. Chill in the refrigerator for a couple of hours before serving this rich and royal dessert."
    },
    {
      "image": "assets/food/food11.png",
      "name": "Chicken 65",
      "type": "Starter",
      "price": "250",
      "isFavorite": false,
      "videoUrl": "https://www.youtube.com/watch?v=P7A4XY-uzHA",
      "calories": "260 calories",
      "time": "60 mins",
      "ingredients": [
        "500 grams Boneless Chicken, cut into bite-sized pieces",
        "1 cup Yogurt (Curd)",
        "2 tablespoons Ginger-Garlic Paste",
        "1 teaspoon Red Chili Powder",
        "1/2 teaspoon Turmeric Powder",
        "1 teaspoon Garam Masala",
        "1 teaspoon Coriander Powder",
        "1 teaspoon Cumin Powder",
        "Salt to taste",
        "2 tablespoons Cornflour",
        "1/2 cup All-purpose Flour (Maida)",
        "1/2 cup Cornflour",
        "1/2 teaspoon Baking Powder",
        "Salt to taste",
        "Water (as needed for batter)",
        "Oil for deep frying",
        "Curry Leaves",
        "Green Chilies, slit",
        "Garlic, finely chopped",
        "Ginger, finely chopped",
        "Red Chili Powder (optional, for extra spice)",
        "Fresh Coriander Leaves, chopped",
      ],
      "reci":
          "To make Chicken 65 with restaurant-style taste, marinate 500g of boneless chicken pieces in a mixture of 2 tablespoons yogurt, 1 tablespoon ginger-garlic paste, 1 teaspoon red chili powder, 1/2 teaspoon turmeric powder, 1 teaspoon garam masala, 1 teaspoon coriander powder, 1 tablespoon corn flour, 2 tablespoons rice flour, 1 tablespoon all-purpose flour, and salt; let it marinate for 1-2 hours. Deep fry the marinated chicken until golden brown and cooked through. In a separate pan, heat 2 tablespoons of oil, sauté 1 tablespoon ginger-garlic paste, add 2-3 slit green chilies, curry leaves, 1 tablespoon red chili sauce, 1 tablespoon soy sauce, 1 tablespoon tomato ketchup, 1 teaspoon vinegar, and salt. Mix well. Toss the fried chicken pieces in the seasoning until evenly coated. Garnish with fresh coriander leaves and serve hot as an appetizer or side dish. Enjoy the delicious and spicy Chicken 65!"
    },
    {
      "image": "assets/food/butter chicken.png",
      "name": "Butter Chicken",
      "price": "300",
      "type": "snack",
      "videoUrl": "https://www.youtube.com/watch?v=D_fYk8mBaF4&t=37s",
      "calories": "400 calories ",
      "isFavorite": false,
      "time": "1 hour",
      "ingredients": [
        "500g boneless chicken, cut into cubes",
        "1 cup yogurt",
        "2 tablespoons ginger-garlic paste",
        "2 tablespoons lemon juice",
        "2 tablespoons butter",
        "1 onion, finely chopped",
        "2 tomatoes, pureed",
        "1 tablespoon tomato paste",
        "1 teaspoon red chili powder",
        "1 teaspoon garam masala",
        "1 teaspoon ground coriander",
        "1 teaspoon ground cumin",
        "1/2 cup cream",
        "Salt to taste",
        "Chopped coriander leaves for garnish"
      ],
      "reci":
          "To make butter chicken, marinate chicken cubes in yogurt, ginger-garlic paste, lemon juice, red chili powder, garam masala, ground coriander, ground cumin, and salt. Heat butter in a pan and sauté chopped onions until golden brown. Add the marinated chicken and cook until browned. Stir in tomato puree, tomato paste, and cream. Simmer until the chicken is cooked through and the sauce thickens. Garnish with chopped coriander leaves before serving."
    },
    {
      "image": "assets/food/tikka.png",
      "name": "Chicken Tikka Masala",
      "price": "200",
      "type": "snack",
      "videoUrl": "https://www.youtube.com/watch?v=gjnwdGvdQ7A&t=21s",
      "calories": "350 calories ",
      "isFavorite": false,
      "time": "1 hour 30 mins",
      "ingredients": [
        "500g boneless chicken, cut into cubes",
        "1 cup yogurt",
        "2 tablespoons ginger-garlic paste",
        "2 tablespoons lemon juice",
        "2 tablespoons tikka masala spice mix",
        "1 teaspoon red chili powder",
        "1 teaspoon ground cumin",
        "1 teaspoon ground coriander",
        "1/2 cup cream",
        "1 onion, finely chopped",
        "2 tomatoes, pureed",
        "2 tablespoons butter",
        "Salt to taste",
        "Chopped coriander leaves for garnish"
      ],
      "reci":
          "To make chicken tikka masala, marinate chicken cubes in yogurt, ginger-garlic paste, lemon juice, tikka masala spice mix, red chili powder, ground cumin, ground coriander, and salt. Grill or bake the marinated chicken until cooked through. In a separate pan, heat butter and sauté chopped onions until golden brown. Add tomato puree and cook until the oil separates. Stir in cream and cooked chicken. Simmer until the sauce thickens. Garnish with chopped coriander leaves before serving."
    },
    {
      "image": "assets/food/samosa.png",
      "name": "Samosa",
      "price": "60",
      "type": "snack",
      "videoUrl": "https://www.youtube.com/watch?v=EKPAfUCn_Jo",
      "calories": "150 calories ",
      "isFavorite": false,
      "time": "1 hour",
      "ingredients": [
        "2 cups all-purpose flour",
        "1/4 cup vegetable oil",
        "1/2 teaspoon carom seeds",
        "Salt to taste",
        "2 potatoes, boiled and mashed",
        "1 cup green peas",
        "1 onion, finely chopped",
        "2 green chilies, finely chopped",
        "1 teaspoon ginger-garlic paste",
        "1 teaspoon cumin seeds",
        "1 teaspoon coriander powder",
        "1/2 teaspoon turmeric powder",
        "1/2 teaspoon red chili powder",
        "1/2 teaspoon garam masala",
        "2 tablespoons chopped coriander leaves",
        "Oil for frying"
      ],
      "reci":
          "To make samosas, prepare a dough with all-purpose flour, vegetable oil, carom seeds, and salt. Let it rest for 30 minutes. Meanwhile, prepare the filling by sautéing chopped onions, green chilies, ginger-garlic paste, and cumin seeds. Add mashed potatoes, green peas, and spices. Cook until the mixture is dry. Roll out the dough and cut it into circles. Place a spoonful of filling in each circle and fold into a triangle. Seal the edges and deep fry until golden brown. Serve hot with chutney."
    },
    {
      "image": "assets/food/aloogobi.png",
      "name": "Aloo Gobi",
      "price": "150",
      "type": "snack",
      "videoUrl": "https://www.youtube.com/watch?v=KMVI7NHcbNE&t=19s",
      "calories": "200 calories ",
      "isFavorite": false,
      "time": "40 mins",
      "ingredients": [
        "2 potatoes, peeled and cubed",
        "1 cauliflower, cut into florets",
        "2 tablespoons vegetable oil",
        "1 teaspoon cumin seeds",
        "1 onion, finely chopped",
        "1 tomato, finely chopped",
        "2 green chilies, slit",
        "1 teaspoon ginger-garlic paste",
        "1/2 teaspoon turmeric powder",
        "1 teaspoon red chili powder",
        "1 teaspoon ground coriander",
        "1/2 teaspoon garam masala",
        "Salt to taste",
        "Chopped coriander leaves for garnish"
      ],
      "reci":
          "To make aloo gobi, heat vegetable oil in a pan and temper with cumin seeds. Add chopped onions and sauté until golden brown. Stir in ginger-garlic paste and slit green chilies. Add chopped tomatoes and cook until soft. Add turmeric powder, red chili powder, ground coriander, and salt. Cook until the oil separates. Add cubed potatoes and cauliflower florets. Cover and cook until the vegetables are tender. Garnish with chopped coriander leaves before serving."
    }
  ];
  @override
  void initState() {
    super.initState();
    isFavoriteList = List.generate(recommendedList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  final query = await showSearch<String>(
                    context: context,
                    delegate: RecipeSearchDelegate2(
                        [...recommendedList, ...freshList]),
                  );
                  // Handle search results if needed
                },
              ),
            ],
            title: Text(
              "DELICIOUS DELIGHTS",
              style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          backgroundColor: KLightColor,
          drawer: Drawer(
            child: Container(
              color: Colors.orange,
              child: Column(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/food/user1.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                          child: Text(
                            widget.username,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Divider(
                          color: Colors.white12.withOpacity(0.1),
                          thickness: 0.2,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Continental',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContinentalPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'filter',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeScreen()
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'My recipe',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecipeListPage()));
                    },
                  ),
                  for (var favorite in favoritesList)
                    ListTile(
                      title: Text(
                        favorite["name"],
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                  ListTile(
                    title: Text(
                      'Feedback',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeedbackPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              SignInSignUp(), // Replace SignInScreen with your sign-in page
                        ),
                        (Route route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          body: Container(
              margin: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SizedBox(height: 12.0),
                    Text(
                      "vanakam!!!!",
                      style: TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      "what would you like to cook today?",
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.grey,
                        fontFamily: "OpenSans-bold",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today's Fresh Recipes",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontFamily: "OpenSans-bold",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              searchResult = "";
                              seeAllClicked = true;
                            });
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: KOrangeColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16.0),
                    Container(
                      height: 330.0,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: freshList.length,
                          itemBuilder: (context, index) {
                            bool isMatch = seeAllClicked;
                            if (!seeAllClicked) {
                              isMatch = searchResult.isEmpty ||
                                  freshList[index]["name"]
                                      .toLowerCase()
                                      .contains(searchResult.toLowerCase());
                            }
                            if (isMatch) {
                              return GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      freshList[index]["name"],
                                      freshList[index]["image"],
                                      freshList[index]["calories"],
                                      freshList[index]["time"],
                                      freshList[index]["reci"],
                                      freshList[index]["price"],
                                      freshList[index]["ingredients"],
                                      freshList[index]["videoUrl"],
                                    ),
                                  ),
                                ),
                                child: Container(
                                  height: 350.0,
                                  width: 200.0,
                                  margin: EdgeInsets.only(right: 32.0),
                                  decoration: BoxDecoration(
                                    color: KPrimaryColor,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Image.asset(
                                            freshList[index]["image"]),
                                      ),
                                      Positioned(
                                        top: 5.0,
                                        left: -2.0,
                                        child: IconButton(
                                          icon: Icon(
                                            freshList[index]["isFavorite"]
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: freshList[index]
                                                    ["isFavorite"]
                                                ? Colors.red
                                                : Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              freshList[index]["isFavorite"] =
                                                  !freshList[index]
                                                      ["isFavorite"];
                                            });
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        top: 200.0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Breakfast",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: KBlueColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                freshList[index]["name"],
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontFamily: "OpenSans-bold",
                                                ),
                                              ),
                                              Text(
                                                freshList[index]["calories"],
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: KOrangeColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Row(
                                                children: List.generate(
                                                  5,
                                                  (index) => Icon(
                                                    Icons.star,
                                                    color: KOrangeColor,
                                                    size: 16.0,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.access_time,
                                                        color: Colors.grey,
                                                        size: 14.0,
                                                      ),
                                                      SizedBox(
                                                        width: 8.0,
                                                      ),
                                                      Text(
                                                        freshList[index]
                                                            ["time"],
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 32.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        "assets/icons/stopwatch.svg",
                                                        height: 14.0,
                                                        color: Colors.grey,
                                                      ),
                                                      SizedBox(
                                                        width: 8.0,
                                                      ),
                                                      Text(
                                                        "1 serving",
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                            ;
                          }),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "INDIAN DISHES",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontFamily: "OpenSans-bold",
                          ),
                        ),
                        GestureDetector(
                          onTap: () => print("See All Recomended"),
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: KOrangeColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: recommendedList.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (content, index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                  recommendedList[index]["name"],
                                  recommendedList[index]["image"],
                                  recommendedList[index]["calories"],
                                  recommendedList[index]["time"],
                                  recommendedList[index]["reci"],
                                  recommendedList[index]["price"],
                                  recommendedList[index]["ingredients"],
                                  recommendedList[index]["videoUrl"]),
                            ),
                          ),
                          child: Container(
                            height: 120.0,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12.0),
                            margin: EdgeInsets.only(bottom: 16.0),
                            decoration: BoxDecoration(
                              color: KPrimaryColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    recommendedList[index]["image"],
                                    height: 180.0,
                                    width: 120.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          recommendedList[index]["type"],
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: KBlueColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 6.0,
                                        ),
                                        Text(
                                          recommendedList[index]["name"],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: "OpenSans-bold",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6.0,
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: List.generate(
                                                5,
                                                (index) => Icon(
                                                  Icons.star,
                                                  color: KOrangeColor,
                                                  size: 16.0,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6.0,
                                            ),
                                            Text(
                                              recommendedList[index]
                                                  ["calories"],
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: KOrangeColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6.0,
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  color: Colors.grey,
                                                  size: 14.0,
                                                ),
                                                SizedBox(
                                                  width: 8.0,
                                                ),
                                                Text(
                                                  recommendedList[index]
                                                      ["time"],
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 32.0,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/icons/stopwatch.svg",
                                                  height: 14.0,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  width: 8.0,
                                                ),
                                                Text(
                                                  "2 serving",
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 28.0,
                                    width: 28.0,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isFavoriteList[index] =
                                              !isFavoriteList[index];
                                        });
                                      },
                                      icon: Icon(
                                        isFavoriteList[index]
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: isFavoriteList[index]
                                            ? Colors.pink
                                            : Colors
                                                .grey, // Change color when tapped
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ]))));
    });
  }
}
