import 'package:flutter/material.dart';
import 'package:yum/Pages/MenuService/FoodNotif.dart';
import 'package:provider/provider.dart';
import 'package:yum/Pages/MenuService/MenuDetails.dart';
import 'package:yum/Services/AuthService.dart';
import 'package:yum/Services/MenuService.dart';
import 'package:yum/constants.dart';
// import 'package:yum/models/MenuItem.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    FoodNotifier foodNotif = Provider.of<FoodNotifier>(context, listen: false);
    getFood(foodNotif);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    FoodNotifier foodNotif = Provider.of<FoodNotifier>(context);

    print("building Feed");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MENU",
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
      backgroundColor: kPrimaryLightColor,
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(
              foodNotif.foodList[index].image,
              width: 120,
              fit: BoxFit.fitWidth,
            ),
            title: Text(
              foodNotif.foodList[index].name,
              style: TextStyle(
                  color: kPrimaryIconColor, fontSize: 25, fontFamily: "Oswald"),
            ),
            subtitle: Text(foodNotif.foodList[index].category),
            onTap: () {
              foodNotif.currentFood = foodNotif.foodList[index];
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return FoodDetail();
                  },
                ),
              );
            },
          );
        },
        itemCount: foodNotif.foodList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),
    );
  }
}
