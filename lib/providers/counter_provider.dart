import 'package:flutter/material.dart';
import 'package:provider_bloc_tutorial/models/counter_model.dart';

class CounterProvider with ChangeNotifier {
  final _model = CounterModel(number: 0);
  int get number => _model.number;

  void up() {
    _model.number++;
    notifyListeners();
  }

  void down() {
    _model.number--;
    notifyListeners();
  }
}
