import 'package:flutter/material.dart';

class ButtonController extends ChangeNotifier{

  bool _loading = false;

  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  bool get loading => _loading;

}