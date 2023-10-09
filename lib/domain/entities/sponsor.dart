class Sponsor {
  final String idSponsor;
  final String name;
  final String? imagePath;
  final bool available;
  final bool isSponsorApp;

  Sponsor(
      {required this.idSponsor,
      required this.name,
      required this.imagePath,
      required this.available,
      required this.isSponsorApp});
}
