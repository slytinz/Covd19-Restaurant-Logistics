import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Logo and Application Title
          Positioned(
            top: 50,
            child: Text(
              "YUM",
              style: TextStyle(
                  color: Color(0xFF171311),
                  fontSize: 100,
                  fontFamily: "Faster One"),
            ),
          ),
          Positioned(
            top: 150,
            child: Image.asset("assets/icons/mouthMainLogo2.png",
                width: size.width / 2),
          ),
          // Two tone background
          Positioned(
            top: 440,
            child: Image.asset("assets/icons/yellowBGLogo.jpg",
                width: size.width / 0.7),
          ),
          // This child calls the BUTTONS for login/signup
          child,
        ],
      ),
    );
  }
}
