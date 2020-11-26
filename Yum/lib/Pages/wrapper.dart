import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/Pages/Authenticate/auth.dart';
import 'package:yum/Pages/Home/Home.dart';
import 'package:yum/models/user.dart';
// import 'package:yum/Pages/Home/Home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //print(user);
    //Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
