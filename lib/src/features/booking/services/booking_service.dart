import 'dart:async';

import 'package:pick_office/src/features/booking/domain/booking.dart';
import 'package:pick_office/src/features/booking/domain/office_place.dart';
import 'package:pick_office/src/features/booking/services/storage/booking_storage.dart';

/// Сервис для работы с бронированиями
/// 
/// Дает вохможност получить список как реактивно, так и императивно
class BookingService {
  final BookingStorage _bookingStorage;

  final _controller = StreamController<List<Booking>>.broadcast();

  /// Возможность подписать на изменения списка
  Stream<List<Booking>> get bookingsStream => _controller.stream;

  BookingService(this._bookingStorage);

  /// Бронирование
  ///
  /// По сути сохранение в локальное хранилище
  Future<bool> book(
    OfficePlace place,
    String officeName,
  ) async {
    final bookings = await getBookings();

    final lastId = bookings.isEmpty ? -1 : bookings.reversed.first.id;

    final booking = Booking(
      lastId + 1,
      DateTime.now(),
      officeName,
      place,
    );

    final updated = bookings.reversed.toList()..add(booking);
    _controller.add(updated);

    return _bookingStorage.save(booking);
  }

  /// Получение всех бронирований
  Future<List<Booking>> getBookings() => _bookingStorage.getBookings();
}
