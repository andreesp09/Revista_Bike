import 'package:cloud_firestore/cloud_firestore.dart';

class RouteApp {
  final String idRoute;
  final bool available;
  final GeoPoint geoStartLocation;
  final GeoPoint geoEndLocation;

  RouteApp({
    required this.idRoute,
    required this.available,
    required this.geoEndLocation,
    required this.geoStartLocation,
  });
}
