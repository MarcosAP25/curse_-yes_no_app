import 'package:flutter/material.dart';
  const  Color _customColor = Color(0xFFA838F3);

  final _listOfColors = <Color>[
    _customColor,
    Colors.blue,
    Colors.green,
    Colors.teal,
    Colors.yellow,
    Colors.pink,
    Colors.amber,
    Colors.deepPurpleAccent,
  ];
class AppTheme {
final int selectedColor;
AppTheme({this.selectedColor = 0}) 
  :assert(selectedColor >= 0 && selectedColor <= _listOfColors.length-1, 'Los colores deben ser entre 0 a 7');

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _listOfColors[selectedColor]
    );
  }
}