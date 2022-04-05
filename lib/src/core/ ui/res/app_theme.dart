import 'package:flutter/material.dart';
import 'package:pick_office/src/core/%20ui/res/app_colors.dart';
import 'package:pick_office/src/core/%20ui/res/app_text_styles.dart';

/// Описание темы приложения(или ее части)
/// 
/// Здесь использован абстрактный класс лишь для упрощения доступа
abstract class AppTheme {
  static final theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.dark,
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
      titleTextStyle: AppTextStyles.text700size18White,
    ),
    backgroundColor: AppColors.white,
    primaryColor: AppColors.dark,
  );
}
