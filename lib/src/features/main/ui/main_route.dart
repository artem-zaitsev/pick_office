import 'package:flutter/material.dart';
import 'package:pick_office/src/core/domain/tab_type.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/features/main/ui/main_screen.dart';
import 'package:pick_office/src/features/main/ui/main_vm.dart';

class MainRoute extends MaterialPage<void> {
  static const routeName = '/';

  final TabType selectedTab;

  MainRoute({
    required this.selectedTab,
  }) : super(
          child: MainScreen(
            vm: (ctx) => createMainVm(ctx, selectedTab),
          ),
        );
}

MainVm createMainVm(BuildContext context, TabType selectedTab) {
  return MainVm(
    errorHandler: ErrorHandler(context),
    selectedTab: selectedTab,
  );
}
