import 'package:flutter/material.dart';
import 'package:pick_office/src/core/ui/res/app_colors.dart';

/// Базовый роут для диалогов
class DialogRoute<T> extends PopupRoute<T> {
  static const opacity = 0.2;

  final Widget? child;

  @override
  Color? get barrierColor => AppColors.dark.withOpacity(opacity);

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'DialogRoute';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  DialogRoute({
    this.child,
  });

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return child ?? const SizedBox.shrink();
  }
}
