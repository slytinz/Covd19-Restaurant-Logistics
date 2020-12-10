import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum/Pages/MenuService/FoodForm.dart';
import 'package:yum/Pages/MenuService/FoodNotif.dart';
import 'package:yum/constants.dart';

class FoodDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotif = Provider.of<FoodNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          foodNotif.currentFood.name,
          style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: "Permanent Marker"),
        ),
        backgroundColor: kPrimaryButtonColor,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Image.network(foodNotif.currentFood.image != null
                  ? foodNotif.currentFood.image
                  : 'https://media.discordapp.net/attachments/460202875851767808/786416323890249788/mouthMainLogo2.png'),
              SizedBox(height: 32),
              Text(
                foodNotif.currentFood.name,
                style: TextStyle(
                    color: Colors.black, fontSize: 50, fontFamily: "Oswald"),
              ),
              Text(
                "Ingredients",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: "Oswald",
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5,
                children: foodNotif.currentFood.subIngredients
                    .map(
                      (ingredient) => Card(
                        color: kPrimaryColor,
                        child: Center(
                          child: Text(
                            ingredient,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kPrimaryIconColor,
                              fontSize: 15,
                              fontFamily: "Oswald",
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return FoodForm(
              update: true,
            );
          }));
        },
        child: Icon(Icons.border_color),
        foregroundColor: Colors.white,
      ),
    );
  }
}
