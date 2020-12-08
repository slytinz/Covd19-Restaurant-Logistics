import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:yum/models/MenuItem.dart';

class FoodNotifier with ChangeNotifier {
  List<Food> _menuList = [];
  Food _currentFood;

  UnmodifiableListView<Food> get foodList => UnmodifiableListView(_menuList);
  Food get currentFood => _currentFood;

  set foodlist(List<Food> foodList) {
    _menuList = foodList;
    notifyListeners();
  }

  set currentFood(Food food) {
    _currentFood = food;
    notifyListeners();
  }
}
