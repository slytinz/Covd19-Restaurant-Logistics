import 'package:flutter/material.dart';
import 'package:yum/Services/AuthService.dart';

import '../../constants.dart';

class LogIn extends StatefulWidget {
  LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign In to Yum"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        // width: double.infinity,
        // height: size.height,
        child: RaisedButton(
          child: Text("Sign In Anon"),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print("Error Signing In");
            } else {
              print("Signed in");
              print(result.uid);
            }
          },
          //   Stack(
          // alignment: Alignment.center,
          // children: <Widget>[
          //   Positioned(
          //     top: 85,
          //     child: Image.asset("assets/icons/mouthMainLogo2.png",
          //         width: size.width / 2),
          //   ),
          //   // Two tone background
          //   Positioned(
          //     top: 300,
          //     child: Image.asset("assets/icons/yellowBGLogo.jpg",
          //         width: size.width),
          //   ),
          //     // Summons the buttons
          //   ],
          // ),
        ),
      ),
    );
  }
}
