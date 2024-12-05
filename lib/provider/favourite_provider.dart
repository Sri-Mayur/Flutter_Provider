import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _favlist = [];

  List<int> get favlist => _favlist;

  void addItem(int value) {
    _favlist.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _favlist.remove(value);
    notifyListeners();
  }
}
