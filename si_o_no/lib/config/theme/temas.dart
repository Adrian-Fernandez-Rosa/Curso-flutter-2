import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorTemas = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class ColorTemas {
  final int seleccionarColor;

  ColorTemas({this.seleccionarColor = 0})
      : assert(seleccionarColor >= 0 &&
            seleccionarColor <= _colorTemas.length - 1, 'Colores debe estar entre 0 y ${_colorTemas.length}');

 ThemeData temas() {
  return ThemeData(
    useMaterial3: true, colorSchemeSeed: _colorTemas[seleccionarColor]
  );
 }

}
