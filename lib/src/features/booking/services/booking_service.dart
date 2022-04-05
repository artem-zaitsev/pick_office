import 'package:pick_office/src/features/booking/domain/booking.dart';
import 'package:pick_office/src/features/booking/services/storage/booking_storage.dart';

/// Сервис для работы с бронированиями
class BookingService {
  final BookingStorage _bookingStorage;

  BookingService(this._bookingStorage);

  /// Бронирование
  /// 
  /// По сути сохранение в локальное хранилище
  Future<bool> book(Booking booking) {
    return _bookingStorage.save(booking);
  }

  /// Получение всех бронирований
  Future<List<Booking>> getBookings() => _bookingStorage.getBookings();
}
