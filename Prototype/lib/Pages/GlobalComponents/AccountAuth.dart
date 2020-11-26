import 'package:flutter/material.dart';
import 'package:yum/constants.dart';

class NeedAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const NeedAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have Account?" : "Already have an Account?",
          style: TextStyle(color: kPrimaryIconColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " SIGN UP" : " SIGN IN",
            style: TextStyle(
              color: kPrimaryButtonColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
