import 'package:flutter/material.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/features/booking/ui/screens/history/history_screen.dart';
import 'package:pick_office/src/features/booking/ui/screens/history/history_vm.dart';

/// Путь к экрану истории
class HistoryRoute extends MaterialPageRoute<void> {
  static const routeName = 'history';

  HistoryRoute()
      : super(
          builder: (context) {
            return const HistoryScreen(
              vm: createVm,
            );
          },
        );
}

HistoryVm createVm(BuildContext context) {
  return HistoryVm(
    errorHandler: ErrorHandler(context),
  );
}
