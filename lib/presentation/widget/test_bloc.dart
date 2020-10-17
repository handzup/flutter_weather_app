import 'package:flutter/cupertino.dart';

class TestBloc extends ChangeNotifier {
  List<String> _list = ['UNITED KINGDOM', 'London', 'California'];
  List<String> get list => _list;
  setter(List<String> str) {
    _list = str;
    notifyListeners();
  }
}
