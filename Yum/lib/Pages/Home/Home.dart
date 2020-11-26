import 'package:flutter/material.dart';
import 'package:yum/Services/AuthService.dart';
import 'package:yum/constants.dart';

class Home extends StatelessWidget {
  // const Home({Key key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text(
          'YUM',
          style: TextStyle(
              color: Color(0xFF171311), fontSize: 50, fontFamily: "Faster One"),
        ),
        backgroundColor: kPrimaryTextBox,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.fastfood_outlined),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signout();
            },
          ),
        ],
      ),
    );
  }
}
