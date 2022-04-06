import 'package:flutter/material.dart';
import 'package:pick_office/src/core/ui/res/app_colors.dart';

/// Описание текстовых стилей приложения
/// Реализовано наследование стилей, все базируется на базовом _text
///
/// Схема именования:
/// textВЕСsizeРАЗМЕРцветТекста
abstract class AppTextStyles {
  static const _text = TextStyle(
    fontFamily: 'GT Walsheim Pro',
  );

  static final text400 = _text.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final text400size15 = text400.copyWith(
    fontSize: 15,
  );
  static final text400size18 = text400.copyWith(
    fontSize: 18,
  );

  static final text700 = _text.copyWith(
    fontWeight: FontWeight.w700,
  );
  static final text700size18 = text700.copyWith(
    fontSize: 18,
  );
  static final text700size18Dark = text700.copyWith(
    color: AppColors.dark,
  );
  static final text700size18White = text700size18.copyWith(
    color: AppColors.white,
  );
  static final text700size18White60 = text700size18White.copyWith(
    color: AppColors.white.withOpacity(0.6),
  );
}
