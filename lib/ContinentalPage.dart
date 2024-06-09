import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:receipe_app/ContDetailsScreen.dart';
import 'constant.dart';
import 'RecipeSearchDelegate.dart';

class ContinentalPage extends StatefulWidget {
  @override
  State<ContinentalPage> createState() => _ContinentalPageState();
}

class _ContinentalPageState extends State<ContinentalPage> {
  late List<bool> isFavoriteList;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> favoritesList = [];
  List<Map<String, dynamic>> continental = [
    {
      "image": "assets/food/prawn-pie.png",
      "name": "Prawn pie",
      "price": "124",
      "videoUrl": "https://www.youtube.com/watch?v=82J-jtK3mR4",
      "calories": "309 calories",
      "isFavorite": false,
      "time": "  150 mins",
      "ingredients": [
        " 2 Tbsp Oil",
        "450 gram Prawns",
        "1 Onion, chopped",
        "2 tbsp Flour",
        "1 1/2 cups Heavy cream",
        "to taste Salt and Pepper",
        " 350+ extra gram All-purpose flour",
        "1 tsp Salt",
        "275 gram Butter",
        "5 tbsp Ice Cold Water",
        "1 Egg, mashed"
      ],
      "reci":
          "To make the Prawn Pie, start by heating oil in a saucepan and cooking onions until golden. Add cream, raise the heat, and stir until the sauce thickens. Incorporate prawns and seasoning. Pour the mixture into a pie dough made by blending salt and flour, pulsing butter in a food processor, and adding cold water. Divide and chill the dough, then roll out into discs. Place one disc in a baking pan, add the filling, and cover with the second disc. Brush with egg wash, make slits, and bake at 400 degrees for about an hour until golden. Optionally, you can substitute lobster or chicken for prawns. Enjoy your Prawn Pie!"
    },
    {
      "image": "assets/food/Peri-Peri-Paneer-Steaks.png",
      "name": "Paneer Steak",
      "price": "567",
      "videoUrl": "https://www.youtube.com/watch?v=kjIlJVQabv4",
      "calories": "2729 calories",
      "isFavorite": false,
      "time": "  30 mins",
      "ingredients": [
        "125 gm cottage cheese",
        "1/4 tsp salt or to taste",
        "Half a slice bread soft portion",
        "1 Tbsp coriander leaves, chopped",
        "1 tsp green chillies, chopped (optional)",
        "2 slices cheese",
        "1 Tbsp oil",
        "2 slices tomato",
      ],
      "reci":
          "Mash the paneer. Break the bread into small pieces or grate it..Mix well together the paneer, salt, hara dhania, green chillies and bread..Form into two round 'patties' and pan fry over high heat with the oil till brown on both sides.Place on a baking sheet, cover decoratively with the cheese slices and place the tomato on top and grill till cheese is soft and maybe brown if you so desire. (About 5 minutes)"
    },
    {
      "image": "assets/food/creamy-tuscan.png",
      "name": " creamy Tuscan Garlic Chicken",
      "price": "124",
      "videoUrl": "https://www.youtube.com/watch?v=5XGhppi8_9Q",
      "calories": "309 calories",
      "isFavorite": false,
      "time": "  150 mins",
      "ingredients": [
        "Meat"
            "3 Chicken breasts, boneless skinless"
            "1/2 tsp Basil, dried",
        "4 cloves Garlic",
        "1 tbsp Garlic powder",
        " 1/2 tsp Oregano, dried",
        "1 Red bell pepper",
        " 2 cup Spinach, fresh",
        "1 cup Chicken broth, low-sodium",
        "1 lb Fettuccine",
        "5/8 tsp Black pepper, ground",
        "1 1/8 cup Flour",
        "2 tsp Italian seasoning",
        " 1 1/2 tsp Kosher sea salt",
        "1/4 tsp Paprika",
        "2 tbsp Olive oil",
        "1/2 cup Panko bread crumbs",
        " 2 tbsp Butter, unsalted",
        "1/2 cup Half and half",
        " 1 cup Milk",
        "1 cup Parmesan cheese",
      ],
      "reci":
          " Sauté 4 chicken breasts seasoned with 2 tsp Italian seasoning, salt, and pepper in 1 tbsp olive oil until golden. Remove chicken; add 1 tbsp minced garlic to the skillet, then pour in 1 cup heavy cream and ½ cup chicken broth. Simmer, add ½ cup grated Parmesan, 1 cup spinach, and ½ cup chopped sun-dried tomatoes until spinach wilts. Return chicken to the skillet, simmer to coat with sauce, and serve.   "
    },
    {
      "image": "assets/food/aubergine.png",
      "name": "Aubergin Au Gratin",
      "price": "124",
      "videoUrl": "https://www.youtube.com/watch?v=Ku1j8_gktnU",
      "calories": "309 calories",
      "isFavorite": false,
      "time": "  90 mins",
      "ingredients": [
        "1 tbsp extra virgin olive oil",
        "1 small red onion, diced",
        "3 garlic cloves, crushed",
        "1 tsp mixed herbs",
        "4 chestnut mushrooms, sliced thinly",
        "1/2 courgette, sliced via your preferred method. For textured sauces I half 2mm slices into semi circles.",
        "400g tin of chopped tomatoes",
        "1/2 tsp sugar",
        "Splash of Tabasco (optional)",
        "Salt and freshly ground black pepper",
        "(This makes a good standard pasta sauce base and is freezable, so feel free to double the ingredients if you want more to save)",
        "1 aubergine, cut length ways into 5mm slices",
        "1/2 courgette, sliced into 2mm rounds.",
        "Parmesan",
        "Warm crusty bread",
        "Brown rice",
        "Steamed spinach"
      ],
      "reci":
          "Heat oil in a skillet, add diced onions with a pinch of salt, sauté until translucent. While onions cook, prep aubergine by salting and draining in a colander. Add crushed garlic and mixed herbs to onions, then incorporate mushrooms and courgette, cooking until slightly browned. Pour in chopped tomatoes with water, simmer for 5 minutes. In a separate pan, dry aubergine slices, brown both sides, and set aside. Season sauce with salt, pepper, sugar, and Tabasco. Layer aubergine with sauce, sprinkling Parmesan between layers, and top with courgette circles and more Parmesan. Bake at 180°C for 30 minutes. Serve with preferred sides."
    },
    {
      "image": "assets/food/lasgna.png",
      "name": "Lasagna",
      "price": "124",
      "videoUrl": "https://www.youtube.com/watch?v=exHOnbuudMY",
      "calories": "350-550 calories",
      "isFavorite": false,
      "time": "  60 mins",
      "ingredients": [
        "1/2 large bell pepper, diced",
        " 2 cloves garlic, minced",
        "1 (28-ounce) can tomato sauce",
        "3 ounces tomato paste",
        "1 (14-ounce) can crushed tomatoes",
        "2 tablespoons chopped fresh oregano or 2 teaspoons dried",
        "Ground beef, Italian sausage",
        "Lasagna noodles",
        "Ricotta, mozzarella, and Parmesan cheese",
        "Egg",
        "Spices: sugar, basil, salt, Italian seasoning, fennel seeds, black pepper"
      ],
      "reci":
          "Brown 1 pound of ground beef with diced onions and minced garlic. Add 28 ounces of tomato sauce, 3 ounces of tomato paste, and 14 ounces of crushed tomatoes. Season with oregano, basil, salt, Italian seasoning, fennel seeds, black pepper, and a dash of sugar. Layer cooked lasagna noodles with the meat sauce and a cheese mixture made from ricotta, mozzarella, and Parmesan cheese, beaten with an egg. Bake until bubbly and golden."
    },
    {
      "image": "assets/food/cheese-fondue.png",
      "name": "Cheese Fondue",
      "price": "124",
      "videoUrl": "https://www.youtube.com/watch?v=a5yBHv0nVBg",
      "calories": "400 calories",
      "isFavorite": false,
      "time": "  30 mins",
      "ingredients": [
        "Good-quality cheese (Gruyère, fontina, gouda)",
        "Dry white wine",
        "Garlic",
        "Cornstarch",
        "Lemon juice",
        "Cherry brandy, mustard, nutmeg (optional)",
      ],
      "reci":
          " Combine 150g each of Gruyère, Beaufort, and aged Comté cheese with 250ml of dry white wine and 3 tablespoons of cornstarch. Rub the fondue pot with garlic cloves, then discard. Heat the wine mixture until simmering, gradually add the cheese until melted and smooth. Serve with bread, veggies, or apples for dipping."
    },
    {
      "image": "assets/food/sjp.png",
      "name": "Jacket Potatoes with Stuffing",
      "price": "124",
      "videoUrl": "https://www.youtube.com/watch?v=DhFMsnjGOJI",
      "calories": "600 calories",
      "isFavorite": false,
      "time": "  110 mins",
      "ingredients": [
        "Large potatoes"
            "Bacon",
        "Cheese (cheddar, gruyere, etc.)",
        "Cream, butter",
        "Green onion, chives",
        "For stuffing: mushrooms yogurt ginger garlic green chilies coriander kasoori methi",
      ],
      "reci":
          " Bake large potatoes until tender. Scoop out the flesh and mix with crispy bacon, grated cheese, cream, and green onions. Refill the potato skins with the mixture, top with more cheese, and bake until golden brown. "
    },
    {
      "image": "assets/food/waldorf-salad.png",
      "name": "Waldorf Salad",
      "price": "124",
      "videoUrl": "https://www.youtube.com/watch?v=hH6lY6GzRBU",
      "calories": "301 calories",
      "isFavorite": false,
      "time": "  15 mins",
      "ingredients": [
        "6 tablespoons of mayonnaise (or plain yogurt)",
        "1 tablespoon of lemon juice",
        "1/2 teaspoon of kosher salt",
        "a pinch of freshly ground black pepper",
        "2 sweet apples (cored and chopped)",
        "1 cup of seedless red grapes (halved)",
        "1 cup of thinly sliced celery",
        "1 cup of chopped",
        "slightly toasted walnuts",
      ],
      "reci":
          " Whisk together mayonnaise, lemon juice, salt, and pepper in a medium-sized bowl. Stir in the chopped apples, celery, grapes, and walnuts until well combined. Serve the salad on a bed of fresh lettuce."
    },
    {
      "image": "assets/food/garlic-parmeasan.png",
      "name": "Garlic Parmesan Chicken",
      "price": "124",
      "videoUrl": "https://www.youtube.com/watch?v=ue9IrdiU6xY",
      "calories": "386 calories",
      "isFavorite": false,
      "time": "  45 mins",
      "ingredients": [
        "4 small-medium chicken breasts, or 2 large halved",
        "Salt and pepper, to taste",
        "2 tablespoons olive oil",
        "3-4 cloves garlic, minced",
        "1 cup light cream, or heavy cream",
        "1 tablespoon Italian seasoning, or oregano",
        "1/2 cup parmesan cheese, grated",
        "1 cup spinach, chopped (optional)",
      ],
      "reci":
          " Season chicken with salt and pepper.Heat olive oil in a large skillet or pan. Add chicken and cook for 5-6 minutes per side or until golden and cooked through.Remove chicken from the pan, reduce heat to low-medium, and add garlic; stir for 30 seconds.Add the cream, Italian seasoning, and parmesan cheese. Stir to combine.Stir in chopped spinach if desired. Simmer for another 2-3 minutes.Return chicken to the pan and simmer for another minute, then turn off heat. Spoon sauce over chicken.Serve with pasta or veggies"
    },
    {
      "image": "assets/food/Crispy-and-Creamy-Chicken-Cordon-Bleu.png",
      "name": "Creamy Chicken Cordon Bleu",
      "price": "124",
      "videoUrl": "https://www.youtube.com/watch?v=CkN39Ualhaw",
      "calories": "726 calories",
      "isFavorite": false,
      "time": "  70 mins",
      "ingredients": [
        " 4 boneless, skinless chicken breasts",
        "Salt and pepper, to taste",
        "1 tablespoon garlic powder",
        "1 tablespoon onion powder",
        "16 slices Swiss cheese",
        "½ lb ham, thinly sliced",
        "Peanut oil, or vegetable oil, for frying",
        "1 cup all-purpose flour",
        "4 eggs, beaten",
        "2 cups panko bread crumbs",
        "3 tablespoons butter",
        "2 cloves garlic, minced",
        "3 tablespoons all-purpose flour",
        "2 cups milk",
        "¼ cup Dijon mustard",
        "1 cup shredded Parmesan cheese",
        "Salt and pepper, to taste",
      ],
      "reci":
          "Season chicken breasts with salt, pepper, garlic powder, and onion powder.Place a chicken breast between two sheets of plastic wrap and pound until about ½ inch thick.Layer 2 slices of Swiss cheese, then 2 slices of ham, another layer of Swiss cheese, and another layer of ham on each chicken breast.Roll the chicken tightly and chill in the fridge for 30 minutes to set.Heat oil to 325°F (170°C) in a tall-sided pan.Dredge the chicken in flour, then egg, and then bread crumbs.Fry for about 5 minutes per side, or until golden brown. If needed, finish in the oven at 325°F (170°C) until the center reaches 165°F (75°C).For the sauce, melt butter and cook garlic until soft. Add flour and whisk for 1 minute. Add milk and whisk until thickened. Stir in mustard, Parmesan cheese, salt, and pepper. "
    },
  ];
  @override
  void initState() {
    super.initState();
    // Initialize isFavoriteList with the same length as continental list
    isFavoriteList = List<bool>.filled(continental.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Continental "),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Navigate back to the previous page (homepage)
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  final query = await showSearch<String>(
                    context: context,
                    delegate: RecipeSearchDelegate(continental),
                  );
                  // Handle search results if needed
                },
              ),
            ],
          ),
          body: Container(
              margin: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Continental Dishes",
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
                      itemCount: continental.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (content, index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ContDetailsScreen(
                                  continental[index]["name"],
                                  continental[index]["image"],
                                  continental[index]["calories"],
                                  continental[index]["time"],
                                  continental[index]["reci"],
                                  continental[index]["price"],
                                  continental[index]["ingredients"],
                                  continental[index]["videoUrl"]),
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
                                    continental[index]["image"],
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
                                        SizedBox(
                                          height: 6.0,
                                        ),
                                        Container(
                                          width:
                                              100, // Example width constraint
                                          child: Text(
                                            continental[index]["name"],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontFamily: "OpenSans-bold",
                                            ),
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
                                              continental[index]["calories"],
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
                                                  continental[index]["time"],
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
