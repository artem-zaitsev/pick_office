import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

/// Цветовая схема приложения
///
/// Цвета именуются также как в фигме
abstract class AppColors {
  static const dark = Color(0xFF1D1D1D);
  static const blue = Color(0xFF3E3EBA);
  static const white = Color(0xFFFFFFFF);

  static final shadowColor = Colors.black.withOpacity(0.2);
}
