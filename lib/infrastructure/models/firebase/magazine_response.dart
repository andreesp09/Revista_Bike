import 'package:cloud_firestore/cloud_firestore.dart';

class MagazineResponse {
  final String id;
  final String edition;
  final String pathMagazine;
  final String pathPortada;

  MagazineResponse(
      {required this.edition,
      required this.pathMagazine,
      required this.pathPortada,
      required this.id});

  Map<String, dynamic> toJson() => {
        "Edicion": edition,
        "RevistaPath": pathMagazine,
        "Id": id,
        "PortadaPath": pathPortada,
      };

  factory MagazineResponse.fromJson(Map<String, dynamic> json) =>
      MagazineResponse(
          edition: json["Edicion"],
          pathMagazine: json["RevistaPath"],
          id: json["Id"],
          pathPortada: json["PortadaPath"]);

  factory MagazineResponse.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      MagazineResponse(
        edition: doc.data()!["Edicion"],
        id: doc.id,
        pathMagazine: doc.data()!["RevistaPath"],
        pathPortada: doc.data()!["PortadaPath"],
      );
}
