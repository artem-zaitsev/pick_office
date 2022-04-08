import 'package:flutter/material.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/di/di.dart';
import 'package:pick_office/src/features/booking/ui/screens/select_place/select_place_screen.dart';
import 'package:pick_office/src/features/booking/ui/screens/select_place/select_place_vm.dart';

class SelectPlaceRoute extends MaterialPageRoute<void> {
  static const routeName = 'select-place/:id';

  final int officeId;

  SelectPlaceRoute({
    required this.officeId,
  }) : super(
          builder: (context) {
            return SelectPlaceScreen(
              vm: (context) => createSelectPlaceVm(context, officeId),
            );
          },
        );
}

SelectPlaceVm createSelectPlaceVm(BuildContext context, int officeId) {
  return SelectPlaceVm(
    context,
    Di.i.officeService,
    officeId,
    Di.i.bookingService,
    errorHandler: ErrorHandler(context),
  );
}
