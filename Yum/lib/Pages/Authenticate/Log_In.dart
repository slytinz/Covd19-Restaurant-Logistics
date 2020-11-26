import 'package:flutter/material.dart';
import 'package:yum/Services/AuthService.dart';

import '../../constants.dart';

class LogIn extends StatefulWidget {
  final Function toggleView;
  LogIn({this.toggleView});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Text Field State
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign In to Yum"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.fastfood),
            label: Text("Don't Have an Account?"),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        // width: double.infinity,
        // height: size.height,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an Email!' : null,
                onChanged: (val) {
                  //Get the value from the form  email field
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                validator: (val) => val.length < 6
                    ? 'Password must be 6+ characters long!'
                    : null,
                onChanged: (val) {
                  //Get the value from the password field
                  setState(() => password = val);
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: kPrimaryButtonColor,
                child: Text(
                  "Sign In",
                  style: TextStyle(color: kPrimaryTextBox),
                ),
                onPressed: () async {
                  // Checks if the account is valid (email not empty and password long enough)
                  if (_formKey.currentState.validate()) {
                    print(email);
                    print(password);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

//ANON sign in button
// RaisedButton(
//   child: Text("Sign In Anon"),
//   onPressed: () async {
//     dynamic result = await _auth.signInAnon();
//     if (result == null) {
//       print("Error Signing In");
//     } else {
//       print("Signed in");
//       print(result.uid);
//     }
//   },