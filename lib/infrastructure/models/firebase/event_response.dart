import 'package:cloud_firestore/cloud_firestore.dart';

class EventResponse {
  final String idEvent;
  final String category;
  final String province;
  final String location;
  final GeoPoint geoLocation;
  final String modality;
  final String name;
  final String? imagePath;
  final String startDate;
  final String endDate;
  final bool available;
  final bool isImportanEvent;
  final List<dynamic>? sponsorsEvent;

  EventResponse({
    required this.idEvent,
    required this.category,
    required this.province,
    required this.location,
    required this.geoLocation,
    required this.modality,
    required this.name,
    required this.imagePath,
    required this.startDate,
    required this.endDate,
    required this.available,
    required this.isImportanEvent,
    required this.sponsorsEvent,
  });

  Map<String, dynamic> toJson() => {
        "Id": idEvent,
        "Categoria": category,
        "Provincia": province,
        "Lugar": location,
        "GeoLocacion": geoLocation,
        "Modalidad": modality,
        "Nombre": name,
        "ImagePath": imagePath,
        "FechaInicio": startDate,
        "FechaFin": endDate,
        "Habilitado": available,
        "EsEventoImportante": isImportanEvent,
        "PatrocinadorEvento": sponsorsEvent,
      };

  factory EventResponse.fromJson(Map<String, dynamic> json) => EventResponse(
      idEvent: json["Id"],
      category: json["Categoria"],
      province: json["Provincia"] ?? 'Por definir',
      location: json["Lugar"] ?? 'Por definir',
      geoLocation: json["GeoLocacion"],
      modality: json["Modalidad"],
      name: json["Nombre"],
      imagePath: json["ImagePath"] ?? '',
      startDate: json["FechaInicio"],
      endDate: json["FechaFin"],
      available: json["Habilitado"],
      isImportanEvent: json["EsEventoImportante"],
      sponsorsEvent: json["PatrocinadorEvento"] ?? []);

  factory EventResponse.fromDocumentSnapshot(
          DocumentSnapshot<Map<dynamic, dynamic>> doc) =>
      EventResponse(
          idEvent: doc.id,
          category: doc.data()!["Categoria"],
          province: doc.data()!["Provincia"],
          location: doc.data()!["Lugar"],
          geoLocation: doc.data()!["GeoLocacion"],
          modality: doc.data()!["Modalidad"],
          name: doc.data()!["Nombre"],
          imagePath: doc.data()!["ImagePath"] ?? '',
          startDate: doc.data()!["FechaInicio"],
          endDate: doc.data()!["FechaFin"],
          available: doc.data()!["Habilitado"],
          isImportanEvent: doc.data()!["EsEventoImportante"],
          sponsorsEvent: doc.data()!["PatrocinadorEvento"]);
}
