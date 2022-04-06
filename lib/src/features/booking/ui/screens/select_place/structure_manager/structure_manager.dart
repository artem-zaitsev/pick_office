import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pick_office/src/core/ui/res/app_colors.dart';
import 'package:pick_office/src/features/booking/domain/office_place.dart';

/// Менеджер для обрбаботки свг файла и его раскраски на основе данных с сервера
class StructureManager {
  late DrawableRoot drawable;

  /// Инициализация
  Future<void> init(Uint8List rawData) async {
    drawable = await svg.fromSvgBytes(
      rawData,
      'structure',
    );

    return;
  }

  /// Обновление drawable на основе списка
  void update(List<OfficePlace> places) {
    for (final d in drawable.children.toList()) {
      if (d.id != null && d.id!.isNotEmpty) {
        final place = places.firstWhere(
          (element) => element.id == int.parse(d.id!),
        );

        final newPath = (d as DrawableShape).mergeStyle(
          DrawableStyle(
            fill: DrawablePaint(
              PaintingStyle.fill,
              color: place.available
                  ? place.chosen
                      ? AppColors.green
                      : AppColors.blue
                  : AppColors.mediumGray,
            ),
          ),
        );

        drawable.children.remove(d);
        drawable.children.add(newPath);
      }
    }
  }
}
