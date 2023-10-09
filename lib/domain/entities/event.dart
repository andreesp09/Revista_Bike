import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String idEvent;
  final String category;
  final String province;
  final String location;
  final GeoPoint geoLocation;
  final String modality;
  final String name;
  final String imagePath;
  final int startDate;
  final int endDate;
  final bool available;
  final bool isImportanEvent;
  final List<String> sponsorsEvent;

  Event(
      {required this.idEvent,
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
      required this.sponsorsEvent});
}
