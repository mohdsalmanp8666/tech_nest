import 'package:flutter/material.dart';

class OnBoardingProvider with ChangeNotifier {
  int index = 0;

  PageController pgNum = PageController();

  assignIndex(i) {
    movePage(index = i);
    notifyListeners();
  }

  increaseIndex() {
    index < 2 ? index++ : index;
    movePage(index);
    notifyListeners();
  }

  decreaseIndex() {
    movePage(index--);
    notifyListeners();
  }

  movePage(i) {
    pgNum.animateToPage(i,
        duration: const Duration(milliseconds: 150), curve: Curves.easeIn);
  }
}
