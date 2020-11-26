import 'package:flutter/material.dart';
import 'package:yum/Pages/SignUp/Components/SignUpBody.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SignUpBody(),
    );
  }
}
