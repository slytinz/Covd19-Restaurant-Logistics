import 'package:flutter/material.dart';
import 'package:yum/Pages/GlobalComponents/AccountAuth.dart';
import 'package:yum/Pages/GlobalComponents/ButtonsAndCustomization.dart';
import 'package:yum/Pages/GlobalComponents/InputTextField.dart';
import 'package:yum/Pages/Login/LoginScreen.dart';
import 'package:yum/Pages/SignUp/Components/SignUpBG.dart';
import 'package:yum/constants.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignUpBackground(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 225, bottom: 0.1),
            child: Text(
              "SIGN UP",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  fontFamily: "Oswald"),
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
          InputPasswordField(
            hint: "Confirm Password",
            onChanged: (value) {},
          ),
          LoginSignUpButton(
            text: "SIGN UP",
            press: () {},
          ),
          NeedAnAccountCheck(
            login: false,
            press: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
          OrDivider(),

          //Insert the SOCIAL MEDIA BUTTONS LATER
          // Row(
          //   children: <Widget>[
          //     Container(
          //       padding: EdgeInsets.all(20),
          //       decoration: BoxDecoration(
          //         border: Border.all(
          //           width: 2,
          //           color: kPrimaryButtonColor,
          //         ),
          //         child: IMAGE.asset(icon: asset/,  height:, width:,)
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
