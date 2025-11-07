import 'package:flutter/material.dart';

const Color _customColor = Colors.red;

const List <Color> _colorThemes = [
  _customColor,
  Colors.blueAccent,
  Colors.amber,
  Colors.blueGrey,
  Colors.green,
  Colors.redAccent,
  Colors.deepPurple,
];


class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0}) 
  :assert( selectedColor >= 0 && selectedColor <= _colorThemes.length,'Colors must be betwen 0 and ${_colorThemes.length-1}');



  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]
    );
  }
}