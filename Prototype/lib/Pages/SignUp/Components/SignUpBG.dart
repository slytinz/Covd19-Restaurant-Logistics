import 'package:flutter/material.dart';

class SignUpBackground extends StatelessWidget {
  final Widget child;
  const SignUpBackground({
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
          Positioned(
            top: 65,
            child: Image.asset("assets/icons/mouthMainLogo2.png",
                width: size.width / 3),
          ),
          // Two tone background
          Positioned(
            top: 210,
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
