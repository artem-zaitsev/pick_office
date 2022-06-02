import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/core/ui/models/entity_state.dart';
import 'package:pick_office/src/core/ui/vm/view_model.dart';
import 'package:pick_office/src/features/booking/domain/office.dart';
import 'package:pick_office/src/features/booking/services/office_service.dart';
import 'package:pick_office/src/features/booking/ui/screens/select_place/select_place_route.dart';
import 'package:pick_office/src/navigation/app_navigation.dart';
import 'package:pick_office/src/navigation/app_router.dart';

/// Вьюмодель списка офисов
class OfficesVm extends ViewModel {
  final OfficeService _officeService;
  final BuildContext _context;

  EntityState<List<Office>> office = EntityState.loading();

  OfficesVm(
    this._officeService,
    this._context, {
    required ErrorHandler errorHandler,
  }) : super(errorHandler: errorHandler);

  @override
  void onInit() {
    super.onInit();

    safe(
      () async {
        final officeList = await _officeService.getOffices();

        office = EntityState.data(officeList);
        notifyListeners();
      },
      onError: (_) {
        office = EntityState.error(data: office.data);
        notifyListeners();
      },
    );
  }

  void selectOffice(Office office) {
    AutoRouter.of(_context).navigate(SelectPlaceScreenRoute(officeId: 1));
    // AutoRouter.of(_context).navigateNamed('/bookings/${office.id}');
    // AppNavigation.router.pushNamed('bookings/${office.id}');
  }
}
