import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:yum/Pages/MenuService/FoodNotif.dart';
import 'package:yum/Services/AuthService.dart';
import 'package:yum/constants.dart';
// import 'package:yum/constants.dart';

class CustomerCheckIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    print("building CustomerCheckIn");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CHECK-INS",
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
        child: Text("CUSTOMER CHECK-INS"),
      ),
    );
  }
}
