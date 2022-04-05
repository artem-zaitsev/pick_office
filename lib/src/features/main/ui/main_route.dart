import 'package:flutter/material.dart';
import 'package:pick_office/src/features/main/ui/main_screen.dart';
import 'package:pick_office/src/features/main/ui/main_vm.dart';

class MainRoute extends MaterialPage<void> {
  MainRoute({
    required MainVm vm,
  }) : super(
          child: MainScreen(
            vm: vm,
          ),
        );
}
