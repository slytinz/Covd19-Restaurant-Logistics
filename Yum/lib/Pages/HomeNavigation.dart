import 'package:flutter/material.dart';
import 'package:yum/Pages/CheckIns/CustomerCheckIn.dart';
import 'package:yum/Pages/GlobalComponents/ButtonsAndCustomization.dart';
import 'package:yum/Pages/Logistics/Logistics.dart';
import 'package:yum/Pages/MenuService/Menu.dart';
import 'package:yum/Pages/OrderManagement/CustomerOrders.dart';
import 'package:yum/Services/AuthService.dart';
import 'package:yum/constants.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text(
          'YUM',
          style: TextStyle(
              color: Color(0xFF171311), fontSize: 50, fontFamily: "Faster One"),
        ),
        backgroundColor: kPrimaryButtonColor,
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
      body: Center(
        // child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100),
            ),
            Button(
              text: "MENU SERVICE",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Menu();
                    },
                  ),
                );
              },
            ),
            Button(
              text: "ORDER MANAGEMENT",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CustomerOrder();
                    },
                  ),
                );
              },
            ),
            Button(
              text: "CHECK-INS",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CustomerCheckIn();
                    },
                  ),
                );
              },
            ),
            Button(
              text: "LOGISTICS",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Logistics();
                    },
                  ),
                );
              },
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
