import 'package:intl/intl.dart';
import 'package:pick_office/src/features/booking/domain/office_place.dart';

final _dateFormat = DateFormat(DateFormat.HOUR24_MINUTE);

class Booking {
  final int id;
  final DateTime createdAt;
  final String officeName;
  final OfficePlace place;
  final String formattedDate;

  String get name => '#$id';
  

  Booking(
    this.id,
    this.createdAt,
    this.officeName,
    this.place,
  ) : formattedDate = _dateFormat.format(createdAt);
}
