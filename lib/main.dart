import 'package:flutter/material.dart';
import 'package:car_catalog/style.dart';
import 'package:car_catalog/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMW Catalog',
      color: kPrimaryColor,
      theme: ThemeData(
        backgroundColor: kBackgroundColor,
        accentColor: kAccentColor,
        primaryColor: kPrimaryColor,
        fontFamily: 'Montserrat'
      ),
      home: HomeScreen(),
    );
  }
}
