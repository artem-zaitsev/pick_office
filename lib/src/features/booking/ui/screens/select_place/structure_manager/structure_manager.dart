import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pick_office/src/core/ui/res/app_colors.dart';
import 'package:pick_office/src/features/booking/domain/office_place.dart';

class StructureManager {
  late DrawableRoot drawable;
  late List<OfficePlace> _places;

  Future<void> init(Uint8List rawData) async {
    drawable = await svg.fromSvgBytes(
      rawData,
      'structure',
    );

    return;
  }

  void update(List<OfficePlace> places) {
    _places = places.toList();

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
