import 'package:flutter/material.dart';

const List<Color> _colorThemes = [
  _customColor,
  Colors.lightBlue,
  Colors.amber,
  Colors.green,
  Colors.redAccent,
  Colors.deepPurpleAccent,
  Colors.red,
  Colors.lightBlueAccent
]; 
const Color _customColor = Color(0xFFE28ABD);

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor}) 
    : assert(selectedColor >= 0 && selectedColor < _colorThemes.length, 
            'Color must be between 0 & ${_colorThemes.length}');

  ThemeData theme(){
      return ThemeData(
        colorSchemeSeed: _colorThemes[selectedColor],
        // brightness: Brightness.dark
      );
  }
}