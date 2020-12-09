import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yum/Pages/MenuService/FoodNotif.dart';

import 'package:yum/models/MenuItem.dart';

getFood(FoodNotifier foodNotifier) async {
  QuerySnapshot snapshot =
      await Firestore.instance.collection('MenuItem').getDocuments();
  List<Food> _foodList = [];

  snapshot.documents.forEach((document) {
    Food food = Food.fromMap(document.data);
    _foodList.add(food);
  });

  foodNotifier.foodList = _foodList;
}
