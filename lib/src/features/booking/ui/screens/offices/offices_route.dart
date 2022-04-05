import 'package:flutter/material.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_screen.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_vm.dart';

class OfficesRoute extends MaterialPage<void> {
  OfficesRoute({
    required OfficesVm vm,
  }) : super(
          child: OfficesScreen(
            vm: vm,
          ),
        );
}
