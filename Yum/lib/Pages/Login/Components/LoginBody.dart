import 'package:flutter/material.dart';
import 'package:yum/Pages/GlobalComponents/InputTextField.dart';
import 'package:yum/Pages/GlobalComponents/buttons.dart';
import 'package:yum/Pages/Login/Components/LoginBG.dart';
import 'package:yum/constants.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 300, bottom: 10),
            child: Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                fontFamily: "Oswald",
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          // The attributes of the Login Form
          InputTextField(
            hintText: "Your Email",
            icon: Icons.email,
            onChanged: (value) {},
          ),
          InputPasswordField(
            onChanged: (value) {},
          ),
          LoginSignUpButton(
            text: "LOGIN",
            press: () {},
          ),
          NeedAnAccountCheck(
            press: () {},
          ),
        ],
      ),
    );
  }
}

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
            login ? "SIGN UP" : "Sign In",
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
