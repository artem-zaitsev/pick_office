import 'package:hive/hive.dart';
import 'package:pick_office/src/features/booking/domain/booking.dart';
import 'package:pick_office/src/features/booking/domain/office_place.dart';

part 'hive_booking.g.dart';

/// Объект для сохранения данных
@HiveType(typeId: 1)
class HiveBooking extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final DateTime createdAt;

  @HiveField(2)
  final String officeName;

  @HiveField(3)
  final int placeId;

  HiveBooking(this.id, this.createdAt, this.officeName, this.placeId);

  Booking mapToBooking() => Booking(
        id,
        createdAt,
        officeName,
        OfficePlace(id: placeId),
      );
}
