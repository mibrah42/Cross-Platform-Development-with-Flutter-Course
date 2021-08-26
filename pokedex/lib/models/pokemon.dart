class Pokemon {
  final String id;
  final String name;
  final List<String> types;
  final int hitPoints;
  final int attack;
  final int defense;
  final int speed;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.hitPoints,
    required this.attack,
    required this.defense,
    required this.speed,
  });
}
