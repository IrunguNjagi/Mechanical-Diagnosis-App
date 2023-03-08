import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_dignosis_app/screens/landing_page.dart';
import 'package:mechanic_dignosis_app/screens/mechanic_search_page.dart';
import 'package:mechanic_dignosis_app/screens/symptom_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mech App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),

    );
  }
}
