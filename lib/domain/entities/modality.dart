class Modality {
  final String idModality;
  final String name;
  final String? imagePath;
  final bool available;
  final int priority;

  Modality(
      {required this.idModality,
      required this.name,
      required this.imagePath,
      required this.available,
      required this.priority});
}
