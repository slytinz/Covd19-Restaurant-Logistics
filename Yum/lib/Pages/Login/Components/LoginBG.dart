import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;
  const LoginBackground({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 100,
            child: Image.asset("assets/icons/mouthMainLogo2.png",
                width: size.width / 2),
          ),
          // Two tone background
          Positioned(
            top: 300,
            child:
                Image.asset("assets/icons/yellowBGLogo.jpg", width: size.width),
          ),
          // Summons the buttons
          child,
        ],
      ),
    );
  }
}
