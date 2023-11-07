import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {

  String AppLanguage = "ar";
  void ChangeAppLanguage(String languageCode) {
    AppLanguage = languageCode;
    notifyListeners();
  }
}
