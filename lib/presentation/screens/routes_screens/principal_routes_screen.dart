import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/screens/00-screens.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';
import 'package:revistabike_app/presentation/widgets/commons/custom_map.dart';

class PrincipalRouteScreen extends ConsumerWidget {
  static const name = 'principal-route-screen';
  const PrincipalRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final List<RouteApp> routes = ref.watch(routesProvider);
    final Config configDB = ref.watch(configDbProvider);
    return Scaffold(
        appBar: CustomAppBar(
            pWidth: maxSizePhone.maxWidth * 0.15,
            pHeight: maxSizePhone.maxHeight * 0.08,
            pIconSize: maxSizePhone.maxHeight * 0.04,
            pColor: theme.primary,
            pOnTap: context.pop),
        body:
            //!Widget referente al listado de tarjetas con todos eventos

            SizedBox(
                width: double.infinity,
                height: maxSizePhone.maxHeight,
                child: FlutterMap(
                  options: MapOptions(
                      center: LatLng(9.934461, -84.103688),
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
                            point: LatLng(9.934461, -84.103688),
                            builder: (context) {
                              return Icon(Icons.place_outlined,
                                  color: theme.error, size: 40);
                            })
                      ],
                    )
                  ],
                )));
  }
}
