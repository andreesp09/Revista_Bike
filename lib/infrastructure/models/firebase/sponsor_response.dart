import 'package:cloud_firestore/cloud_firestore.dart';

class SponsorResponse {
  final String? imagePath;
  final bool available;
  final bool isSponsorApp;
  final String id;
  final String nombre;
  final String? imagePathIcon;

  SponsorResponse({
    this.imagePath,
    required this.available,
    required this.isSponsorApp,
    required this.id,
    required this.nombre,
    required this.imagePathIcon,
  });

  Map<String, dynamic> toJson() => {
        "ImagePath": imagePath,
        "Habilitado": available,
        "EsPatrocinadorApp": isSponsorApp,
        "Id": id,
        "Nombre": nombre,
      };

  factory SponsorResponse.fromJson(Map<String, dynamic> json) =>
      SponsorResponse(
        imagePath: json["ImagePath"] ?? '',
        available: json["Habilitado"],
        isSponsorApp: json["EsPatrocinadorApp"],
        id: json["Id"],
        nombre: json["Nombre"],
        imagePathIcon: json["IconoImagePath"],
      );

  factory SponsorResponse.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      SponsorResponse(
        available: doc.data()!["Habilitado"],
        id: doc.id,
        nombre: doc.data()!["Nombre"],
        imagePath: doc.data()?["ImagePath"] ?? '',
        isSponsorApp: doc.data()!["EsPatrocinadorApp"],
        imagePathIcon: doc.data()!["IconoImagePath"] ?? '',
      );
}
