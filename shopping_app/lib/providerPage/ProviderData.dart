import 'package:flutter/material.dart';
import 'package:shopping_app/Data/model.dart';

class AppProvider extends ChangeNotifier {
  List<Item> Datacarry = [];
  List<int> size = [];
  int selected = 0;
  void additems(Item news, int add) {
    Datacarry.add(news);
    size.add(add);
    notifyListeners();
  }

  void selectedIndex(int tem) {
    selected = tem;
    notifyListeners();
  }

  void removeItem(Item rem) {
    Datacarry.removeAt(selected);
    notifyListeners();
  }
}
