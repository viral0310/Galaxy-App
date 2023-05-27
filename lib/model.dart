class PlanetInfo {
  final double position;
  final String name;
  final String iconImage;
  final String description;
  final String distanceFromSun;
  final String gravity;

  PlanetInfo(
    this.position, {
    required this.name,
    required this.iconImage,
    required this.gravity,
    required this.distanceFromSun,
    required this.description,
  });
}
