import 'package:pick_office/src/features/booking/domain/office_place.dart';

class Office {
  final int id;
  final String name;
  final List<OfficePlace> places;

  Office({
    required this.id,
    required this.name,
    required this.places,
  });
}
