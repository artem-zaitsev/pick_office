class OfficePlace {
  final int id;
  final bool available;

  String get name => '#$id';
  
  OfficePlace({
    required this.id,
    this.available = true,
  });
}
