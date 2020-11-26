import 'package:flutter/material.dart';
import 'package:yum/Pages/GlobalComponents/AccountAuth.dart';
import 'package:yum/Pages/GlobalComponents/ButtonsAndCustomization.dart';
import 'package:yum/Pages/GlobalComponents/InputTextField.dart';
import 'package:yum/Pages/Login/Components/LoginBG.dart';
import 'package:yum/Pages/SignUp/SignUpScreen.dart';

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
            hint: "Password",
            onChanged: (value) {},
          ),
          LoginSignUpButton(
            text: "LOGIN",
            press: () {},
          ),
          NeedAnAccountCheck(
            press: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
