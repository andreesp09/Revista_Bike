import 'package:cloud_firestore/cloud_firestore.dart';

class ConfigResponse {
  final String idBdEventos;
  final String idBdModalidades;
  final String idBdPatrocinadores;
  final String tokenMapBox;

  ConfigResponse(
      {required this.idBdEventos,
      required this.idBdModalidades,
      required this.idBdPatrocinadores,
      required this.tokenMapBox});

  Map<String, dynamic> toJson() => {
        "IdBdEventos": idBdEventos,
        "IdBdModalidades": idBdModalidades,
        "IdBdPatrocinadores": idBdPatrocinadores,
        "MapBoxToken": tokenMapBox,
      };

  factory ConfigResponse.fromJson(Map<String, dynamic> json) => ConfigResponse(
      idBdEventos: json["IdBdEventos"],
      idBdModalidades: json["IdBdModalidades"],
      idBdPatrocinadores: json["IdBdPatrocinadores"],
      tokenMapBox: json["MapBoxToken"]);

  factory ConfigResponse.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      ConfigResponse(
          idBdEventos: doc.data()!["IdBdEventos"],
          idBdModalidades: doc.data()!["IdBdModalidades"],
          idBdPatrocinadores: doc.data()!["IdBdPatrocinadores"],
          tokenMapBox: doc.data()!["MapBoxToken"]);
}
