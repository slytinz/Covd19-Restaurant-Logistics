import 'package:flutter/material.dart';
import 'package:yum/Pages/GlobalComponents/buttons.dart';
import 'package:yum/Pages/Login/LoginScreen.dart';
import 'package:yum/Pages/Welcome/Components/WelcomeBG.dart';
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
              padding: const EdgeInsets.only(top: 170, bottom: 30),
              child: Text(
                "LET'S GET EATIN'!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: "Oswald"),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            // Button for clicks to go to Login Page
            LoginSignUpButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
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
