import 'package:flutter/material.dart';
import 'package:yum/Pages/Welcome/Components/WelcomeBody.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeBody(),
    );
  }
}
