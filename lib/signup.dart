import 'package:firebase_auth/firebase_auth.dart';
import 'package:receipe_app/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:receipe_app/signin.dart';
import 'HomeScreen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_auth_implementation/firebase_auth_services.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/food/bg1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                color: Colors.grey.withOpacity(0.3),
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white12.withOpacity(0.2),
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
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
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
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                      color: Colors.orange,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an email address';
                                  } else if (!RegExp(
                                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                      color: Colors.orange,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  } else if (!RegExp(
                                          r'^(?=.*[A-Z])(?=.*\d).{6,}$')
                                      .hasMatch(value)) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                controller: confirmPasswordController,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                      color: Colors.orange,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  } else if (value != passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 32.0),
                              SizedBox(
                                width: double.infinity,
                                child: GestureDetector(
                                  onTap: _signUp,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 16.0),
                                    child: Center(
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              TextButton(
                                onPressed: () {
                                  // Navigate to the sign-in page
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInSignUp(),
                                    ),
                                  );
                                },
                                child: Text('Already have an account? Login'),
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
  void _signUp() async {
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If user is successfully created, navigate to the home screen
      if (userCredential.user != null) {
        print("User successfully created");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomeScreen(
                    username: username, email: email, password: password),
          ),
        );
      }
    } catch (e) {
      print("Error occurred while signing up: $e");
      // Handle errors here, such as displaying an error message
      // You can also use a SnackBar to show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred during sign-up. Please try again."),
        ),
      );
    }
  }}