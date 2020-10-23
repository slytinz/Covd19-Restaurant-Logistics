import 'package:flutter/material.dart';
import 'package:yum/Pages/Welcome/Welcome.dart';
import 'package:yum/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yum',
      theme: ThemeData(
        primaryColor: kPrimaryLightColor,
        scaffoldBackgroundColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}
