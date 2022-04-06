/// Модель конкретного места
class OfficePlace {
  final int id;
  final bool available;
  
  bool chosen = false;

  String get name => '#$id';
  
  OfficePlace({
    required this.id,
    this.available = true,
  });
}
