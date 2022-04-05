import 'package:pick_office/src/features/booking/domain/office_place.dart';

class Booking {
  final int id;
  final DateTime createdAt;
  final String officeName;
  final OfficePlace place;

  Booking(
    this.id,
    this.createdAt,
    this.officeName,
    this.place,
  );
}
