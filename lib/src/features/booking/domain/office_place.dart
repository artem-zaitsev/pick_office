class OfficePlace {
  final int id;
  final String name;
  final bool available;

  OfficePlace({
    required this.id,
    required this.name,
    this.available = true,
  });
}
