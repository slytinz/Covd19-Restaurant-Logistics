import 'package:flutter/material.dart';
import 'package:yum/Services/AuthService.dart';
import 'package:yum/constants.dart';

class CustomerOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    print("building CustomerOrder");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ORDERS",
          style: TextStyle(
              color: Color(0xFF171311), fontSize: 30, fontFamily: "Faster One"),
        ),
        backgroundColor: kPrimaryButtonColor,
        elevation: 0.0,
        actions: <Widget>[
          // action button
          FlatButton.icon(
            icon: Icon(Icons.fastfood_outlined),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signout();
            },
          ),
        ],
      ),
      body: Center(
        child: Text("CUSTOMER ORDERS"),
      ),
    );
  }
}
