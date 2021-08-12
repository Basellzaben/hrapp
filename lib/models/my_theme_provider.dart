import 'package:flutter/material.dart';
import 'package:hrmsapp/GlobalVar/Globalvireables.dart';

class MyThemeModel extends ChangeNotifier {
  bool _isLightTheme = true;

  void changeTheme() {
    _isLightTheme = !_isLightTheme;
    Globalvireable.type2++;
    notifyListeners();
  }

  bool get isLightTheme => _isLightTheme;
}
