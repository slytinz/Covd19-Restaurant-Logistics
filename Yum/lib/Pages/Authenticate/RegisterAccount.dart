import 'package:flutter/material.dart';
import 'package:yum/Services/AuthService.dart';
import 'package:yum/constants.dart';

class RegisterAccount extends StatefulWidget {
  final Function toggleView;
  RegisterAccount({this.toggleView});

  @override
  _RegisterAccountState createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Text Field State
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign up to Yum!"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.fastfood),
            label: Text("Sign In"),
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
              // //Restaurant Name
              // SizedBox(height: 20),
              // TextFormField(
              //   onChanged: (val) {
              //     //Get the value from the form  email field
              //     setState(() => email = val);
              //   },
              // ),

              // //Owner name
              // SizedBox(height: 20),
              // TextFormField(
              //   onChanged: (val) {
              //     //Get the value from the form  email field
              //     setState(() => email = val);
              //   },
              // ),

              //Restaurant email
              SizedBox(height: 20),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an Email!' : null,
                onChanged: (val) {
                  //Get the value from the form  email field
                  setState(() => email = val);
                },
              ),

              //Password
              SizedBox(height: 20),
              TextFormField(
                validator: (val) => val.length < 6
                    ? 'Password must be 6+ characters long!'
                    : null,
                obscureText: true,
                onChanged: (val) {
                  //Get the value from the password field
                  setState(() => password = val);
                },
              ),

              //Confirm password
              // SizedBox(height: 20),
              // TextFormField(
              //   validator: (val) => val.length < 6
              //       ? 'Password must be 6+ characters long!'
              //       : null,
              //   obscureText: true,
              //   onChanged: (val) {
              //     //Get the value from the password field
              //     setState(() => password = val);
              //   },
              // ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: kPrimaryButtonColor,
                child: Text(
                  "Register",
                  style: TextStyle(color: kPrimaryTextBox),
                ),
                onPressed: () async {
                  // Checks if the account is valid (email not empty and password long
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _auth.AccountRegistration(email, password);
                    if (result == null) {
                      setState(() => error = "Please supply valid email...");
                    }
                  }
                },
              ),
              SizedBox(height: 12),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
