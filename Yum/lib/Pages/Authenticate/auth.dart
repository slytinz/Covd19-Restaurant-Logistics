import 'package:flutter/material.dart';
import 'package:yum/Pages/Authenticate/Log_In.dart';
import 'package:yum/Pages/Authenticate/RegisterAccount.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LogIn(toggleView: toggleView);
    } else {
      return RegisterAccount(toggleView: toggleView);
    }
  }
}
