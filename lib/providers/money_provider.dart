import 'package:flutter/material.dart';

class MoneyProvider extends ChangeNotifier {
  int totalMoney = 0;

  void addMoney(int money) {
    totalMoney += money;
    notifyListeners();
  }

  void clearMoney() {
    totalMoney = 0;
    notifyListeners();
  }
}
