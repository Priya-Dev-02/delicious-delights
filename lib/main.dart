import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:receipe_app/firebase_options.dart';
import 'StartingPage.dart';
import 'constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );




  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,

    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: KPrimaryColor,
        fontFamily: " OpenSans-Regular"
      ),
      home: StartingPage(),
    );
  }
}

