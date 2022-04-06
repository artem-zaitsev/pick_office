import 'dart:async';

import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/core/ui/models/entity_state.dart';
import 'package:pick_office/src/core/ui/vm/view_model.dart';
import 'package:pick_office/src/features/booking/domain/booking.dart';
import 'package:pick_office/src/features/booking/services/booking_service.dart';

class HistoryVm extends ViewModel {
  final BookingService _bookingService;

  EntityState<List<Booking>> bookings = EntityState.loading();
  late StreamSubscription<List<Booking>> _subscription;

  HistoryVm(
    this._bookingService, {
    required ErrorHandler errorHandler,
  }) : super(errorHandler: errorHandler);

  @override
  void onInit() {
    super.onInit();

    _subscription = _bookingService.bookingsStream.listen(_updateData);

    safe(
      () async {
        final res = await _bookingService.getBookings();

        _updateData(res.reversed.toList());
      },
      onError: (e) {
        bookings = EntityState.error(data: bookings.data);
        notifyListeners();
      },
    );
  }

  @override
  void onDispose() {
    _subscription.cancel();
    super.onDispose();
  }

  void _updateData(List<Booking> res) {
    bookings = EntityState.data(res);
    notifyListeners();
  }
}
