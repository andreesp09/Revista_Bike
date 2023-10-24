import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class CustomMap extends ConsumerWidget {
  const CustomMap(
      {Key? key, required this.startGeoPoint, required this.endGeoPoint})
      : super(key: key);

  final GeoPoint startGeoPoint;
  final GeoPoint endGeoPoint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final Config configDB = ref.watch(configDbProvider);
    return FlutterMap(
      options: MapOptions(
          center: LatLng(startGeoPoint.latitude, endGeoPoint.longitude),
          minZoom: 5,
          maxZoom: 18,
          zoom: 15),
      nonRotatedChildren: [
        TileLayer(
          urlTemplate:
              'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
          additionalOptions: {
            'accessToken': configDB.tokenMapBox,
            'id': 'mapbox/streets-v12'
          },
        ),
        MarkerLayer(
          markers: [
            Marker(
                point: LatLng(startGeoPoint.latitude, endGeoPoint.longitude),
                builder: (context) {
                  return Icon(Icons.place_outlined,
                      color: theme.error, size: 40);
                })
          ],
        )
      ],
    );
  }
}
