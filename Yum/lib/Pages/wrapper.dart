import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/Pages/Authenticate/auth.dart';
import 'package:yum/Pages/HomeNavigation.dart';
// import 'package:yum/Pages/Welcome/Welcome.dart';
import 'package:yum/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Home or Authenticate widget
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
