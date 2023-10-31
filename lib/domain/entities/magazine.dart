class Magazine {
  final String idMagazine;
  final int edition;
  final String name;
  final String? imagePath;
  final String magazinePath;

  Magazine({
    required this.edition,
    required this.name,
    required this.imagePath,
    required this.magazinePath,
    required this.idMagazine,
  });
}
