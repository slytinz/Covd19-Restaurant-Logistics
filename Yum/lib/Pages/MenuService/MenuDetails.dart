import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/Pages/MenuService/FoodNotif.dart';
import 'package:yum/constants.dart';

class FoodDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotif = Provider.of<FoodNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          foodNotif.currentFood.name,
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontFamily: "Oswald"),
        ),
        backgroundColor: kPrimaryButtonColor,
      ),
      backgroundColor: kPrimaryLightColor,
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[Image.network(foodNotif.currentFood.image)],
          ),
        ),
      ),
    );
  }
}
