import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:receipe_app/signup.dart';
import 'HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SignInSignUp extends StatefulWidget {
  @override
  State<SignInSignUp> createState() => _SignInSignUpState();
}

class _SignInSignUpState extends State<SignInSignUp> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/food/bg1.png', // replace with the path to your image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // ClipRect to prevent cropping of background image
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                color: Colors.grey.withOpacity(0.3),
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white12
                            .withOpacity(0.3), // adjust the opacity as needed
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.orange,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a username';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.orange,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 32.0),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // Perform sign in
                                    // You can add your sign-in logic here
                                    // For example, navigate to another screen
                                     Navigator.push(
                                     context,
                                      MaterialPageRoute(builder: (context) => HomeScreen(username: usernameController.text,
                                        password: passwordController.text,
                                        email: '',
                                      )),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange, // Background color
                                ),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Don\'t have an account? Sign Up',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
