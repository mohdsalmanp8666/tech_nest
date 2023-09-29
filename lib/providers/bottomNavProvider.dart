import 'package:flutter/material.dart';

class BottomNavProvider with ChangeNotifier {
  var bottomNavIndex = 0;

  changeBottomNavIndex(i) {
    bottomNavIndex = i;
    notifyListeners();
  }
}
