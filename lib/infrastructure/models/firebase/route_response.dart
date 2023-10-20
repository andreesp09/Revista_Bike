import 'package:cloud_firestore/cloud_firestore.dart';

class RouteResponse {
  final String idRoute;
  final bool available;
  final GeoPoint geoStartLocation;
  final GeoPoint geoEndLocation;

  RouteResponse({
    required this.idRoute,
    required this.available,
    required this.geoEndLocation,
    required this.geoStartLocation,
  });

  Map<String, dynamic> toJson() => {
        "Id": idRoute,
        "Habilitado": available,
        "GeoLocacionInicio": geoStartLocation,
        "GeoLocacionFin": geoEndLocation,
      };

  factory RouteResponse.fromJson(Map<String, dynamic> json) => RouteResponse(
        idRoute: json["Id"],
        available: json["Habilitado"],
        geoStartLocation: json["GeoLocacionInicio"],
        geoEndLocation: json["GeoLocacionFin"],
      );

  factory RouteResponse.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      RouteResponse(
        available: doc.data()!["Habilitado"],
        idRoute: doc.id,
        geoStartLocation: doc.data()!["GeoLocacionInicio"],
        geoEndLocation: doc.data()?["GeoLocacionFin"] ?? '',
      );
}
