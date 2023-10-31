import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';
import 'package:revistabike_app/presentation/widgets/commons/custom_map.dart';

class LocationMapScreen extends ConsumerWidget {
  static const name = 'location-map-screen';
  const LocationMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final Event selectedEvent = ref.watch(selectedEventProvider);
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
          child: CustomMap(
              startGeoPoint: selectedEvent.geoLocation,
              endGeoPoint: selectedEvent.geoLocation),
        ));
  }
}
