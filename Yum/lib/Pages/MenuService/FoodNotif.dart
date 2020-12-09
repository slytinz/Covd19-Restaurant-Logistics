import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:yum/models/MenuItem.dart';

class FoodNotifier with ChangeNotifier {
  List<Food> _fList = [];
  Food _currentFood;

  UnmodifiableListView<Food> get foodList => UnmodifiableListView(_fList);

  Food get currentFood => _currentFood;

  set foodList(List<Food> foodList) {
    _fList = foodList;
    notifyListeners();
  }

  set currentFood(Food food) {
    _currentFood = food;
    notifyListeners();
  }

  addFood(Food food) {
    _fList.insert(0, food);
    notifyListeners();
  }

  deleteFood(Food food) {
    _fList.removeWhere((_food) => _food.id == food.id);
    notifyListeners();
  }
}
