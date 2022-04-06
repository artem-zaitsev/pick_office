import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/core/ui/models/entity_state.dart';
import 'package:pick_office/src/core/ui/vm/view_model.dart';
import 'package:pick_office/src/features/booking/domain/office.dart';
import 'package:pick_office/src/features/booking/domain/office_place.dart';
import 'package:pick_office/src/features/booking/services/booking_service.dart';
import 'package:pick_office/src/features/booking/services/office_service.dart';
import 'package:pick_office/src/features/booking/ui/screens/history/history_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/select_place/dialogs/accept_booking_dialog.dart';
import 'package:pick_office/src/features/booking/ui/screens/select_place/structure_manager/structure_manager.dart';
import 'package:pick_office/src/navigation/app_navigation.dart';

///  Вью-модель для экрана выбора места
class SelectPlaceVm extends ViewModel {
  final structureManager = StructureManager();

  final BuildContext _context;
  final OfficeService _officeService;
  final int _officeId;
  final BookingService _bookingService;

  late final _navigator = Navigator.of(_context);

  EntityState<Office> office = EntityState.loading();

  late DrawableRoot drawable = structureManager.drawable;

  OfficePlace? chosenPlace;

  SelectPlaceVm(
    this._context,
    this._officeService,
    this._officeId,
    this._bookingService, {
    required ErrorHandler errorHandler,
  }) : super(errorHandler: errorHandler);

  @override
  void onInit() {
    super.onInit();

    safe(
      () async {
        final struct = await _officeService.getOfficeStructure();
        await structureManager.init(struct);

        final data = await _officeService.getOfficeDetails(_officeId);
        office = EntityState.data(data);

        structureManager.update(office.data!.places);

        notifyListeners();
      },
      onError: (e) {
        office = EntityState.error(data: office.data);

        notifyListeners();
      },
    );
  }

  /// выбор места
  ///
  /// Перекрашивает место в свг
  void tapOnPlace(TapDownDetails details) {
    final offset = details.localPosition;

    var foundId = -1;

    for (final d in drawable.children) {
      final path = d as DrawableShape;
      debugPrint(
        'Check: ${d.id} | d box: ${path.bounds} | offset: $offset',
      );

      if ((path.id != null && path.id!.isNotEmpty) &&
          path.bounds.contains(offset)) {
        foundId = int.tryParse(path.id!) ?? -1;
      }
    }

    if (foundId == -1) {
      chosenPlace = null;
    }

    for (final place in office.data!.places) {
      if (place.id == foundId) {
        place.chosen = true;
        chosenPlace = place;
      } else {
        place.chosen = false;
      }
    }

    structureManager.update(office.data!.places);

    notifyListeners();
  }

  /// Подтверждение выборп
  Future<void> accept() async {
    await _bookingService.book(
      chosenPlace!,
      office.data!.name,
    );

    final oneMore = await _navigator.push(AcceptBookingDialog());

    if (oneMore ?? false) {
      chosenPlace = null;
      for (final place in office.data!.places) {
        place.chosen = false;
      }

      structureManager.update(office.data!.places);
      notifyListeners();
    } else {
      AppNavigation.router.go('/${HistoryRoute.routeName}');
      pop();
    }
  }

  void pop() {
    _navigator.pop();
  }
}
