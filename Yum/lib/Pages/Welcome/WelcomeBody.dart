import 'package:flutter/material.dart';
import 'package:yum/Components/buttons.dart';
import 'package:yum/Pages/Welcome/WelcomeBG.dart';
import 'package:yum/constants.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Gives the size of the phone screen
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Welcome Sign
            Padding(
              padding: const EdgeInsets.only(top: 150, bottom: 50),
              child: Text(
                "LET'S GET EATIN'!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            // Button for Login
            LoginSignUpButton(
              text: "LOGIN",
              press: () {},
            ),
            // Button for Sign Up
            LoginSignUpButton(
              text: "SIGN UP",
              color: kPrimaryButtonAltColor,
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
