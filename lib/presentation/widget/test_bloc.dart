import 'package:flutter/cupertino.dart';

class TestBloc extends ChangeNotifier {
  List<String> _list = ['Tue 5', 'Tashkent', 'Uzbekistan'];
  List<String> get list => _list;
  setter(List<String> str) {
    _list = str;
    notifyListeners();
  }

  int currentIndex = 0;
  bool switchDone(int index) {
    return index == currentIndex ? true : false;
  }

  setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
