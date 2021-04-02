import './Constants/variables.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './Routes/appRoutes.dart';
import './cookBook.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFFD7463),
          accentColor: Color(0xFFFA2C1F),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Color(0xFFFD7463),
          )),
      home: CookBook(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
