import 'package:flutter/material.dart';

//混入ChangeNotifier，管理所有订阅者
class CounterModel with ChangeNotifier {
  int _count = 0;
  int get value => _count;

  void increment() {
    _count++;
    //通知所有订阅者更新
    notifyListeners();
  }
}
