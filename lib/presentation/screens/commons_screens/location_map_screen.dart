import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class LocationMapScreen extends ConsumerWidget {
  static const name = 'location-map-screen';
  const LocationMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final Event selectedEvent = ref.watch(selectedEventProvider);
    final Config configDB = ref.watch(configDbProvider);
    return Scaffold(
        appBar: CustomAppBar(
            pWidth: maxSizePhone.maxWidth * 0.15,
            pHeight: maxSizePhone.maxHeight * 0.1,
            pIconSize: maxSizePhone.maxHeight * 0.04,
            pColor: theme.primary,
            pOnTap: context.pop),
        body: SizedBox(
          width: double.infinity,
          height: maxSizePhone.maxHeight,
          child: FlutterMap(
            options: MapOptions(
                center: LatLng(selectedEvent.geoLocation.latitude,
                    selectedEvent.geoLocation.longitude),
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
                      point: LatLng(selectedEvent.geoLocation.latitude,
                          selectedEvent.geoLocation.longitude),
                      builder: (context) {
                        return Icon(Icons.place_outlined,
                            color: theme.error, size: 40);
                      })
                ],
              )
            ],
          ),
        ));
  }
}
