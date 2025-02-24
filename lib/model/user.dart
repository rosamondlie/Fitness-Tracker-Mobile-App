import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _username = '';

  String get uname => _username;

  void getUsername(String uname) {
    _username = uname;
    notifyListeners();
  }
}
