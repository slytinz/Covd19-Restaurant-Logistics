import 'package:flutter/material.dart';
import 'package:yum/Pages/wrapper.dart';
// import 'package:yum/constants.dart';
import 'package:provider/provider.dart';
import 'package:yum/Services/AuthService.dart';
import 'package:yum/models/user.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Yum',
//       theme: ThemeData(
//         primaryColor: kPrimaryLightColor,
//         scaffoldBackgroundColor: kPrimaryColor,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Wrapper(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
