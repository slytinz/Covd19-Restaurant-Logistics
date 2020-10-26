import 'package:flutter/material.dart';
import 'package:yum/constants.dart';

class LoginSignUpButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const LoginSignUpButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryButtonColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "OR",
              style: TextStyle(
                color: kPrimaryButtonColor,
                fontFamily: "Oswald",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: kPrimaryButtonColor,
        height: 1.5,
      ),
    );
  }
}
