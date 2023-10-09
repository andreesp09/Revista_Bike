import 'package:cloud_firestore/cloud_firestore.dart';

class ModalityResponse {
  final String? imagePath;
  final bool available;
  final String id;
  final String name;
  final String priority;

  ModalityResponse({
    this.imagePath,
    required this.available,
    required this.id,
    required this.name,
    required this.priority,
  });

  Map<String, dynamic> toJson() => {
        "ImagePath": imagePath,
        "Habilitado": available,
        "Id": id,
        "Prioridad": priority,
      };

  factory ModalityResponse.fromJson(Map<String, dynamic> json) =>
      ModalityResponse(
        imagePath: json["ImagePath"] ?? '',
        available: json["Habilitado"],
        id: json["Id"],
        name: json["Nombre"],
        priority: json["Prioridad"],
      );

  factory ModalityResponse.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      ModalityResponse(
        available: doc.data()!["Habilitado"],
        id: doc.id,
        name: doc.data()!["Nombre"],
        priority: doc.data()!["Prioridad"],
        imagePath: doc.data()?["ImagePath"] ?? '',
      );
}
