import 'package:flutter/material.dart';

class IncrementCounter extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  incCount() {
    _value++;
    notifyListeners();
  }
}
