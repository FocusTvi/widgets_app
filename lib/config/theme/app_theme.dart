import 'package:flutter/material.dart';

const colorList = <Color>[Colors.blue, Colors.teal, Colors.red, Colors.pink];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 || selectedColor <= colorList.length - 1,
            "Selected color must be from 0 to ${colorList.length - 1}");

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ));
}
