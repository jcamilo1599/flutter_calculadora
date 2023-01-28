import 'package:flutter/material.dart';

class Themes {
  /// Personalizaciones para el tema claro de la aplicación
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
  );

  /// Personalizaciones para el tema obscuro de la aplicación
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
  );
}
