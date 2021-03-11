import 'package:flutter/material.dart';
class ThemeDataTest{
static ThemeData themeData() {
  return ThemeData(textTheme: TextTheme(bodyText1: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w600, fontSize: 11)));
}
}

