import 'package:hive_flutter/hive_flutter.dart';
import 'package:pick_office/src/features/booking/domain/booking.dart';
import 'package:pick_office/src/features/booking/services/storage/data/hive_booking.dart';

const _bookingBoxName = 'bookings';

/// Храним ссылку на бокс.
///
/// late - так как она точно должна быть, а не опциональна(nullable)
late final Box<HiveBooking> _box;

class BookingStorage {
  /// Открывает хайв
  ///
  /// Закрывать нет надобности(об этом сказано в доке)
  static Future<void> openBox() async {
    _box = await Hive.openBox(_bookingBoxName);

    return;
  }

  /// Сохраняет данные в хайв
  ///
  /// bool - для удобства тестирования
  Future<bool> save(Booking booking) async {
    if (Hive.isBoxOpen(_bookingBoxName)) {
      await _box.put(
        booking.id,
        HiveBooking(
          booking.id,
          booking.createdAt,
          booking.officeName,
          booking.place.id,
        ),
      );

      return true;
    }

    return false;
  }

  /// Получаем уже доменные модели их бокса
  Future<List<Booking>> getBookings() async {
    return _box.values.map((e) => e.mapToBooking()).toList();
  }
}
