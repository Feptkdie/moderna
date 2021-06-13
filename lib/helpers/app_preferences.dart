import 'package:flutter/material.dart';

class AppPreferences {
  static void showSnackBar(String value, GlobalKey<ScaffoldState> scaffold) {
    scaffold.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }
}
