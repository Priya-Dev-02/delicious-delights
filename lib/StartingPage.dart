import 'package:flutter/material.dart';
import 'package:receipe_app/signin.dart';
import 'HomeScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
class StartingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: [
                Image.asset('assets/food/im1.jpg'),
                Image.asset('assets/food/im2.jpg'),
                Image.asset('assets/food/im3.jpg'),
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.6,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Welcome to Delicious Delights!!!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Explore and discover amazing recipes with our app. Get started now!',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInSignUp(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
