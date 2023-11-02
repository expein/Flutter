import 'package:flutter/material.dart';

const Color _cunstomColor = Color(0xFF6D17F7);

const List<Color> _colorThemes = [
  _cunstomColor,
  Color(0xFF32E7FF),
  Colors.teal,
  Colors.black87,
  Colors.green,
  Colors.pink,
];

class AppTheme{

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1, 'Los colores deben ser desde 0 a ${_colorThemes.length}');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.dark
    );
  }

}