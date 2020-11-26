import 'package:flutter/material.dart';
import 'package:yum/Pages/Login/Components/LoginBody.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: LoginBody(),
    );
  }
}
