import 'package:flutter/material.dart';
// import 'package:yum/Pages/GlobalComponents/ButtonsAndCustomization.dart';
import 'package:yum/Pages/Welcome/Components/WelcomeBG.dart';
import 'package:yum/Services/AuthService.dart';
import 'package:yum/constants.dart';

class WelcomeBody extends StatelessWidget {
  WelcomeBody({Key key}) : super(key: key);
  final AuthService _auth = AuthService();

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
            Container(
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 40),
                  child: Text(
                    "LOGIN ANONYMOUSLY",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: "Oswald"),
                  ),
                  color: kPrimaryButtonColor,
                  onPressed: () async {
                    dynamic result = await _auth.signInAnon();
                    if (result == null) {
                      print('Error Singing In');
                    } else {
                      print('Signed In!');
                      print(result);
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// LoginSignUpButton(
//               text: "LOGIN ANONYMOUSLY",
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return LoginScreen();
//                     },
//                   ),
//                 );
//               },
//             ),
